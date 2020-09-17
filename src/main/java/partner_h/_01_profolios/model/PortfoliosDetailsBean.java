package partner_h._01_profolios.model;

import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name="ProtfoliosDetails")
public class PortfoliosDetailsBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pidId; //照片序號(主鍵)
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="pfmId")
	private PortfoliosBean portfoliosBean;
	@Transient
	private Integer pfmId;//作品集主檔編號 (外鍵)
	private String 	pfdName; //照片名稱
	private Blob pfdPic; //照片
	
	
	public PortfoliosDetailsBean() {
		super();
	}


	public PortfoliosDetailsBean(Integer pidId, Integer pfmId, String pfdName, Blob pfdPic) {
		super();
		this.pidId = pidId;
		this.pfmId = pfmId;
		this.pfdName = pfdName;
		this.pfdPic = pfdPic;
	}


	
	
	
	public PortfoliosBean getPortfolioBean() {
		return portfoliosBean;
	}


	
	public void setPortfolioBean(PortfoliosBean portfolioBean) {
		this.portfoliosBean = portfolioBean;
	}


	public Integer getPidId() {
		return pidId;
	}


	
	public void setPidId(Integer pidId) {
		this.pidId = pidId;
	}


	
	public Integer getPfmId() {
		return pfmId;
	}


	
	public void setPfmId(Integer pfmId) {
		this.pfmId = pfmId;
	}


	
	public String getPfdName() {
		return pfdName;
	}


	
	public void setPfdName(String pfdName) {
		this.pfdName = pfdName;
	}


	
	public Blob getPfdPic() {
		return pfdPic;
	}


	public void setPfdPic(Blob pfdPic) {
		this.pfdPic = pfdPic;
	}


	/**
	 * @return the portfoliosBean
	 */
	public PortfoliosBean getPortfoliosBean() {
		return portfoliosBean;
	}


	/**
	 * @param portfoliosBean the portfoliosBean to set
	 */
	public void setPortfoliosBean(PortfoliosBean portfoliosBean) {
		this.portfoliosBean = portfoliosBean;
	}
	
	
}
