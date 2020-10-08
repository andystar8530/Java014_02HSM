package _06_Program.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import _06_Program.model.ProgramBean;
import _06_Program.service.ProgramService;
import _06_Program.validator.ProgramValidator;
import partner_h.partnerInfoEdit_h.model.PartnerBean;

@Controller
@RequestMapping("_06_Program")
@SessionAttributes({ "LoginOK", "programs_DPP","programList","partnerBean","programBean"})
public class ProgramController {

	@Autowired
	ServletContext context;
	@Autowired
	ProgramService service;
	
	@RequestMapping("/showProgramsJson")
	public @ResponseBody List<ProgramBean> list(Model model) {
		List<ProgramBean> programs =service.getAllPrograms();
		model.addAttribute("programs_Json", programs);
		return programs;
	}
	//顯示所有方案
	@RequestMapping("/showPrograms")
	public String getPrograms(Model model) {
		List<ProgramBean>  list=service.getAllPrograms();
		model.addAttribute("programs_DPP", list);
		return "_06_Program/showPrograms";
	}
	
	//顯示單一合作商的所有方案
	@GetMapping("/showProgramsByPid/{prm_Pid}")
	public String getProgramsByPid(Model model,
			@PathVariable Integer prm_Pid
			) {
		List<ProgramBean> programList = service.getProgramsByPid(prm_Pid);
		model.addAttribute("programList", programList);
		return "_06_Program/ProgramsByPid";		
	}
	
	//新增方案(給空白表單)
	@GetMapping(value = "/addProgram")
	public String addProgramForm(Model model) {
		ProgramBean programBean = new ProgramBean();
		model.addAttribute("programBean", programBean);
		return "_06_Program/addProgram";
		
	}
	
	//新增表單(處理表單)
	@PostMapping(value="/addProgram")
	public String processNewProgram(
			Model model , 
			@ModelAttribute ProgramBean programBean,
			BindingResult result			
			) {
		//驗證資料
		ProgramValidator validator = new ProgramValidator();
		validator.validate(programBean, result);

		if(result.hasErrors()) {
			return "_06_Program/addProgram";
		}
		
		
		PartnerBean pb = (PartnerBean) model.getAttribute("partnerBean");
		programBean.setPartnerBean2(pb);
		programBean.setPrm_Category(pb.getP_service());
		programBean.setPrm_Pid(pb.getP_id());
		
		//上傳封面圖
		MultipartFile prm_MultipartImage = programBean.getPrm_MultipartImage();
		String originalFilename = prm_MultipartImage.getOriginalFilename();
		programBean.setPrm_ImageFilename(originalFilename);
		//建立Blob物件，交由hibernate寫入資料庫
		if(prm_MultipartImage != null  && !prm_MultipartImage.isEmpty() ) {
			
			try {
				byte[]b = prm_MultipartImage.getBytes();
				Blob blob = new SerialBlob(b);
				programBean.setPrm_CoverImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("封面圖檔案上傳發生異常"+ e.getMessage());
			}
		}
		service.addProgram(programBean);
		
		return "redirect:/_06_Program/showProgramsByPid/"+ pb.getP_id();
	}
	
	//根據方案key顯示作品集圖片
	@GetMapping("/getProgramImage/{prm_Id}")
	public ResponseEntity<byte[]> getPFDetailImageByKey(
				@PathVariable Integer prm_Id
			) throws Exception{
				ProgramBean programBean = service.getProgramByKey(prm_Id);
				Blob prm_CoverImage = programBean.getPrm_CoverImage();
				String fileName = programBean.getPrm_ImageFilename();
				String mimeType = context.getMimeType(fileName);
				MediaType mType = MediaType.valueOf(mimeType);
				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(mType);
				
				InputStream is = prm_CoverImage.getBinaryStream();
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
			
	//方案管理畫面
		@GetMapping("/programManagement")
		public String managePrograms(
				Model model
				) {
			
			PartnerBean pb = (PartnerBean) model.getAttribute("partnerBean");
			List<ProgramBean> programList = service.getProgramsByPid(pb.getP_id());
			model.addAttribute("programList", programList);
			
			return "/_06_Program/programManagement";
			
		}
		
	//方案編輯
		@GetMapping(value="/editProgram/{prm_Id}")
		public String  editProgram(Model model,
				@PathVariable Integer prm_Id) {
		
			ProgramBean programBean = service.getProgramByKey(prm_Id);
			model.addAttribute("programBean", programBean);
			
			return "/_06_Program/programEdit";
		}
	//方案編輯
		@PostMapping(value="/editProgram/{prm_Id}")
		public String  processEditProgramForm(
				Model model,
				@ModelAttribute ProgramBean programBean,
				BindingResult result
			) {
			//驗證資料
			ProgramValidator validator = new ProgramValidator(false);
			validator.validate(programBean, result);

			if(result.hasErrors()) {
				return "_06_Program/editProgram/"+programBean.getPrm_Pid();
			}
			
			//上傳封面圖
			MultipartFile prm_MultipartImage = programBean.getPrm_MultipartImage();
			String originalFilename = prm_MultipartImage.getOriginalFilename();
			
			//建立Blob物件，交由hibernate寫入資料庫
			if(prm_MultipartImage != null  && !prm_MultipartImage.isEmpty() ) {
				
				try {
					byte[]b = prm_MultipartImage.getBytes();
					Blob blob = new SerialBlob(b);
					programBean.setPrm_ImageFilename(originalFilename);
					programBean.setPrm_CoverImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("封面圖檔案上傳發生異常"+ e.getMessage());
				}
			}
			
			service.updateProgram(programBean);
			model.addAttribute("programBean", programBean);
			
			return "redirect:/_06_Program/programManagement";
		}
		
		
		
		//根據trash圖片的id刪除方案
		@DeleteMapping(value="/deleteProgram/{prm_Id}")
		public String deleteProgram(
				@PathVariable(required = true) Integer prm_Id
				) {
			try {
			service.deleteProgramByKey(prm_Id);
			}catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("刪除方案發生異常"+ e.getMessage());
			}
			return "redirect:/_06_Program/programManagement";
		}
		
		//方案詳細內容
				@GetMapping(value="/ProgramDetail/{prm_Id}")
				public String  ProgramDetail(Model model,
						@PathVariable Integer prm_Id) {
					PartnerBean pb = (PartnerBean) model.getAttribute("partnerBean");
					ProgramBean programBean = service.getProgramByKey(prm_Id);
					model.addAttribute("programBean", programBean);
					model.addAttribute("partnerBean", pb);
					
					return "/_06_Program/programDetails";
				}
		
}
