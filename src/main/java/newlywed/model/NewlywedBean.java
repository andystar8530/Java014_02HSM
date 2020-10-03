package newlywed.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

import _01_register.model.MemberBean;

@Entity
@Table(name="newlywed")
public class NewlywedBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer N_id;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="N_MID")
	private MemberBean memberBean;
	
	@Transient
	private Integer N_MID;
	
	@Column(name="N_NICKNAME")
	private String N_nickname;
	
	public String getN_connectiontime() {
		return N_connectiontime;
	}

	public void setN_connectiontime(String n_connectiontime) {
		N_connectiontime = n_connectiontime;
	}

	@Column(name="N_GENDER")
	private String N_gender;
	
	@Column(name="N_DATE")
	private Date N_date;
	
	@Column(name="N_BUDGET")
	private Integer N_budget;
	
	@Column(name="N_AREA")
	private Integer N_area;
	
	@Column(name="N_CHECKLIST")
	private String N_checklist;
	
	@Column(name="N_FAVORITE")
	private String N_favorite;
	
	@Column(name="N_CONNECTIONTIME")
	private String N_connectiontime;
	
	@Column(name="N_SERVICE")
	private String N_service;
	
	@Column(name="CREATETIME")
	private Timestamp createtime;
	
	@Column(name="EDITTIME")
	private Timestamp edittime;
	
	@Column(name="PHONENUMBER")
	private Integer N_phonenumber;

	
	
	
	public Integer getN_phonenumber() {
		return N_phonenumber;
	}

	public void setN_phonenumber(Integer n_phonenumber) {
		N_phonenumber = n_phonenumber;
	}

	public NewlywedBean() {
		
	}
	
	

	
	

	

	

	

	

	

	@Override
	public String toString() {
		return "NewlywedBean [N_id=" + N_id + ", memberBean=" + memberBean + ", N_MID=" + N_MID + ", N_nickname="
				+ N_nickname + ", N_gender=" + N_gender + ", N_date=" + N_date + ", N_budget=" + N_budget + ", N_area="
				+ N_area + ", N_checklist=" + N_checklist + ", N_favorite=" + N_favorite + ", N_connectiontime="
				+ N_connectiontime + ", N_service=" + N_service + ", createtime=" + createtime + ", edittime="
				+ edittime + ", N_phonenumber=" + N_phonenumber + "]";
	}

	public NewlywedBean(Integer n_id, MemberBean memberBean, Integer n_MID, String n_nickname, String n_gender,
			Date n_date, Integer n_budget, Integer n_area, String n_checklist, String n_favorite,
			String n_connectiontime, String n_service, Timestamp createtime, Timestamp edittime,
			Integer n_phonenumber) {
		super();
		N_id = n_id;
		this.memberBean = memberBean;
		N_MID = n_MID;
		N_nickname = n_nickname;
		N_gender = n_gender;
		N_date = n_date;
		N_budget = n_budget;
		N_area = n_area;
		N_checklist = n_checklist;
		N_favorite = n_favorite;
		N_connectiontime = n_connectiontime;
		N_service = n_service;
		this.createtime = createtime;
		this.edittime = edittime;
		N_phonenumber = n_phonenumber;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public Integer getN_MID() {
		return N_MID;
	}

	public void setN_MID(Integer n_MID) {
		N_MID = n_MID;
	}

	public Integer getN_id() {
		return N_id;
	}

	public void setN_id(Integer n_id) {
		N_id = n_id;
	}

	

	public String getN_nickname() {
		return N_nickname;
	}

	public void setN_nickname(String n_nickname) {
		N_nickname = n_nickname;
	}

	public String getN_gender() {
		return N_gender;
	}

	public void setN_gender(String n_gender) {
		N_gender = n_gender;
	}

	public Date getN_date() {
		return N_date;
	}

	public void setN_date(Date n_date) {
		N_date = n_date;
	}

	public Integer getN_budget() {
		return N_budget;
	}

	public void setN_budget(Integer n_budget) {
		N_budget = n_budget;
	}

	public Integer getN_area() {
		return N_area;
	}

	public void setN_area(Integer n_area) {
		N_area = n_area;
	}

	public String getN_checklist() {
		return N_checklist;
	}

	public void setN_checklist(String n_checklist) {
		N_checklist = n_checklist;
	}

	public String getN_favorite() {
		return N_favorite;
	}

	public void setN_favorite(String n_favorite) {
		N_favorite = n_favorite;
	}

	public String getN_service() {
		return N_service;
	}

	public void setN_service(String n_service) {
		N_service = n_service;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public Timestamp getEdittime() {
		return edittime;
	}

	public void setEdittime(Timestamp edittime) {
		this.edittime = edittime;
	}
	
}
