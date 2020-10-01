package _01_register.dao;

import java.sql.Connection;

import _01_register.model.MemberBean;

public interface MemberDao {
	
	public boolean idExists(String id);

	public int saveMember(MemberBean mb) ;
	
	public MemberBean queryMember(String id);
	
	public MemberBean checkIdPassword(String userId, String password);	
	
//	void updateUnpaidOrderAmount(OrderBean ob);

	public void setConnection(Connection con);
	
    public MemberBean get(Integer pk);
    
    void update(MemberBean memberBean);
}