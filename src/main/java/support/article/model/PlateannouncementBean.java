package support.article.model;

import java.io.Serializable;
import java.sql.Clob;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity		   
@Table(name = "Plateannouncement")
public class PlateannouncementBean implements Serializable{
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PlateannouncementBean [paId=");
		builder.append(paId);
		builder.append(", paCode=");
		builder.append(paCode);
		builder.append(", paName=");
		builder.append(paName);
		builder.append(", paContent=");
		builder.append(paContent);
		builder.append(", paDate=");
		builder.append(paDate);
		builder.append(", paEnDate=");
		builder.append(paEnDate);
		builder.append("]");
		return builder.toString();
	}
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer paId;
	private String paCode;
	private String paName;
	private String paContent;
	private Timestamp paDate;
	private Timestamp paEnDate;
	
	
	
	
	public PlateannouncementBean() {
		super();
	}
	public PlateannouncementBean(Integer paId, String paCode, String paName, String paContent, Timestamp paDate,
			Timestamp paEnDate) {
		super();
		this.paId = paId;
		this.paCode = paCode;
		this.paName = paName;
		this.paContent = paContent;
		this.paDate = paDate;
		this.paEnDate = paEnDate;
	}
	public Integer getPaId() {
		return paId;
	}
	public void setPaId(Integer paId) {
		this.paId = paId;
	}
	public String getPaCode() {
		return paCode;
	}
	public void setPaCode(String paCode) {
		this.paCode = paCode;
	}
	public String getPaName() {
		return paName;
	}
	public void setPaName(String paName) {
		this.paName = paName;
	}
	public String getPaContent() {
		return paContent;
	}
	public void setPaContent(String paContent) {
		this.paContent = paContent;
	}
	public Timestamp getPaDate() {
		return paDate;
	}
	public void setPaDate(Timestamp paDate) {
		this.paDate = paDate;
	}
	public Timestamp getPaEnDate() {
		return paEnDate;
	}
	public void setPaEnDate(Timestamp paEnDate) {
		this.paEnDate = paEnDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	


}
