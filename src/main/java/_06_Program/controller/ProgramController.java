package _06_Program.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _06_Program.model.ProgramBean;
import _06_Program.service.ProgramService;

@Controller
@RequestMapping("_06_Program")
@SessionAttributes({ "LoginOK", "programs_DPP" })
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
	
	@RequestMapping("/showPrograms")
	public String getPrograms(Model model) {
		List<ProgramBean>  list=service.getAllPrograms();
		model.addAttribute("programs_DPP", list);
		return "_06_Program/showPrograms";
	}
	
	
}
