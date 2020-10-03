package partner_h._01_profolios.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

import partner_h._01_profolios.model.PortfoliosDetailsBean;
import partner_h._01_profolios.service.PortfoliosDetailsService;

@Controller
@SessionAttributes({"partnerBean","portfoliosAll","portfolios","portfoliosBean","portfolioDetailsBean","pfBeanList"})
public class PFDetailController {

	@Autowired 
	PortfoliosDetailsService pfdService;
	@Autowired
	ServletContext servletContext;
	
	
	
	//根據圖片key顯示作品集圖片
		@GetMapping("/getPFDetailImage/{pfdId}")
		public ResponseEntity<byte[]> getPFDetailImageByKey(
				@PathVariable Integer pfdId
				) throws Exception{
			PortfoliosDetailsBean pfdBean = pfdService.getPortfolioDetailsBypfdId(pfdId);
			Blob pfdPic = pfdBean.getPfdPic();
			String fileName = pfdBean.getPfdName();
			String mimeType = servletContext.getMimeType(fileName);
			MediaType mType = MediaType.valueOf(mimeType);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(mType);
			
			InputStream is = pfdPic.getBinaryStream();
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[]b = new byte[81920];
			int len = 0 ;
			while((len = is.read(b))!= -1){
				baos.write(b, 0, len);
			}
			//byte[] ba回應本體形式
			byte[]ba = baos.toByteArray();// 轉成位元組陣列   
			ResponseEntity<byte[]> re = new ResponseEntity<>(ba,headers,HttpStatus.OK);
			return re ; 
		}
		
		
	
}
