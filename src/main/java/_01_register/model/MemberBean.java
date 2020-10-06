package _01_register.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import _04_forum.model.CommentBean;
import _04_forum.model.ForumBean;
import _04_forum.model.LikeOrHateBean;
import newlywed.model.NewlywedBean;

@Entity
@Table(name = "Memberinfo")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer m_No;
	private Integer m_Status;
	private Integer m_Code;
	private String m_Id;
	private String m_Password;
	@Transient
	private String m_Password1;
	private String m_Name;
	private String m_Email;
	private String m_Phone;
	private String m_Socialnum;
	private String m_Add;
	private Blob m_Propic;
	private String m_FileName;
	private String m_Availabletime;
	private Timestamp m_CreateTime;
	private Timestamp m_EditTime;
	@Transient
	MultipartFile memberMultipartFile;
	@OneToMany(mappedBy = "memberBean")
	private List<ForumBean> forum = new ArrayList<>();
	@OneToOne(mappedBy = "memberBean")
	private NewlywedBean newlywedBean;
	@OneToMany(mappedBy = "memberBean")
	private List<CommentBean> commentBean=new ArrayList<>();
	@OneToMany(mappedBy = "memberBean")
	private List<LikeOrHateBean> likeOrHate = new ArrayList<>();

	public MemberBean() {
	}

	public MemberBean(Integer m_No, Integer m_Status, Integer m_Code, String m_Id, String m_Password,
			String m_Password1, String m_Name, String m_Email, String m_Phone, String m_Socialnum, String m_Add,
			Blob m_Propic, String m_FileName, String m_Availabletime, Timestamp m_CreateTime, Timestamp m_EditTime,
			MultipartFile memberMultipartFile, List<ForumBean> forum, NewlywedBean newlywedBean) {
		super();
		this.m_No = m_No;
		this.m_Status = m_Status;
		this.m_Code = m_Code;
		this.m_Id = m_Id;
		this.m_Password = m_Password;
		this.m_Password1 = m_Password1;
		this.m_Name = m_Name;
		this.m_Email = m_Email;
		this.m_Phone = m_Phone;
		this.m_Socialnum = m_Socialnum;
		this.m_Add = m_Add;
		this.m_Propic = m_Propic;
		this.m_FileName = m_FileName;
		this.m_Availabletime = m_Availabletime;
		this.m_CreateTime = m_CreateTime;
		this.m_EditTime = m_EditTime;
		this.memberMultipartFile = memberMultipartFile;
		this.forum = forum;
		this.newlywedBean = newlywedBean;
	}

	public Integer getM_No() {
		return m_No;
	}

	public void setM_No(Integer m_No) {
		this.m_No = m_No;
	}

	public Integer getM_Status() {
		return m_Status;
	}

	public void setM_Status(Integer m_Status) {
		this.m_Status = m_Status;
	}

	public Integer getM_Code() {
		return m_Code;
	}

	public void setM_Code(Integer m_Code) {
		this.m_Code = m_Code;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getM_Password() {
		return m_Password;
	}

	public void setM_Password(String m_Password) {
		this.m_Password = m_Password;
	}

	public String getM_Password1() {
		return m_Password1;
	}

	public void setM_Password1(String password1) {
		this.m_Password1 = password1;
	}

	public String getM_Name() {
		return m_Name;
	}

	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}

	public String getM_Email() {
		return m_Email;
	}

	public void setM_Email(String m_Email) {
		this.m_Email = m_Email;
	}

	public String getM_Phone() {
		return m_Phone;
	}

	public void setM_Phone(String m_Phone) {
		this.m_Phone = m_Phone;
	}

	public String getM_Socialnum() {
		return m_Socialnum;
	}

	public void setM_Socialnum(String m_Socialnum) {
		this.m_Socialnum = m_Socialnum;
	}

	public String getM_Add() {
		return m_Add;
	}

	public void setM_Add(String m_Add) {
		this.m_Add = m_Add;
	}

	public Blob getM_Propic() {
		return m_Propic;
	}

	public void setM_Propic(Blob m_Propic) {
		this.m_Propic = m_Propic;
	}

	public String getM_FileName() {
		return m_FileName;
	}

	public void setM_FileName(String m_FileName) {
		this.m_FileName = m_FileName;
	}

	public Timestamp getM_CreateTime() {
		return m_CreateTime;
	}

	public void setM_CreateTime(Timestamp m_CreateTime) {
		this.m_CreateTime = m_CreateTime;
	}

	public Timestamp getM_EditTime() {
		return m_EditTime;
	}

	public void setM_EditTime(Timestamp m_EditTime) {
		this.m_EditTime = m_EditTime;
	}

	public MultipartFile getMemberMultipartFile() {
		return memberMultipartFile;
	}

	public void setMemberMultipartFile(MultipartFile memberMultipartFile) {
		this.memberMultipartFile = memberMultipartFile;
	}

	public String getM_Availabletime() {
		return m_Availabletime;
	}

	public void setM_Availabletime(String m_Availabletime) {
		this.m_Availabletime = m_Availabletime;
	}

	public List<ForumBean> getForum() {
		return forum;
	}

	public void setForum(List<ForumBean> forum) {
		this.forum = forum;
	}

	public NewlywedBean getNewlywedBean() {
		return newlywedBean;
	}

	public void setNewlywedBean(NewlywedBean newlywedBean) {
		this.newlywedBean = newlywedBean;
	}

	public List<CommentBean> getCommentBean() {
		return commentBean;
	}

	public void setCommentBean(List<CommentBean> commentBean) {
		this.commentBean = commentBean;
	}
	
	

}
