package partner.quotecontract.template.controller;

import java.beans.beancontext.BeanContextServiceProviderBeanInfo;
import java.io.IOException;
import java.sql.Clob;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import partner.quotecontract.template.model.ContractTemplateBean;
import partner.quotecontract.template.service.TemplateService;
import partner.quotecontract.template.service.impl.TemplateServiceImpl;

@WebServlet("/partner/ContractTemplateUpdate.do")
@MultipartConfig
public class ContractTemplateUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ContractTemplateBean ctb;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	} 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		TemplateService service = new TemplateServiceImpl();
		int p_MId =0;
		String ctContent ="";
//		取出Form中的欄位
		Collection<Part> parts = request.getParts();
		if(parts != null) {
			for(Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);
				if(p.getContentType()==null) {
					if(fldName.equals("p_MId")) {
						p_MId = Integer.parseInt(value);
						System.out.println("p_MId = "+p_MId);
					}else if(fldName.equals("ctContent")){
						ctContent=value;
						System.out.println("ctContent = "+ctContent);
					}
				}				
			}
			//封裝物件
			ContractTemplateBean ctb = new ContractTemplateBean(p_MId,ctContent);
			//透過saveContractTemplate()方法寫入資料庫
			int n = service.saveContractTemplate(ctb);
			if(n==1) {
				session.setAttribute("bean", Integer.parseInt(request.getParameter("p_MId")));
				System.out.println("修改成功");
				System.out.println("p_MId"+request.getParameter("p_MId"));
				request.getRequestDispatcher("/partner/contractTemplate.jsp").forward(request, response);
				return;
			}else {
				System.out.println("修改此筆資料有誤(EditPartnerInfoServlet)");
			}
		}
		
		}
	}

