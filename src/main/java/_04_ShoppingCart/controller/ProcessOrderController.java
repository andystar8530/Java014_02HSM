package _04_ShoppingCart.controller;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import _01_register.model.MemberBean;
import _04_ShoppingCart.model.SaleOrderBean;
import _04_ShoppingCart.model.SaleOrderItemsBean;
import _04_ShoppingCart.model.ShoppingCart;
// OrderConfirm.jsp 呼叫本程式。
import _04_ShoppingCart.service.SaleOrderService;

@Controller
@RequestMapping("_04_ShoppingCart")
@SessionAttributes({ "LoginOK", "ShoppingCart", "OrderErrorMessage"})
public class ProcessOrderController {
	@Autowired
	ServletContext context;
	
	@Autowired
	SaleOrderService saleOrderService;
	
	@PostMapping("ProcessOrder")
	protected String processOrder(Model model, 
			@RequestParam("ShippingAddress") String ShippingAddress,
//			@RequestParam("bNo") String bNo,
//			@RequestParam("s_M_Phone") String s_M_Phone, 
			WebRequest webRequest, SessionStatus status
			) {
		
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean == null) {
			return "redirect:/_02_login/login";
		}
		
		ShoppingCart sc = (ShoppingCart) model.getAttribute("ShoppingCart");
		if (sc == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			return "redirect:/_02_login/login";
		}
		// 如果使用者取消訂單

		Integer m_No = memberBean.getM_No();   						// 取出會員代號
		String m_Name = memberBean.getM_Name();   						// 取出會員名字
		String m_Phone = memberBean.getM_Phone();   						// 取出會員電話
		double totalAmount = Math.round(sc.getSubtotal() * 1.05); 
		Integer s_Status=0;// 計算訂單總金額 
		Date today = new Date();   									// 新增訂單的時間
		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
		SaleOrderBean ob = new SaleOrderBean(null, m_No, totalAmount, ShippingAddress, 
				m_Name, m_Phone, s_Status, today, null ,null);
		
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為SaleOrderItemsBean，
		
		Map<Integer, SaleOrderItemsBean> content = sc.getContent();
		
		Set<SaleOrderItemsBean> items = new LinkedHashSet<>();
		Set<Integer> set = content.keySet();
		for(Integer i : set) {
			SaleOrderItemsBean oib = content.get(i);
			oib.setSaleOrderBean(ob);
			items.add(oib);
		}
		
		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
		ob.setItems(items);  
		try {
			saleOrderService.persistOrder(ob);
//			status.setComplete();
//			webRequest.removeAttribute("ShoppingCart", WebRequest.SCOPE_SESSION);
			System.out.println("Order Process OK");
			return "forward:" + "removeShoppingCart";
		} catch(RuntimeException ex){
			String message = ex.getMessage();
			String shortMsg = "" ;   
			System.out.println("message=" + message);
			shortMsg =  message.substring(message.indexOf(":") + 1);
			System.out.println(shortMsg);
			model.addAttribute("OrderErrorMessage", "處理訂單時發生異常: " + shortMsg  + "，請調正訂單內容" );
			return "redirect:/_04_ShoppingCart/ShowCartContent";
		}
	}
}