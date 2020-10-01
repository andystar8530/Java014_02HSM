package partner_h._01_profolios.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import partner_h.partnerInfoEdit_h.model.PartnerBean;

@Entity
@Table(name="portfoliosMain")
public class PortfoliosBean implements Serializable{
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer pfmId; //作品集主檔編號
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="p_id")
	private PartnerBean partnerBean ; 
	
	@Transient
	private Integer p_id; //作者(合作商id)
	private String pfmName; //作品名稱
	private String pfmInfo; //作品資訊
	private String pfmStatus;//作品狀態(審核)
	private String pfService; //作品集分類
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp pfCreateTime;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp pfUpdateTime;
	
	@OneToMany(mappedBy = "portfoliosBean" )
	@JsonIgnore
	List<PortfoliosDetailsBean> detailList ;
	
	String extra;
	
	public PortfoliosBean() {
		super();
	}
	

	

	public PortfoliosBean(Integer pfmId, PartnerBean partnerBean, Integer p_id, String pfmName, String pfmInfo,
			String pfmStatus, String pfService, Timestamp pfCreateTime, Timestamp pfUpdateTime,
			List<PortfoliosDetailsBean> detailList) {
		super();
		this.pfmId = pfmId;
		this.partnerBean = partnerBean;
		this.p_id = p_id;
		this.pfmName = pfmName;
		this.pfmInfo = pfmInfo;
		this.pfmStatus = pfmStatus;
		this.pfService = pfService;
		this.pfCreateTime = pfCreateTime;
		this.pfUpdateTime = pfUpdateTime;
		this.detailList = detailList;
	}
	
	



	public PortfoliosBean(Integer pfmId, PartnerBean partnerBean, Integer p_id, String pfmName, String pfmInfo,
			String pfmStatus, String pfService, Timestamp pfCreateTime, Timestamp pfUpdateTime) {
		super();
		this.pfmId = pfmId;
		this.partnerBean = partnerBean;
		this.p_id = p_id;
		this.pfmName = pfmName;
		this.pfmInfo = pfmInfo;
		this.pfmStatus = pfmStatus;
		this.pfService = pfService;
		this.pfCreateTime = pfCreateTime;
		this.pfUpdateTime = pfUpdateTime;
	}


	

	public PortfoliosBean(Integer pfmId, PartnerBean partnerBean, Integer p_id, String pfmName, String pfmInfo,
			String pfmStatus, String pfService, Timestamp pfCreateTime, Timestamp pfUpdateTime,
			List<PortfoliosDetailsBean> detailList, String extra) {
		super();
		this.pfmId = pfmId;
		this.partnerBean = partnerBean;
		this.p_id = p_id;
		this.pfmName = pfmName;
		this.pfmInfo = pfmInfo;
		this.pfmStatus = pfmStatus;
		this.pfService = pfService;
		this.pfCreateTime = pfCreateTime;
		this.pfUpdateTime = pfUpdateTime;
		this.detailList = detailList;
		this.extra = extra;
	}




	public PartnerBean getPartnerBean() {
		return partnerBean;
	}

	
	public void setPartnerBean(PartnerBean partnerBean) {
		this.partnerBean = partnerBean;
	}

	public Integer getPfmId() {
		return pfmId;
	}

	
	public void setPfmId(Integer pfmId) {
		this.pfmId = pfmId;
	}

	
	public Integer getP_id() {
		return p_id;
	}

	
	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}

	
	public String getPfmName() {
		return pfmName;
	}

	
	public void setPfmName(String pfmName) {
		this.pfmName = pfmName;
	}

	
	public String getPfmInfo() {
		return pfmInfo;
	}

	
	public void setPfmInfo(String pfmInfo) {
		this.pfmInfo = pfmInfo;
	}

	
	public String getPfmStatus() {
		return pfmStatus;
	}

	public void setPfmStatus(String pfmStatus) {
		this.pfmStatus = pfmStatus;
	}

	
	public List<PortfoliosDetailsBean> getDetailList() {
		return detailList;
	}

	
	public void setDetailList(List<PortfoliosDetailsBean> detailList) {
		this.detailList = detailList;
	}


	
	public String getPfService() {
		return pfService;
	}


	
	public void setPfService(String pfService) {
		this.pfService = pfService;
	}


	
	public Timestamp getPfCreateTime() {
		return pfCreateTime;
	}


	
	public void setPfCreateTime(Timestamp pfCreateTime) {
		this.pfCreateTime = pfCreateTime;
	}


	
	public Timestamp getPfUpdateTime() {
		return pfUpdateTime;
	}


	
	public void setPfUpdateTime(Timestamp pfUpdateTime) {
		this.pfUpdateTime = pfUpdateTime;
	}


	public String getExtra() {
		return extra;
	}


	public void setExtra(String extra) {
		this.extra = extra;
	}


	


	


	
	
	
	
	
	
}
