package partner_h._01_profolios.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
@Entity
@Table(name="PortfoliosDetails")
public class PortfoliosDetailsBean implements Serializable{
	
	private static final long serialVersionUID = 74458L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pfdId; //照片序號(主鍵)
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="pfmId")
	
	private PortfoliosBean portfoliosBean;
	@Transient
	private Integer pfmId;//作品集主檔編號 (外鍵)
	private String 	pfdName; //照片名稱
	private Blob pfdPic; //照片
	
	@Transient
	private List<MultipartFile> portfoliosImages ;
	
	public PortfoliosDetailsBean() {
		super();
	}


	public PortfoliosDetailsBean(Integer pfdId, Integer pfmId, String pfdName, Blob pfdPic) {
		super();
		this.pfdId = pfdId;
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


	public Integer getPfdId() {
		return pfdId;
	}


	
	public void setPfdId(Integer pfdId) {
		this.pfdId = pfdId;
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


	public PortfoliosBean getPortfoliosBean() {
		return portfoliosBean;
	}

	public void setPortfoliosBean(PortfoliosBean portfoliosBean) {
		this.portfoliosBean = portfoliosBean;
	}


	public List<MultipartFile> getPortfoliosImages() {
		return portfoliosImages;
	}

	public void setPortfoliosImages(List<MultipartFile> portfoliosImages) {
		this.portfoliosImages = portfoliosImages;
	}
	
	
	
}
