package _03_listProducts.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean;
import _03_listProducts.model.ProductBean;
import _03_listProducts.service.ProductService;

@Controller
@RequestMapping("_03_listProducts")
@SessionAttributes({ "LoginOK", "pageNo", "products_DPP" })
public class RetrieveProductController {
	static int x = 0;
	public static final int RECORDS_PER_PAGE = 2;
	@Autowired
	ServletContext context;
	@Autowired
	ProductService service;
	
	@GetMapping("/DisplayPageProducts")
	public String getPageProduct(Model model, 
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "pageNo", required = false) Integer pageNo 
			) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/login";
		}
//		String m_Id = memberBean.getM_Id();
		String m_No = memberBean.getM_No().toString();
		if (pageNo == null) {
			pageNo = 1;
			// 讀取瀏覽器送來的所有 Cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				// 逐筆檢視Cookie內的資料
				for (Cookie c : cookies) {
//					if (c.getName().equals(m_Id + "pageNo")) {
					if (c.getName().equals(m_No + "pageNo")) {
						try {
							pageNo = Integer.parseInt(c.getValue().trim());
						} catch (NumberFormatException e) {
							;
						}
						break;
					}
				}
			}
		}
		Map<Integer, ProductBean> productMap = service.getPageProducts(pageNo);
		model.addAttribute("pageNo", String.valueOf(pageNo));
		model.addAttribute("totalPages", service.getTotalPages());
		// 將讀到的一頁資料放入request物件內，成為它的屬性物件
		model.addAttribute("products_DPP", productMap);
		// 使用Cookie來儲存目前讀取的網頁編號，Cookie的名稱為m_Id + "pageNo"
		// 使用Cookie來儲存目前讀取的網頁編號，Cookie的名稱為m_No + "pageNo"
		// -----------------------
//		Cookie pnCookie = new Cookie(m_Id + "pageNo", String.valueOf(pageNo));
		Cookie pnCookie = new Cookie(m_No + "pageNo", String.valueOf(pageNo));
		// 設定Cookie的存活期為30天
		pnCookie.setMaxAge(30 * 24 * 60 * 60);
		// 設定Cookie的路徑為 Context Path
		pnCookie.setPath(request.getContextPath());
		// 將Cookie加入回應物件內
		response.addCookie(pnCookie);

		return "_03_listProducts/listProducts";
	}
	
	@RequestMapping("/DisplayPageProducts2")
	public String list(Model model) {
		model.addAttribute("products", service.getAllProducts());
		return "_03_listProducts/listProducts2";
	}
	
	@RequestMapping("/queryByCategory")
	public String getCategoryList(Model model) {
		List<String>  list = service.getAllCategories();
		model.addAttribute("categoryList", list);
		return "_03_listProducts/listProducts2";
	}

	@RequestMapping("/products/{category}")
	public String getProductsByCategory(@PathVariable("category") String category, Model model){
		List<ProductBean> products = service.getProductsByCategory(category);
		model.addAttribute("products", products);
		return "_03_listProducts/listProducts2";
	}
	
	@RequestMapping("/product")
	public String getProductById(@RequestParam("id") Integer id, Model model){
		model.addAttribute("product", service.getProductById(id));
		return "_03_listProducts/product2";
	}
}