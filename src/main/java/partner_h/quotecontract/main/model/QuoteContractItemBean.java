package partner_h.quotecontract.main.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="QuoteContractItem")
public class QuoteContractItemBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer qcdId;//序號
	Integer qcdAmount;//服務細項金額
	String qcdNotes;//備註
	
	@ManyToOne //多中有個一
	@JoinColumn(name="qcId") //quoteContractBean主檔單號
	QuoteContractBean quoteContractBean;
	
//	@ManyToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name="siId",nullable=false)
//	ServiceItem serviceItem;//服務細項
	

	public QuoteContractItemBean() {
		super();
	}


	public QuoteContractItemBean(Integer qcdId, 
//			ServiceItem serviceItem, 
			Integer qcdAmount, String qcdNotes,
			QuoteContractBean quoteContractBean) {
		this.qcdId = qcdId;
//		this.serviceItem = serviceItem;
		this.qcdAmount = qcdAmount;
		this.qcdNotes = qcdNotes;
		this.quoteContractBean = quoteContractBean;
	}



	public Integer getQcdId() {
		return qcdId;
	}

	public void setQcdId(Integer qcdId) {
		this.qcdId = qcdId;
	}


//	public ServiceItem getServiceItem() {
//		return serviceItem;
//	}
//	public void setServiceItem(ServiceItem serviceItem) {
//		this.serviceItem = serviceItem;
//	}


	public Integer getQcdAmount() {
		return qcdAmount;
	}

	public void setQcdAmount(Integer qcdAmount) {
		this.qcdAmount = qcdAmount;
	}

	public String getQcdNotes() {
		return qcdNotes;
	}

	public void setQcdNotes(String qcdNotes) {
		this.qcdNotes = qcdNotes;
	}

	public QuoteContractBean getQuoteContractBean() {
		return quoteContractBean;
	}

	public void setQuoteContractBean(QuoteContractBean quoteContractBean) {
		this.quoteContractBean = quoteContractBean;
	}
	
}
