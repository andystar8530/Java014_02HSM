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
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean;
import _04_forum.model.CategoriesBean;
import _04_forum.model.CommentBean;
import _04_forum.model.ForumBean;
import _04_forum.service.ForumService;
import _04_forum.validator.ForumBeanValidator;

@Controller
@RequestMapping("/_04_forum")
@SessionAttributes({"LoginOK"})
public class ForumController {

	@Autowired
	ForumService service;

	@Autowired
	ForumBeanValidator forumBeanValidator;
	
	@RequestMapping("posts")
	public String list(
			Model model,
			@RequestParam(value = "pageNo" ,required = false) Integer pageNo
			) {
		if(pageNo==null) {
			pageNo=1;
		}
		List<ForumBean> list = service.getPostPage(pageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPage", service.lastPage());
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
			Model model,
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
		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
		fb.setMemberBean(mb);
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
	
	@GetMapping("post")
	public String getPostById(
			@RequestParam("id") Integer id,
			Model model
			) {
		CommentBean cb = new CommentBean();
		model.addAttribute("formCb", cb);
		model.addAttribute("post", service.getPostById(id));
		model.addAttribute("getComments", service.getCommentById(id));
		return "_04_forum/post";
	}
	
	@PostMapping("post")
	public String insertComment(
			Model model,
			@ModelAttribute("formCb") CommentBean cb
			) {
		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
		cb.setMemberBean(mb);
		service.addComment(cb);
		model.addAttribute("post", service.getPostById(cb.getPostId()));
		model.addAttribute("getComments", service.getCommentById(cb.getPostId()));
		return "_04_forum/post";
	}
	
}
