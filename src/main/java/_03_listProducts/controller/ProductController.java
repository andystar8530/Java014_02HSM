package _03_listProducts.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import _03_listProducts.model.ProductBean;
import _03_listProducts.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@RequestMapping("/DisplayPageProducts")
	public String list(Model model) {
		model.addAttribute("products", service.getAllProducts());
		return "_03_listProducts/listProducts";
	}
	
	@RequestMapping("/queryByCategory")
	public String getCategoryList(Model model) {
		List<String>  list = service.getAllCategories();
		model.addAttribute("categoryList", list);
		return "_03_listProducts/listProducts";
	}

	@RequestMapping("/products/{category}")
	public String getProductsByCategory(@PathVariable("category") String category, Model model){
		List<ProductBean> products = service.getProductsByCategory(category);
		model.addAttribute("products", products);
		return "_03_listProducts/listProducts";
	}
	
	@RequestMapping("/product")
	public String getProductById(@RequestParam("id") Integer id, Model model){
		model.addAttribute("product", service.getProductById(id));
		return "_03_listProducts/product";
	}
}