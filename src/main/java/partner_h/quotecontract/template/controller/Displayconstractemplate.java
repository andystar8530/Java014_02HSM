package partner.quotecontract.template.controller;

import java.beans.beancontext.BeanContextServiceProviderBeanInfo;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ch01_h_register.model.MemberBean;
import partner.partnerInfoEdit.dao.PartnerDao;
import partner.partnerInfoEdit.dao.Impl.PartnerDaoImpl_Jdbc;
import partner.partnerInfoEdit.model.PartnerBean;
import partner.quotecontract.template.dao.ContractTemplateDao;
import partner.quotecontract.template.dao.impl.ContractTemplateDaoImpl_Jdbc;
import partner.quotecontract.template.model.ContractTemplateBean;

@WebServlet("/displayconstractemplate.do")
public class Displayconstractemplate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		if (session == null) {      // 使用逾時
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}

//正常程式		
		ContractTemplateDao daoCT = new ContractTemplateDaoImpl_Jdbc();
		PartnerDao daoPD = new PartnerDaoImpl_Jdbc();
//		 登入成功後，Session範圍內才會有LoginOK對應的MemberBean物件
		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
		PartnerBean pb = daoPD.getPartner(mb.getM_No());
		
		ContractTemplateBean bean = daoCT.getContractTemplateBean(pb.getP_mId());
		
		session.setAttribute("contractTemplateBean",bean);
		System.out.println("pb.getP_mId="+pb.getP_mId());
		System.out.println("bean.getCtContent()= "+bean.getCtContent());
		System.out.println("bean.getP_MId() = "+bean.getP_MId());
		RequestDispatcher rd = request.getRequestDispatcher("/partner/contractTemplate.jsp");
		rd.forward(request, response);
		return;
	}
	
	
	
}
