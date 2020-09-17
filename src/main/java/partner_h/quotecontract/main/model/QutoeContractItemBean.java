package partner_h.quotecontract.main.model;

import java.sql.Clob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name="QuoteContractItem")
public class QutoeContractItemBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer qcdId;//序號
	Integer siId;//服務細項
	Integer qcdAmount;//服務細項金額
	Clob qcdNotes;//備註
	
	@ManyToOne
	@JoinColumn(name="qcId") //quoteContractBean主檔單號
	QuoteContractBean quoteContractBean;

	public QutoeContractItemBean() {
		super();
	}

	public QutoeContractItemBean(Integer qcdId, Integer siId, Integer qcdAmount, Clob qcdNotes,
			QuoteContractBean quoteContractBean) {
		super();
		this.qcdId = qcdId;
		this.siId = siId;
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

	public Integer getSiId() {
		return siId;
	}

	public void setSiId(Integer siId) {
		this.siId = siId;
	}

	public Integer getQcdAmount() {
		return qcdAmount;
	}

	public void setQcdAmount(Integer qcdAmount) {
		this.qcdAmount = qcdAmount;
	}

	public Clob getQcdNotes() {
		return qcdNotes;
	}

	public void setQcdNotes(Clob qcdNotes) {
		this.qcdNotes = qcdNotes;
	}

	public QuoteContractBean getQuoteContractBean() {
		return quoteContractBean;
	}

	public void setQuoteContractBean(QuoteContractBean quoteContractBean) {
		this.quoteContractBean = quoteContractBean;
	}
	
}
