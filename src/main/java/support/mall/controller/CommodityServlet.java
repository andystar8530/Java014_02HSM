package support.mall.controller;

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
import _03_listProducts.model.ProductBean;
import support.mall.service.ProductInfoService;
import support.mall.validator.ProductBeanValidator;

@Controller
@RequestMapping("/support")
@SessionAttributes({ "LoginOK", "MallpageNo", "products_DPP" ,"ProductBean" })
public class CommodityServlet {


	@Autowired
	ProductInfoService productInfoService;

	@Autowired
	ServletContext servletContext;

	@GetMapping("/bgMallAdd")
	public String sendingEmptyForm(Model model) {
		ProductBean productBean = new ProductBean();
//		productBean.setP_Category("沒資料");
//		productBean.setP_Name("沒資料");
//		productBean.setP_Cover(null);
//		productBean.setP_FileName("沒名字");
//		productBean.setP_Pdqty(0);
//		productBean.setP_Pdsum(0);
//		productBean.setP_Stock(0);
//		productBean.setP_Sdqty(0);
//		productBean.setP_Price(0.0);
		productBean.setP_Pic1(null);
		productBean.setP_FileName1("");
		productBean.setP_Pic2(null);
		productBean.setP_FileName2("");
		productBean.setP_Pic3(null);
		productBean.setP_FileName3("");
		productBean.setP_Note("");

		model.addAttribute("ProductBean", productBean);
		return "support/bgMall/bgMallAdd";
	}

