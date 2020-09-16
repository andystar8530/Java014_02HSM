package _03_listProducts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import _03_listProducts.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/DisplayPageProducts")
	public String list(Model model) {
		
		model.addAttribute("products", productService.getAllProducts());
		
		return "_03_listProducts/listProducts";
	}
	

	
}