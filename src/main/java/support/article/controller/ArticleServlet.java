package support.article.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import support.article.model.PlateannouncementBean;
import support.article.service.ArticleInfoService;

@Controller
@RequestMapping("/support")
@SessionAttributes({ "LoginOK", "pageNo" })
public class ArticleServlet {

	@Autowired
	ArticleInfoService articleInfoService;

	@Autowired
	ServletContext servletContext;

	@GetMapping("/bgArticle/index2")
	public String index2() {
		return "support/bgArticle/index2";
	}

	// 抓取新增空白表單(新增公版文)
	@GetMapping("/bgArticle")
	public String getBgPlateann(Model model) {
		PlateannouncementBean plateannouncementBean = new PlateannouncementBean();
		plateannouncementBean.setPaCode("");
		plateannouncementBean.setPaName("");
		plateannouncementBean.setPaContent("");
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
			articleInfoService.saveArticle(bean);
		}

		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
		}

		return "redirect:/support/Plateannouncements";
	}

	@GetMapping("/Plateannouncements")
	public String getbgArticles(Model model) {
		List<PlateannouncementBean> beans = articleInfoService.getArticles();
		model.addAttribute(beans);
		// 若屬性物件為PlateannouncementBean型別的物件，則預設的識別字串 ==>plateannouncementBean
		// 若屬性物件為List<PlateannouncementBean>型別的物件，則預設的識別字串 ==> plateannouncementBeanList
		System.out.println(" getPlateanns...01-15");
		return "support/bgArticle/ShowPlateanns";
	}

	@GetMapping("/modifyPlateannouncement/{paId}")
	public String editPlateannForm(Model model, @PathVariable Integer paId) {
		PlateannouncementBean bean = articleInfoService.getArticleById(paId);
		bean.setPaId(bean.getPaId());
		model.addAttribute("plateannouncementBean", bean);
		return "support/bgArticle/EditPlateannForm";
	}

	@PostMapping("/modifyPlateannouncement/{id2}")
	public String modifyCustomerData2(@ModelAttribute("plateannouncementBean") PlateannouncementBean bean) {
		System.out.println("修改會員(PUT, 11-05): " + bean);
		System.out.println("12345 bean==>" + bean);
		articleInfoService.updateArticle(bean);
		return "redirect: ../Plateannouncements";
	}

	@DeleteMapping(value = "/modifyPlateannouncement/{paId}")
	public String deleteArticleData(@PathVariable Integer paId) {
		articleInfoService.deleteArticleByPrimaryKey(paId);
		return "redirect:../Plateannouncements";
	}

	@ModelAttribute
	public PlateannouncementBean editPlateannouncementBean(
			@RequestParam(value = "paId", required = false) Integer paId) {
		PlateannouncementBean cbean = new PlateannouncementBean();
		if (paId != null) {
			cbean = articleInfoService.getArticleById(paId);
			System.out.println("在@ModelAttribute修飾的方法 getPlateannouncementBean()中，讀到物件:" + cbean);
		} else {
			System.out.println("在@ModelAttribute修飾的方法 getPlateannouncementBean()中，無法讀取物件:" + cbean);
		}
		return cbean;
	}

}
