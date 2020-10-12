package support.member.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean;
import support.member.service.BgMemberInfoService;

@Controller
@RequestMapping("/support")
@SessionAttributes({ "LoginOK", "MemberpageNo", "MemberBean" })
public class BgMemberServlet {


	@Autowired
	BgMemberInfoService bgMemberInfoService;

	@Autowired
	ServletContext servletContext;
				  
	@GetMapping("/getBgMemberImage")
	public ResponseEntity<byte[]> getBgMemberImage(@RequestParam("id") Integer id) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		Blob blob = null;
		try {
			MemberBean bean = bgMemberInfoService.getSupMemberById(id);
			if (bean != null) {
				blob = bean.getM_Propic();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getM_FileName();
				System.out.println(fileName);
			}
			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)
			if (is == null) {
				fileName = "NoImage.png";
				is = servletContext.getResourceAsStream("/data/Image/" + fileName);
			}
			// 由圖片檔的檔名來得到檔案的MIME型態
			mimeType = servletContext.getMimeType(fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[8192];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("bgMemberImage發生Exception: " + ex.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
			try {
				if (os != null)
					os.close();
			} catch (IOException e) {
				;
			}
		}
		System.out.println("會員照片顯示");
		return responseEntity;
	}

	@RequestMapping("/bgMember")
	@GetMapping("/bgMember")
	public String getBgMember(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "MemberpageNo", required = false) Integer MemberpageNo) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/login";
		}
		String m_No = memberBean.getM_No().toString();
		if (MemberpageNo == null) {
			MemberpageNo = 1;
			// 讀取瀏覽器送來的所有 Cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				// 逐筆檢視Cookie內的資料
				for (Cookie c : cookies) {
					if (c.getName().equals(m_No + "MemberpageNo")) {
						try {
							MemberpageNo = Integer.parseInt(c.getValue().trim());
						} catch (NumberFormatException e) {
							;
						}
						break;
					}
				}
			}
		}
		Map<Integer, MemberBean> MemberMap = bgMemberInfoService.getSupPageMember(MemberpageNo);
		model.addAttribute("MemberpageNo", String.valueOf(MemberpageNo));
		model.addAttribute("MembertotalPages", bgMemberInfoService.getTotalPages());
		// 將讀到的一頁資料放入request物件內，成為它的屬性物件
		model.addAttribute("supMember_DPP", MemberMap);
		// -----------------------
		Cookie pnCookie = new Cookie(m_No + "MemberpageNo", String.valueOf(MemberpageNo));
		// 設定Cookie的存活期為30天
		pnCookie.setMaxAge(30 * 24 * 60 * 60);
		// 設定Cookie的路徑為 Context Path
		pnCookie.setPath(request.getContextPath());
		// 將Cookie加入回應物件內
		response.addCookie(pnCookie);

		return "support/bgMember/bgMember";

	}

	@PostMapping("/bgMember")
	public String postBgMember(Model model) {
		return "support/bgMember/bgMember";
	}

	@GetMapping("/bgMemberUpdate/{id}")
	public String getBgMemberUpdate(Model model, @PathVariable Integer id) {

		MemberBean memberBean = bgMemberInfoService.getSupMemberById(id);
		model.addAttribute("MemberBean", memberBean);
		return "support/bgMember/bgMemberUpdate";

	}

	// 處理更新
	@PostMapping("/bgMemberUpdate/{id}")
	public String postBgMemberUpdate(Model model, @ModelAttribute("MemberBean") MemberBean memberBean,
			BindingResult bindingResult, @PathVariable Integer id, HttpServletRequest request) {

		MemberBean memberBeanOld = bgMemberInfoService.getSupMemberById(id);


			Timestamp registerTime = new Timestamp(System.currentTimeMillis());
			memberBeanOld.setM_CreateTime(memberBean.getM_CreateTime());
			memberBeanOld.setM_EditTime(registerTime);
			
			memberBeanOld.setM_No(memberBean.getM_No());
			memberBeanOld.setM_Status(memberBean.getM_Status());
			memberBeanOld.setM_Code(memberBean.getM_Code());
			memberBeanOld.setM_Id(memberBean.getM_Id());
			memberBeanOld.setM_Password(memberBean.getM_Password());
			memberBeanOld.setM_Password1(memberBean.getM_Password1());
			memberBeanOld.setM_Name(memberBean.getM_Name());
			memberBeanOld.setM_Email(memberBean.getM_Email());
			memberBeanOld.setM_Phone(memberBean.getM_Phone());
			memberBeanOld.setM_Socialnum(memberBean.getM_Socialnum());
			memberBeanOld.setM_Propic(memberBean.getM_Propic());
			memberBeanOld.setM_FileName(memberBean.getM_FileName());
			memberBeanOld.setM_Add(memberBean.getM_Add());
			memberBeanOld.setM_Availabletime(memberBean.getM_Availabletime());
			bgMemberInfoService.updateSupPageMember(memberBeanOld);
//			return "support/bgMall/bgMall";
		return "redirect:/support/bgMall";
	}

}
