package partner_h._01_profolios.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Binding;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import partner_h._01_profolios.model.PortfoliosBean;
import partner_h._01_profolios.model.PortfoliosDetailsBean;
import partner_h._01_profolios.service.PortfoliosDetailsService;
import partner_h._01_profolios.service.PortfoliosService;

@Controller
@SessionAttributes({"partnerBean","portfoliosAll","portfolios","portfoliosBean","portfolioDetailsBean","pfBeanList","pfdBeanList",})
public class PFDetailController {

	@Autowired 
	PortfoliosDetailsService pfdService;
	@Autowired
	ServletContext servletContext;
	@Autowired
	PortfoliosService pfService;
	
	
	
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
		
		//進入圖片編輯畫面
		@GetMapping(value="portfolioPicEdit/{pfmId}")
		public String editPortfolioPic(Model model , 
				@PathVariable Integer pfmId
				) {
			PortfoliosBean portfoliosBean = pfService.getPortfolioById(pfmId);			
			List<PortfoliosDetailsBean> pfdBeanList = pfdService.getPfDetailsBypfmId(pfmId);
			model.addAttribute("portfoliosBean", portfoliosBean);
			model.addAttribute("pfdBeanList", pfdBeanList);
			
			PortfoliosDetailsBean portfolioDetailsBean = new PortfoliosDetailsBean();
			model.addAttribute("portfolioDetailsBean", portfolioDetailsBean);
			
			//取得上傳圖片新表單
			
			return "partner_h/_01_portfolios/editPortfolioPic";
		}
		
		//編輯畫面上傳圖片(處理form)
		@PostMapping(value="portfolioPicEdit/{pfmId}")
		public String processAddPicForm
				(@ModelAttribute("portfolioDetailsBean") PortfoliosDetailsBean portfolioDetailsBean,
				BindingResult result,
				HttpServletRequest request,
				Model model,
				@PathVariable Integer pfmId) {
			
			portfolioDetailsBean.setPortfoliosBean(pfService.getPortfolioById(pfmId));
			//圖片
			List<MultipartFile> files = portfolioDetailsBean.getPortfoliosImages();
//			System.out.println("取得圖片結束");
			System.out.println("files = " + files);
			List<String> fileNames = new ArrayList<>();
			
			if(files != null && files.size()>0) {
				System.out.println("files != null" + files);
				for(MultipartFile multipartFile : files) {
					String fileName = multipartFile.getOriginalFilename();
					fileNames.add(fileName);
					
					portfolioDetailsBean.setPfdName(fileName);
					//建立Blob物件，交由hibernate寫入資料庫
					if(multipartFile != null  && !multipartFile.isEmpty() ) {
						
						try {
							byte[]b = multipartFile.getBytes();
							Blob blob = new SerialBlob(b);
							portfolioDetailsBean.setPfdPic(blob);
						} catch (Exception e) {
							e.printStackTrace();
							throw new RuntimeException("圖片上傳發生異常"+ e.getMessage());
						}
					}
					pfdService.addPortfolioDetails(portfolioDetailsBean);
				}
			}
			
			model.addAttribute("pfdBeanList", pfdService.getPfDetailsBypfmId(pfmId));
			
			return "partner_h/_01_portfolios/editPortfolioPic";
		}
				
	//編輯畫面刪除圖片
	@DeleteMapping(value="/portfolioImage")
	public  String deletePortfolioPic(
			@RequestBody String deleteItems
			) {
		System.out.println(deleteItems);
		String str = URLDecoder.decode(deleteItems);
		String[] deleteStr = str.substring(12,str.length()).split(",");

		
		System.out.println(deleteStr.toString());
		for(int i = 0 ; i<deleteStr.length ; i++) {
			try {
			String item = 	deleteStr[i].substring(1,deleteStr[i].length()-1);
			int pfdId = Integer.parseInt(item);
			pfdService.deletePortfolioDetail(pfdService.getPortfolioDetailsBypfdId(pfdId));
			}catch(Exception e ) {
				e.printStackTrace();
				throw new RuntimeException("刪除作品集圖片發生異常"+ e.getMessage());
			}
		}
		
		return "partner_h/_01_portfolios/editPortfolioPic";
		
	}
	
	
	
	
}
