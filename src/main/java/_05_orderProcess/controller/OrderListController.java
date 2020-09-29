package _05_orderProcess.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean;
import _04_ShoppingCart.model.OrderBean;
import _04_ShoppingCart.model.SaleOrderBean;
import _04_ShoppingCart.service.SaleOrderService;

@Controller
@RequestMapping("_05_orderProcess")
@SessionAttributes({ "LoginOK", "pageNo", "products_DPP", "ShoppingCart"})
public class OrderListController {

	@Autowired
	ServletContext context;
	
	@Autowired
	SaleOrderService saleOrderService;
	
	@GetMapping("orderList")
	protected String orderList(Model model) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/login";
		}

		List<SaleOrderBean> memberOrders = saleOrderService.getMemberOrders(memberBean.getM_No());
		model.addAttribute("memberOrders", memberOrders);
		return "_05_orderProcess/OrderList";
	}
	
	@GetMapping("orderDetail")
	protected String orderDetail(Model model, 
			@RequestParam("orderNo") Integer no 
			) {
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/login";
		}

		SaleOrderBean sob = saleOrderService.getOrder(no);
		model.addAttribute("SaleOrderBean", sob);
		return "_05_orderProcess/ShowOrderDetail";
	}
}
