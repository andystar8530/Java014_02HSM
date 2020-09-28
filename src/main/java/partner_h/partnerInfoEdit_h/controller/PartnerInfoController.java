package partner_h.partnerInfoEdit_h.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.multipart.MultipartFile;

import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;
import partner_h.partnerInfoEdit_h.validator.PartnerBeanValidator;


@Controller
@SessionAttributes({"LoginOK","partnerBean"})

public class PartnerInfoController {
	
	//等下要呼叫service
	@Autowired
	PartnerService partnerService;
	@Autowired
	MemberService memberSerivce;
	@Autowired
	ServletContext servletContext;
	
	

	
	@GetMapping("/addPartner")
	public String getAddNewPartnerForm(Model model) {
		PartnerBean pb = new PartnerBean();
		model.addAttribute("partnerBean" , pb);
		return "partner_h/addPartner";
	}
	
	
	
	@PostMapping("/addPartner")
	public String ProcessAddPartner(Model model , 
			@ModelAttribute("partnerBean") PartnerBean partnerBean,
			BindingResult result) {
		
		//限制傳入欄位
//		String[] suppressedFields = result.getSuppressedFields();
//		if(suppressedFields.length > 0) {
//			throw new RuntimeException("嘗試傳入不允許的欄位 : " + 
//				StringUtils.arrayToCommaDelimitedString(suppressedFields)
//					);
//		}
//		
		//驗證
		PartnerBeanValidator partnerBeanValidator = new PartnerBeanValidator(true);
		partnerBeanValidator.validate(partnerBean, result);
		if(result.hasErrors()) {
			return "partner_h/addPartner";
		}
		
		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
		partnerBean.setMemberBean(mb);
		partnerBean.setP_mId(mb.getM_No());
		
		
		
		//上傳封面圖
		MultipartFile covImage = partnerBean.getCovImage();
		String originalFilename = covImage.getOriginalFilename();
		partnerBean.setP_covFilename(originalFilename);
		//建立Blob物件，交由hibernate寫入資料庫
		if(covImage != null  && !covImage.isEmpty() ) {
			
			try {
				byte[]b = covImage.getBytes();
				Blob blob = new SerialBlob(b);
				partnerBean.setP_coverPic(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("封面圖檔案上傳發生異常"+ e.getMessage());
			}
		}
		//上傳公司大小章
				MultipartFile staImage = partnerBean.getStaImage();
				String originalFilename2 = staImage.getOriginalFilename();
				partnerBean.setP_staFilename(originalFilename2);
				//建立Blob物件，交由hibernate寫入資料庫
				if(staImage != null  && !staImage.isEmpty() ) {
					
					try {
						byte[]b = staImage.getBytes();
						Blob blob = new SerialBlob(b);
						partnerBean.setP_stamp(blob);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("公司大小章檔案上傳發生異常"+ e.getMessage());
					}
				}
		
		partnerService.savePartner(partnerBean);
		model.addAttribute("partnerBean", partnerBean);	
		return "redirect:/displayPartner";
//		return "displayPartner?p_id=${partnerBean.p_id}";
//		return "partner_h/partner_h";

		
	}
	
//	@InitBinder
//	public void whiteListing(WebDataBinder binder) {
//		binder.setAllowedFields(
//				"p_storeName",
//				"p_info",
//				"p_area",
//				"p_service",
//				"covImage",
//				"staImage",
//				"p_bankAcc",
//				"p_lineId",
//				"p_hRate",
//				"p_mId",
//				"p_createTime",
//				"p_editTime",
//				"memberBean.m_No"
//				
//				);
//		
//	}
//	
	
	@ModelAttribute("serviceList")
	public List<String> getServiceList(Model model) {
		List<String> list = partnerService.getServiceList();
		return list ; 
	}
	
	@GetMapping("/editPartner")
	public String addNewEditPartner(Model model,@RequestParam Integer p_id) {
		PartnerBean partnerBean = partnerService.getPartner(p_id);
		model.addAttribute("partnerBean" , partnerBean);
		return "partner_h/partnerInfoEdit_h";
	}
	
	@PostMapping("/editPartner")
	public String ProcessEditPartner(Model model , 
			@ModelAttribute("partnerBean") PartnerBean partnerBean,
			BindingResult result) {
		PartnerBeanValidator partnerBeanValidator = new PartnerBeanValidator(false);
		partnerBeanValidator.validate(partnerBean, result);
		if(result.hasErrors()) {
			return "partner_h/partnerInfoEdit_h";
		}
		
		//上傳封面圖
		MultipartFile covImage = partnerBean.getCovImage();
		String originalFilename = covImage.getOriginalFilename();
		
		//建立Blob物件，交由hibernate寫入資料庫
		if(covImage != null  && !covImage.isEmpty() ) {
			
			try {
				byte[]b = covImage.getBytes();
				Blob blob = new SerialBlob(b);
				partnerBean.setP_covFilename(originalFilename);
				partnerBean.setP_coverPic(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("封面圖檔案上傳發生異常"+ e.getMessage());
			}
		}
		
		//上傳公司大小章
				MultipartFile staImage = partnerBean.getStaImage();
				String originalFilename2 = staImage.getOriginalFilename();
				//建立Blob物件，交由hibernate寫入資料庫
				if(staImage != null  && !staImage.isEmpty() ) {
					
					try {
						byte[]b = staImage.getBytes();
						Blob blob = new SerialBlob(b);
						partnerBean.setP_staFilename(originalFilename2);
						partnerBean.setP_stamp(blob);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("公司大小章檔案上傳發生異常"+ e.getMessage());
					}
				}
				
		
		partnerService.updatePartner(partnerBean);
		model.addAttribute("partnerBean", partnerBean);
		return "partner_h/partner_h";
	
	}

	@RequestMapping("/displayPartner")
	public String displayPartner(Model model) {
		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
		PartnerBean pb = partnerService.queryPartner(mb.getM_No());
		model.addAttribute("partnerBean", pb);
		return "partner_h/partner_h";
	}
	//顯示圖片(封面圖)
	@GetMapping("/getPartnerCoverImage/{p_id}")
	public ResponseEntity<byte[]> getPartnerCoverImage(
			@PathVariable Integer p_id 
	) {
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
			PartnerBean pb = partnerService.getPartner(p_id);
			if (pb != null) {
				blob = pb.getP_coverPic();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = pb.getP_covFilename();
			}
			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)	
			if (is == null) {
				fileName = "NoImage.png" ; 
				is = servletContext.getResourceAsStream(
						"/images/" + fileName);
			}
			// 由圖片檔的檔名來得到檔案的MIME型態
			mimeType = servletContext.getMimeType(fileName);
//			if (mimeType == null) {
//				if (fileName.endsWith("jfif")) {
//					mimeType = "image/jfif";		
//				}
//			}
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[81920];
			
			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity =  new ResponseEntity<>(media, headers, HttpStatus.OK);
			
		} catch(Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("getCoverImage#doGet()發生Exception: " + ex.getMessage());
		} finally{
			try {
				if (is != null) is.close();
			} catch(IOException e) {
				;
			}
			try {
				if (os != null) os.close();
			} catch(IOException e) {
				;
			}
		}
		return responseEntity;
	}
	@GetMapping("/getPartnerStampImage/{p_id}")
	public ResponseEntity<byte[]> getProductImage(
			@PathVariable Integer p_id 
	) {
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
			PartnerBean pb = partnerService.getPartner(p_id);
					;
			if (pb != null) {
				blob = pb.getP_stamp();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = pb.getP_staFilename();
			}
			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)	
			if (is == null) {
				fileName = "NoImage.png" ; 
				is = servletContext.getResourceAsStream(
						"/images/" + fileName);
			}
			// 由圖片檔的檔名來得到檔案的MIME型態
			mimeType = servletContext.getMimeType(fileName);
//			if (mimeType == null) {
//				if (fileName.endsWith("jfif")) {
//					mimeType = "image/jfif";		
//				}
//			}
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[81920];
			
			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity =  new ResponseEntity<>(media, headers, HttpStatus.OK);
			
		} catch(Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("getStampImageServlet#doGet()發生Exception: " + ex.getMessage());
		} finally{
			try {
				if (is != null) is.close();
			} catch(IOException e) {
				;
			}
			try {
				if (os != null) os.close();
			} catch(IOException e) {
				;
			}
		}
		return responseEntity;
	}
	
	
	
}
