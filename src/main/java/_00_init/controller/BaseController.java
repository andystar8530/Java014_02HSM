package _00_init.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import _03_listProducts.model.ProductBean;
import _03_listProducts.service.ProductService;

@Controller
public class BaseController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("ThanksForOrdering")
	protected String thanksForOrdering(Model model) {
		System.out.println("ThanksForOrdering......");
		return "ThanksForOrdering";
	}
	
	
//	@GetMapping("/_00_init/getMemberImage")
//	public ResponseEntity<byte[]>  getMemberImage(@RequestParam("id") String id) {
//		InputStream is = null;
//		OutputStream os = null;
//		String fileName = null;
//		String mimeType = null;
//		byte[] media = null;
//		ResponseEntity<byte[]> responseEntity = null;
//		HttpHeaders headers = new HttpHeaders();
//		MediaType mediaType = null;
//		Blob blob = null;
//		try {
//			MemberBean bean = memberService.queryMember(id);
//			if (bean != null) {
//				blob = bean.getMemberImage();
//				if (blob != null) {
//					is = blob.getBinaryStream();
//				}
//				fileName = bean.getFileName();
//			}
//			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)	
//			if (is == null) {
//				fileName = "NoImage.png" ; 
//				is = servletContext.getResourceAsStream(
//						"/images/" + fileName);
//			}
//			// 由圖片檔的檔名來得到檔案的MIME型態
//			mimeType = servletContext.getMimeType(fileName);
//			ByteArrayOutputStream baos = new ByteArrayOutputStream();
//			// 由InputStream讀取位元組，然後由OutputStream寫出
//			int len = 0;
//			byte[] bytes = new byte[8192];
//			
//			while ((len = is.read(bytes)) != -1) {
//				baos.write(bytes, 0, len);
//			}
//			media = baos.toByteArray();
//			mediaType = MediaType.valueOf(mimeType);
//			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//			headers.setContentType(mediaType);
//			responseEntity =  new ResponseEntity<>(media, headers, HttpStatus.OK);
//		} catch(Exception ex) {
//			ex.printStackTrace();
//			throw new RuntimeException("_00_init.util.RetrieveBookImageServlet#doGet()發生Exception: " + ex.getMessage());
//		} finally{
//			try {
//				if (is != null) is.close();
//			} catch(IOException e) {
//				;
//			}
//			try {
//				if (os != null) os.close();
//			} catch(IOException e) {
//				;
//			}
//		}
//		return responseEntity;
//	}
	// 本方法與前一個方法極為類似，由於兩方法之參數 id 的型態不同，所以無法合而為一
	@GetMapping("/_00_init/getProductImage")
	public ResponseEntity<byte[]> getProductImage(
			@RequestParam("id") Integer id 
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
			ProductBean bean = productService.getProduct(id);
					;
			if (bean != null) {
				blob = bean.getP_Cover();
				if (blob != null) {
					is = blob.getBinaryStream();
				}
				fileName = bean.getP_FileName();
			}
			// 如果圖片的來源有問題，就送回預設圖片(/images/NoImage.png)	
			if (is == null) {
				fileName = "NoImage.png" ; 
				is = servletContext.getResourceAsStream(
						"/data/Image/" + fileName);
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
			byte[] bytes = new byte[8192];
			
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
			throw new RuntimeException("_00_init.util.RetrieveProductImageServlet#doGet()發生Exception: " + ex.getMessage());
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
	
//	http://localhost:8080/dmoeHSM/_00_init/getMemberImage?id=kitty

}
