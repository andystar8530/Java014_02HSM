package _03_listProducts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"title"})
public class HomeController {
	
	@RequestMapping("/welcome")
	public String Welcome(Model model) {
		model.addAttribute("title","歡迎蒞臨君雅網路商城!!!");
		model.addAttribute("subtitle","網路是獨一無二的購物天堂");
		return "welcome";	//  <== 視圖的邏輯名稱， "welcome" 會被視圖解析器解為
							//"/WEB-INF/views/" + "welcome" + ".jsp"
	}
	
	@RequestMapping("/")
	public String home() {
		return "index";	//  <== 視圖的邏輯名稱， "welcome" 會被視圖解析器解為
						//"/WEB-INF/views/" + "index" + ".jsp"
	}
}
