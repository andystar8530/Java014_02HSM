package support.article.controller;

import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import support.article.model.PlateannouncementBean;
import support.article.service.ArticleInfoService;

@Controller
@RequestMapping("/support")
@SessionAttributes({ "LoginOK", "pageNo" })
public class ArticleServlet {


	@Autowired
	ArticleInfoService ArticleInfoService;

	@Autowired
	ServletContext servletContext;

	// 抓取新增空白表單(新增公版文)
	@GetMapping("/bgArticle")
	public String getBgPlateann(Model model) {
		PlateannouncementBean plateannouncementBean = new PlateannouncementBean();
		plateannouncementBean.setPaName("");
		plateannouncementBean.setPaContent(null);
		model.addAttribute("PlateannouncementBean", plateannouncementBean);
		return "support/bgArticle/Plateann";

	}

	// 存入新增表單(新增公版文)
	@PostMapping("/bgArticle")
	public String postBgPlateann(@ModelAttribute("PlateannouncementBean") PlateannouncementBean bean,
			BindingResult result, Model model, HttpServletRequest request) {
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setPaDate(registerTime);
		bean.setPaEnDate(registerTime);
		try {
			ArticleInfoService.saveArticle(bean);
		}

		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
		}

		return "redirect:/support/bgMall";
	}
	

	

}
