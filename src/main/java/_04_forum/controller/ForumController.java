package _04_forum.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import _04_forum.model.CategoriesBean;
import _04_forum.model.ForumBean;
import _04_forum.service.ForumService;
import _04_forum.validator.ForumBeanValidator;

@Controller
@RequestMapping("/_04_forum")
public class ForumController {

	@Autowired
	ForumService service;

	@Autowired
	ForumBeanValidator forumBeanValidator;
	
	@RequestMapping("posts")
	public String list(Model model) {
		List<ForumBean> list = service.getAllPosts();
		model.addAttribute("posts", list);
		return "_04_forum/posts";
	}
	
	@GetMapping("/post/add")
	public String getAddNewPostForm(Model model) {
		ForumBean fb = new ForumBean();
		model.addAttribute("forumBean", fb);
		return "/_04_forum/addpost";
	}
	
	@PostMapping("/post/add")
	public String proccessAddNewPostForm(
			@ModelAttribute("forumBean") ForumBean fb,
		     BindingResult bindingResult
			) {
		String[] suppressedFields = bindingResult.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		forumBeanValidator.validate(fb,bindingResult);
		if(bindingResult.hasErrors()) {
			return "/_04_forum/addpost";
		}
		service.addPost(fb);
		return "redirect:/_04_forum/posts";
	}
	
	@ModelAttribute("categoryList")
	public Map<Integer, String> getCategoryList(){
		Map<Integer, String> categoryMap = new HashMap<>();
		List<CategoriesBean> list = service.getCategoryList();
		for(CategoriesBean cb:list) {
			categoryMap.put(cb.getPcNo(), cb.getPcType());
		}
		return categoryMap;
	}
	
	@RequestMapping("post")
	public String getPostById(
			@RequestParam("id") Integer id,
			Model model
			) {
		model.addAttribute("post", service.getPostById(id));
		return "_04_forum/post";
	}
	
}
