package support.program.controller;

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
import _06_Program.model.ProgramBean;
import support.program.service.BgProgramInfoService;

@Controller
@RequestMapping("/support")
@SessionAttributes({ "LoginOK", "ProgrampageNo", "ProgramBean" })
public class BgProgramServlet {

	@Autowired
	BgProgramInfoService bgProgramInfoService;

	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/bgProgramImage")
	public ResponseEntity<byte[]> bgProgramImage(@RequestParam("id") Integer id) {
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
			ProgramBean bean = bgProgramInfoService.getSupProgramById(id);
			;
			if (bean != null) {
				blob = bean.getPrm_CoverImage();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getPrm_ImageFilename();
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
		return responseEntity;
	}

	@GetMapping("/bgMain")
	public String getBgProgram(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "ProgrampageNo", required = false) Integer ProgrampageNo) {
//		ProgramBean programBean = (ProgramBean) model.getAttribute("LoginOK");
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/login";
		}
		String m_No = memberBean.getM_No().toString();
		if (ProgrampageNo == null) {
			ProgrampageNo = 1;
			// 讀取瀏覽器送來的所有 Cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				// 逐筆檢視Cookie內的資料
				for (Cookie c : cookies) {
					if (c.getName().equals(m_No + "ProgrampageNo")) {
						try {
							ProgrampageNo = Integer.parseInt(c.getValue().trim());
						} catch (NumberFormatException e) {
							;
						}
						break;
					}
				}
			}
		}
		Map<Integer, ProgramBean> ProgramMap =  bgProgramInfoService.getSupPageProgram(ProgrampageNo);
		model.addAttribute("ProgrampageNo", String.valueOf(ProgrampageNo));
		model.addAttribute("ProgramtotalPages", bgProgramInfoService.getTotalPages());
		// 將讀到的一頁資料放入request物件內，成為它的屬性物件
		model.addAttribute("supProgram_DPP", ProgramMap);
		// -----------------------
		Cookie pnCookie = new Cookie(m_No + "ProgrampageNo", String.valueOf(ProgrampageNo));
		// 設定Cookie的存活期為30天
		pnCookie.setMaxAge(30 * 24 * 60 * 60);
		// 設定Cookie的路徑為 Context Path
		pnCookie.setPath(request.getContextPath());
		// 將Cookie加入回應物件內
		response.addCookie(pnCookie);

		return "support/bgMain/bgMain";
	}

	@PostMapping("/bgMain")
	public String postBgMain(Model model) {
		return "support/bgMain/bgMain";
	}
	
	@GetMapping("/bgMainUpdate/{id}")
	public String getBgMainUpdate(Model model, @PathVariable Integer id) {

		ProgramBean programBean = bgProgramInfoService.getSupProgramById(id);
		model.addAttribute("ProgramBean", programBean);
		System.out.println("aaaaaa");
		return "support/bgMain/bgMainUpdate";

	}

	// 處理更新
	@PostMapping("/bgMainUpdate/{id}")
	public String postBgMainUpdate(Model model, @ModelAttribute("ProgramBean") ProgramBean programBean,
			BindingResult bindingResult, @PathVariable Integer id, HttpServletRequest request) {

		ProgramBean programBeanOld = bgProgramInfoService.getSupProgramById(id);


			Timestamp registerTime = new Timestamp(System.currentTimeMillis());
			programBeanOld.setPrm_Createdate(programBean.getPrm_Createdate());
			programBeanOld.setPrm_Editdate(registerTime);
			
			programBeanOld.setPrm_Title(programBean.getPrm_Title());
			programBeanOld.setPrm_Category(programBean.getPrm_Category());
			programBeanOld.setPrm_Price(programBean.getPrm_Price());
			programBeanOld.setPrm_Content(programBean.getPrm_Content());
			programBeanOld.setPrm_Detail(programBean.getPrm_Detail());
			programBeanOld.setPrm_Status(programBean.getPrm_Status());
			programBeanOld.setPrm_CoverImage(programBean.getPrm_CoverImage());
			programBeanOld.setPrm_ImageFilename(programBean.getPrm_ImageFilename());
			System.out.println("1111員裝箱結束");
			bgProgramInfoService.updateSupPageProgram(programBeanOld);
//			return "support/bgMall/bgMall";
		return "redirect:/support/bgMall";
	}

}
