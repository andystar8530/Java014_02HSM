package partner_h.partnerInfoEdit_h.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import partner_h.partnerInfoEdit_h.service.PartnerService;

@Controller
public class PartnerInfoController {
	
	//等下要呼叫service
	@Autowired
	PartnerService productService;
	
//	@RequestMapping("/products")
//	public String list(Model model) {
//		
////		List<BookBean> list = productService.getAllProducts();
////		model.addAttribute("products", list);
//		
//		model.addAttribute("products", productService.getAllProducts());
//
//		return "products";
//	}
//	
//	@RequestMapping("/update/stock")
//	public String updateStock(Model model) {
//		productService.updateAllStock();
//		return "redirect:/products";
//	}
//	
////	@RequestMapping(value="/demp/12/34/56" , method = RequestMethod.GET)
//	@GetMapping("/demp/{aa}/{bb}/{cc}")
//	public String pvDemp(Model model , 
//			@PathVariable("aa")Integer a , 
//			@PathVariable("bb")Integer b ,
//			@PathVariable("cc")Integer c ) {
//		System.out.println("找到對應的控制器...., a ="+a +",b = "+b +",c = "+ c);
//		return "redirect:/products";
//	}
//
//	@GetMapping("/queryByCategory")
//	public String getCategoryList(Model model) {
//		List<String> list = productService.getAllCategory();
//		model.addAttribute("categoryList", list);
//		return "types/category";
//	}
////	<a href='products/${category}'>
//	@GetMapping("/products/{category}")
//	public String getProductsByCategory(@PathVariable("category") String category, Model model) {
//		List<BookBean> products = productService.getProductsByCategory(category);
//		model.addAttribute("products", products);
//		return "products";
//	}
//	
//	
////	@RequestMapping("/product?id=5")	
//	@RequestMapping("/product")
//	public String getProductsById(@RequestParam("id") Integer id , Model model ) {
//		model.addAttribute("product",productService.getProductById(id));
//		return "product";
//		
//	}
//	
//	//新增產品需增加4個方法
//	@GetMapping("/products/add")
////	@RequestMapping(value="/products/add", method = RequestMethod.GET)
//	public String getAddNewProductForm(Model model) {
//		BookBean bb = new BookBean();
//		model.addAttribute("bookBean", bb);
//		return "addProduct";
//	}
//	
//	@PostMapping("/products/add")
//	public String processAddNewProductForm(@ModelAttribute("bookBean") BookBean bb) {
//		if(bb.getStock() == null) {
//			bb.setStock(0);
//		}
//		bb.setDiscount(1.0);
//		productService.addProduct(bb);
//		return "redirect:/products";
//	}
//	
//	@ModelAttribute("companyList")
//	public Map<Integer,String> getCompanyList(){
//		System.out.println("111111111111111");
//		Map<Integer,String> companyMap = new HashMap<>();
//		List<CompanyBean> list = productService.getCompanyList();
//		for(CompanyBean cb :list) {
//			companyMap.put(cb.getId(), cb.getName());
//		}
//		return companyMap ; 
//	}
//	@ModelAttribute("categoryList")
//	public List<String> getCategoryList(){
//		System.out.println("22222222222");
//		return productService.getAllCategory();
//	}
//	@RequestMapping("/")
//	public String home() {
//		return"index";
//	}
	
	}
