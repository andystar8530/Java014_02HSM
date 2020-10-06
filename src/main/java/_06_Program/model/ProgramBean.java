package _06_Program.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import partner_h.partnerInfoEdit_h.model.PartnerBean;

@Entity
@Table(name="Program")
public class ProgramBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer prm_Id;			//方案ID
	@Transient
	Integer prm_Pid;		//合作商ID
	@ManyToOne
	@JoinColumn(name = "prm_Pid")
	PartnerBean partnerBean2;
	String prm_Title;		//方案名稱
	String prm_Category;	//方案類別
	String prm_Price;		//方案價格
	String prm_Content;		//方案內容
	String prm_Detail;		//方案說明
	String prm_Status;		//方案狀態
	Date prm_Createdate;	//建檔日期
	Date prm_Edietdate;		//修改日期
	
	
	public ProgramBean() {
		super();
	}
	

	public ProgramBean(Integer prm_Id, Integer prm_Pid, PartnerBean partnerBean2, String prm_Title, String prm_Category,
			String prm_Price, String prm_Content, String prm_Detail, String prm_Status, Date prm_Createdate,
			Date prm_Edietdate) {
		super();
		this.prm_Id = prm_Id;
		this.prm_Pid = prm_Pid;
		this.partnerBean2 = partnerBean2;
		this.prm_Title = prm_Title;
		this.prm_Category = prm_Category;
		this.prm_Price = prm_Price;
		this.prm_Content = prm_Content;
		this.prm_Detail = prm_Detail;
		this.prm_Status = prm_Status;
		this.prm_Createdate = prm_Createdate;
		this.prm_Edietdate = prm_Edietdate;
	}

	
	public ProgramBean(Integer prm_Id, Integer prm_Pid, String prm_Title, String prm_Category, String prm_Price,
			String prm_Content, String prm_Detail, String prm_Status, Date prm_Createdate, Date prm_Edietdate) {
		super();
		this.prm_Id = prm_Id;
		this.prm_Pid = prm_Pid;
		this.prm_Title = prm_Title;
		this.prm_Category = prm_Category;
		this.prm_Price = prm_Price;
		this.prm_Content = prm_Content;
		this.prm_Detail = prm_Detail;
		this.prm_Status = prm_Status;
		this.prm_Createdate = prm_Createdate;
		this.prm_Edietdate = prm_Edietdate;
	}


	public Integer getPrm_Id() {
		return prm_Id;
	}
	public void setPrm_Id(Integer prm_Id) {
		this.prm_Id = prm_Id;
	}
//	public PartnerBean getPartnerBean() {
//		return partnerBean;
//	}
//	public void setPartnerBean(PartnerBean partnerBean) {
//		this.partnerBean = partnerBean;
//	}
	public String getPrm_Title() {
		return prm_Title;
	}
	public void setPrm_Title(String prm_Title) {
		this.prm_Title = prm_Title;
	}
	
	public String getPrm_Category() {
		return prm_Category;
	}
	public void setPrm_Category(String prm_Category) {
		this.prm_Category = prm_Category;
	}
	public String getPrm_Price() {
		return prm_Price;
	}
	public void setPrm_Price(String prm_Price) {
		this.prm_Price = prm_Price;
	}
	public String getPrm_Content() {
		return prm_Content;
	}
	public void setPrm_Content(String prm_Content) {
		this.prm_Content = prm_Content;
	}
	public String getPrm_Detail() {
		return prm_Detail;
	}
	public void setPrm_Detail(String prm_Detail) {
		this.prm_Detail = prm_Detail;
	}
	public String getPrm_Status() {
		return prm_Status;
	}
	public void setPrm_Status(String prm_Status) {
		this.prm_Status = prm_Status;
	}
	public Date getPrm_Createdate() {
		return prm_Createdate;
	}
	public void setPrm_Createdate(Date prm_Createdate) {
		this.prm_Createdate = prm_Createdate;
	}
	public Date getPrm_Edietdate() {
		return prm_Edietdate;
	}
	public void setPrm_Edietdate(Date prm_Edietdate) {
		this.prm_Edietdate = prm_Edietdate;
	}


	public Integer getPrm_Pid() {
		return prm_Pid;
	}


	public void setPrm_Pid(Integer prm_Pid) {
		this.prm_Pid = prm_Pid;
	}


	public PartnerBean getPartnerBean2() {
		return partnerBean2;
	}


	public void setPartnerBean2(PartnerBean partnerBean2) {
		this.partnerBean2 = partnerBean2;
	}
	
	
	
}
