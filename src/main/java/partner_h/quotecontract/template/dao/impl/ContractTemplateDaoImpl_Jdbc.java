package partner_h.quotecontract.template.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import partner_h.quotecontract.template.dao.ContractTemplateDao;
import partner_h.quotecontract.template.model.ContractTemplateBean;

public class ContractTemplateDaoImpl_Jdbc  implements ContractTemplateDao{
	private DataSource ds = null;

	
	public ContractTemplateDaoImpl_Jdbc() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(DBService.JNDI_DB_NAME);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("PartnerDaoImpl_Jdbc()#建構子發生例外: " 
										+ ex.getMessage());
		}
	}
	
	
	@Override
	public ContractTemplateBean getContractTemplateBean(int p_MId) {
		ContractTemplateBean bean = null;
		String sql = "SELECT * FROM constractemplate WHERE p_MId = ?";
		
		try (
				Connection conn = ds.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql);
			) {
				ps.setInt(1, p_MId);
				try (ResultSet rs = ps.executeQuery();) {
					if (rs.next()) {
						bean = new ContractTemplateBean();
						bean.setP_MId(rs.getInt("p_mid"));
						bean.setCtId(rs.getInt("ctId"));
						bean.setCtContent(rs.getString("ctContent"));
					}
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
				throw new RuntimeException("ContractTemplateDaoImpl_Jdbc()#queryContract()發生例外: " 
											+ ex.getMessage());
			}
		
		return bean;
	}
	@Override
	public ContractTemplateBean queryBean(String p_Id) {
		ContractTemplateBean bean= null;
		String sql = "SELECT * FROM constractemplate WHERE p_Id =?";
		try (
				Connection conn = ds.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql);
			) {
				ps.setString(1, p_Id);
				try (ResultSet rs = ps.executeQuery();) {
					if (rs.next()) {
						bean = new ContractTemplateBean();
						bean.setP_MId(rs.getInt("p_mid"));
						bean.setCtId(rs.getInt("ctId"));
						bean.setCtContent(rs.getString("ctContent"));
					}
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
				throw new RuntimeException("ContractTemplateDaoImpl_Jdbc()#queryContract()發生例外: " 
											+ ex.getMessage());
			}
		
		return bean;
		
	}
	
	@Override
	public int updateContract(ContractTemplateBean bean, long sizeInBytes) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public void setConnection(Connection con) {
		// TODO Auto-generated method stub
		
	}
	
	public int saveContractTemplate(ContractTemplateBean ctb) {
		int n=0;
		String sql="UPDATE Constractemplate SET "
				+ " ctcontent=? WHERE p_mid=?";
		try (
				Connection connection = ds.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql);
				){
				ps.clearParameters();
				ps.setString(1, ctb.getCtContent());
				ps.setInt(2, ctb.getP_MId());
				n=ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("ContractTemplateDaoImpl_Jdbc()#saveContractTemplate發生例為:"
									+e.getMessage());
		}
		return n;
	}

}
