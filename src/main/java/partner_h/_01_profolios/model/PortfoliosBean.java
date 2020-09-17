package partner_h._01_profolios.model;

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

import partner_h.partnerInfoEdit_h.model.PartnerBean;

@Entity
@Table(name="portfoliosMain")
public class PortfoliosBean {
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer pfmId; //作品集主檔編號
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="p_Id")
	private PartnerBean partnerBean ; 
	
	@Transient
	private Integer p_Id; //作者(合作商id)
	private String pfmName; //作品名稱
	private String pfmInfo; //作品資訊
	private String pfmStatus;//作品狀態(審核)
	
	@OneToMany(mappedBy = "portfoliosBean" )
	List<PortfoliosDetailsBean> detailList ;
	
	
	
	public PortfoliosBean() {
		super();
	}
	
	public PortfoliosBean(Integer pfmId, Integer p_Id, String pfmName, String pfmInfo, String pfmStatus) {
		super();
		this.pfmId = pfmId;
		this.p_Id = p_Id;
		this.pfmName = pfmName;
		this.pfmInfo = pfmInfo;
		this.pfmStatus = pfmStatus;
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

	
	public Integer getP_Id() {
		return p_Id;
	}

	
	public void setP_Id(Integer p_Id) {
		this.p_Id = p_Id;
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

	/**
	 * @return the detailList
	 */
	public List<PortfoliosDetailsBean> getDetailList() {
		return detailList;
	}

	/**
	 * @param detailList the detailList to set
	 */
	public void setDetailList(List<PortfoliosDetailsBean> detailList) {
		this.detailList = detailList;
	}


	


	


	
	
	
	
	
	
}
