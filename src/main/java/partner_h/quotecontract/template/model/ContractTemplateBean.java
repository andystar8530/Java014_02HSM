package partner_h.quotecontract.template.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import partner_h.partnerInfoEdit_h.model.PartnerBean;

@Entity
@Table(name="contractemplate")
public class ContractTemplateBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ctId;//合約編號
	private String ctContent;//合約內容
	
	//與PartnerBean的p_id建立外鍵關係
	@OneToOne(cascade = CascadeType.PERSIST)//CascadeType.PERSIST,Hibernate會先寫入外鍵參考物件
	@JoinColumn (name = "p_id")//同 @JoinColumn(name="p_id_p_id") (name="本類別屬姓名_外鍵主鍵名)
	private PartnerBean partner; //外鍵 p_id
	
	public ContractTemplateBean() {
		super();
	}
	
	public ContractTemplateBean(Integer ctId, String ctContent, PartnerBean partner) {
		this.ctId = ctId;
		this.ctContent = ctContent;
		this.partner = partner;
	}

	public Integer getCtId() {
		return ctId;
	}

	public void setCtId(Integer ctId) {
		this.ctId = ctId;
	}

	public String getCtContent() {
		return ctContent;
	}

	public void setCtContent(String ctContent) {
		this.ctContent = ctContent;
	}

	public PartnerBean getPartner() {
		return partner;
	}

	public void setPartner(PartnerBean partner) {
		this.partner = partner;
	}

	@Override
	public String toString() {
		return "ContractTemplateBean [ctId=" + ctId + ", ctContent=" + ctContent + ", partner=" + partner + "]";
	}

	


}