	@RequestMapping("/bgMall")
	@GetMapping("/bgMall")
	public String getBgMall(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "MallpageNo", required = false) Integer MallpageNo) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/login";
		}
		String m_No = memberBean.getM_No().toString();
		if (MallpageNo == null) {
			MallpageNo = 1;
			// 讀取瀏覽器送來的所有 Cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				// 逐筆檢視Cookie內的資料
				for (Cookie c : cookies) {
					if (c.getName().equals(m_No + "MallpageNo")) {
						try {
							MallpageNo = Integer.parseInt(c.getValue().trim());
						} catch (NumberFormatException e) {
							;
						}
						break;
					}
				}
			}
		}
		Map<Integer, ProductBean> productMap = productInfoService.getSupPageProducts(MallpageNo);
		model.addAttribute("MallpageNo", String.valueOf(MallpageNo));
		model.addAttribute("MalltotalPages", productInfoService.getTotalPages());
		// 將讀到的一頁資料放入request物件內，成為它的屬性物件
		model.addAttribute("supProducts_DPP", productMap);
		// -----------------------
		Cookie pnCookie = new Cookie(m_No + "MallpageNo", String.valueOf(MallpageNo));
		// 設定Cookie的存活期為30天
		pnCookie.setMaxAge(30 * 24 * 60 * 60);
		// 設定Cookie的路徑為 Context Path
		pnCookie.setPath(request.getContextPath());
		// 將Cookie加入回應物件內
		response.addCookie(pnCookie);

		return "support/bgMall/bgMall";

	}

	@PostMapping("/bgMall")
	public String postBgMall(Model model) {
		return "support/bgMall/bgMall";
	}

	// 控制預覽圖片
	@GetMapping("/p_Cover")
	public ResponseEntity<byte[]> getProductImage(@RequestParam("id") Integer id) {
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
			System.out.println(id);

			ProductBean bean = productInfoService.getSupPageProductsById(id);
			System.out.println(id);

			if (bean != null) {

				blob = bean.getP_Cover();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getP_FileName();
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
			byte[] bytes = new byte[81920];

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
			throw new RuntimeException("拿預設資料庫p_Cover發生Exception: " + ex.getMessage());
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
		System.out.println("預覽圖成功!");
		return responseEntity;
	}

	// 控制預覽圖片p_FileName1
	@GetMapping("/p_Pic1")
	public ResponseEntity<byte[]> getP_Pic1(@RequestParam("id") Integer id) {
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
			System.out.println("id" + id);
			ProductBean bean = productInfoService.getSupPageProductsById(id);
			System.out.println(bean);
			if (bean != null) {
				blob = bean.getP_Pic1();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getP_FileName1();
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
			byte[] bytes = new byte[81920];
			System.out.println("yyyyyyyyyyyyyy");
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
			throw new RuntimeException(
					"_00_init.util.RetrieveProductImageServlet#doGet()發生Exception: " + ex.getMessage());
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
		System.out.println("圖1成功!");
		return responseEntity;
	}

	// 控制預覽圖片p_FileName2
	@GetMapping("/productImage2")
	public ResponseEntity<byte[]> getP_FileName2(@RequestParam("id") Integer id) {
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
			ProductBean bean = productInfoService.getSupPageProductsById(id);
			;
			if (bean != null) {

				blob = bean.getP_Pic2();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getP_FileName2();
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
			byte[] bytes = new byte[81920];

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
			throw new RuntimeException(
					"_00_init.util.RetrieveProductImageServlet#doGet()發生Exception: " + ex.getMessage());
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

	// 控制預覽圖片
	@GetMapping("/productImage3")
	public ResponseEntity<byte[]> getP_FileName3(@RequestParam("id") Integer id) {
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
			ProductBean bean = productInfoService.getSupPageProductsById(id);
			;
			if (bean != null) {

				blob = bean.getP_Pic3();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getP_FileName3();
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
			byte[] bytes = new byte[81920];

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
			throw new RuntimeException(
					"_00_init.util.RetrieveProductImageServlet#doGet()發生Exception: " + ex.getMessage());
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

	@GetMapping("/bgMallUpdate/{id}")
	public String getBgMallUpdate(Model model, @PathVariable Integer id) {

		ProductBean productBean = productInfoService.getSupPageProductsById(id);
		model.addAttribute("ProductBean", productBean);
		return "support/bgMall/bgMallUpdate";
	}

	// 處理更新
	@PostMapping("/bgMallUpdate/{id}")
	public String postBgMallUpdate(Model model, 
			@ModelAttribute("ProductBean") ProductBean productBean,
			BindingResult bindingResult, @PathVariable Integer id, HttpServletRequest request) {

		ProductBean productBeanOld = productInfoService.getSupPageProductsById(id);
		
		ProductBeanValidator ProductBeanValidator = new ProductBeanValidator(false);
		ProductBeanValidator.validate(productBean, bindingResult);
		if (bindingResult.hasErrors()) {
			return "partner_h/partnerInfoEdit_h";
		}
//		預覽圖
		MultipartFile p_Cover = productBean.getP_Cover1();
		if (p_Cover.getSize() == 0) {
			// 抓到如果是空值就不改變
		} else {
			String p_FileName = p_Cover.getOriginalFilename();
			if (p_FileName.length() > 0 && p_FileName.lastIndexOf(".") > -1) {
				productBean.setP_FileName(p_FileName);
				productBeanOld.setP_FileName(productBean.getP_FileName());
			}
			// 建立Blob物件
			if (p_Cover != null && !p_Cover.isEmpty()) {
				try {
					byte[] b = p_Cover.getBytes();
					Blob blob = new SerialBlob(b);
					productBean.setP_Cover(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			System.out.println("存預覽圖");
			productBeanOld.setP_Cover(productBean.getP_Cover());
			System.out.println("存預覽圖成功");
		}
		// 圖1
		MultipartFile picture1 = productBean.getProductImage1();
		if (picture1.getSize() == 0) {
			// 抓到如果是空值就不改變
		} else {
			String p_FileName1 = picture1.getOriginalFilename();
			if (p_FileName1.length() > 0 && p_FileName1.lastIndexOf(".") > -1) {
				productBean.setP_FileName1(p_FileName1);
				productBeanOld.setP_FileName1(productBean.getP_FileName1());
			}
			// 建立Blob物件
			if (picture1 != null && !picture1.isEmpty()) {
				try {
					byte[] b = picture1.getBytes();
					Blob blob = new SerialBlob(b);
					productBean.setP_Pic1(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			System.out.println("圖1");
			productBeanOld.setP_Pic1(productBean.getP_Pic1());
			System.out.println("圖1成功");
		}

//		圖2
		MultipartFile picture2 = productBean.getProductImage2();
		if (picture2.getSize() == 0) {
			// 抓到如果是空值就不改變
		} else {
			String p_FileName2 = picture2.getOriginalFilename();
			if (p_FileName2.length() > 0 && p_FileName2.lastIndexOf(".") > -1) {
				productBean.setP_FileName2(p_FileName2);
				productBeanOld.setP_FileName2(productBean.getP_FileName2());
			}
			// 建立Blob物件
			if (picture2 != null && !picture2.isEmpty()) {
				try {
					byte[] b = picture2.getBytes();
					Blob blob = new SerialBlob(b);
					productBean.setP_Pic2(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			productBeanOld.setP_Pic2(productBean.getP_Pic2());
		}

//		圖3
		MultipartFile picture3 = productBean.getProductImage3();
		if (picture3.getSize() == 0) {
			// 抓到如果是空值就不改變
		} else {
			String p_FileName3 = picture3.getOriginalFilename();
			if (p_FileName3.length() > 0 && p_FileName3.lastIndexOf(".") > -1) {
				productBean.setP_FileName3(p_FileName3);
				productBeanOld.setP_FileName3(productBean.getP_FileName3());
			}
			// 建立Blob物件
			if (picture3 != null && !picture3.isEmpty()) {
				try {
					byte[] b = picture3.getBytes();
					Blob blob = new SerialBlob(b);
					productBean.setP_Pic3(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			productBeanOld.setP_Pic3(productBean.getP_Pic3());
		}

		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		productBeanOld.setP_CreateTime(productBean.getP_CreateTime());
		productBeanOld.setP_UpdataTime(registerTime);
		productBeanOld.setP_Category(productBean.getP_Category());
		productBeanOld.setP_Id(productBean.getP_Id());
		productBeanOld.setP_Name(productBean.getP_Name());
		productBeanOld.setP_Pdqty(productBean.getP_Pdqty());
		productBeanOld.setP_Pdsum(productBean.getP_Pdsum());
		productBeanOld.setP_Stock(productBean.getP_Stock());
		productBeanOld.setP_Sdqty(productBean.getP_Sdqty());
		productBeanOld.setP_Price(productBean.getP_Price());
		productBeanOld.setP_Note(productBean.getP_Note());
		productInfoService.updateSupPageProducts(productBeanOld);
//		return "support/bgMall/bgMall";
		return "redirect:/support/bgMall";
	}


	@PostMapping("/bgMallAdd")
	public String processFormData(@ModelAttribute("ProductBean") ProductBean bean, BindingResult result, Model model,
			HttpServletRequest request) {
		MultipartFile p_Cover = bean.getP_Cover1();
		String p_Cover1 = p_Cover.getOriginalFilename();
		MultipartFile picture1 = bean.getProductImage1();
		String originalFilename1 = picture1.getOriginalFilename();
		MultipartFile picture2 = bean.getProductImage2();
		String originalFilename2 = picture2.getOriginalFilename();
		MultipartFile picture3 = bean.getProductImage3();
		String originalFilename3 = picture3.getOriginalFilename();
		@SuppressWarnings("unused")
		String ext = "";
		if (p_Cover1.lastIndexOf(".") > -1) {
			ext = p_Cover1.substring(p_Cover1.lastIndexOf("."));
		}
		if (p_Cover1.length() > 0 && p_Cover1.lastIndexOf(".") > -1) {
			bean.setP_FileName(p_Cover1);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (p_Cover != null && !p_Cover.isEmpty()) {
			try {
				byte[] b = p_Cover.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setP_Cover(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		if (originalFilename1.lastIndexOf(".") > -1) {
			ext = originalFilename1.substring(originalFilename1.lastIndexOf("."));
		}
		if (originalFilename1.length() > 0 && originalFilename1.lastIndexOf(".") > -1) {
			bean.setP_FileName1(originalFilename1);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture1 != null && !picture1.isEmpty()) {
			try {
				byte[] b = picture1.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setP_Pic1(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		if (originalFilename2.lastIndexOf(".") > -1) {
			ext = originalFilename2.substring(originalFilename2.lastIndexOf("."));
		}
		if (originalFilename2.length() > 0 && originalFilename2.lastIndexOf(".") > -1) {
			bean.setP_FileName2(originalFilename2);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture2 != null && !picture2.isEmpty()) {
			try {
				byte[] b = picture2.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setP_Pic2(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		if (originalFilename3.lastIndexOf(".") > -1) {
			ext = originalFilename3.substring(originalFilename3.lastIndexOf("."));
		}
		if (originalFilename3.length() > 0 && originalFilename3.lastIndexOf(".") > -1) {
			bean.setP_FileName3(originalFilename3);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture3 != null && !picture3.isEmpty()) {
			try {
				byte[] b = picture3.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setP_Pic3(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setP_CreateTime(registerTime);
		bean.setP_UpdataTime(registerTime);

		try {
			productInfoService.saveProduct(bean);
		}

		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("p_Id", "", "發生異常，請通知系統人員..." + ex.getMessage());
			return "support/bgMall/bgMallAdd";
		}

//		return inputDataForm;
		return "redirect:/support/bgMall";
	}

	// 商品刪除
	@RequestMapping("/bgMallDelete/{id}")
	public String getbgMallDelete(Model model, @ModelAttribute("ProductBean") ProductBean productBean,
			BindingResult bindingResult, @PathVariable Integer id, HttpServletRequest request) {
		productInfoService.delete(id);

		return "redirect:/support/bgMall";
	}

}


