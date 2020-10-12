package partner_h.quotecontract.report.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="QuoteReport")
public class QuoteReportBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer qrNo;
	Date month;
	Integer quoteCount;

	public QuoteReportBean(Date month, Integer quoteCount) {
		this.month = month;
		this.quoteCount = quoteCount;
	}
		
	public QuoteReportBean() {
		super();
	}

	public Date getMonth() {
		return month;
	}

	public void setMonth(Date month) {
		this.month = month;
	}

	public Integer getQuoteCount() {
		return quoteCount;
	}

	public void setQuoteCount(Integer quoteCount) {
		this.quoteCount = quoteCount;
	}

	public Integer getQrNo() {
		return qrNo;
	}

	public void setQrNo(Integer qrNo) {
		this.qrNo = qrNo;
	}

	@Override
	public String toString() {
		return "QuoteReportBean [qrNo=" + qrNo + ", month=" + month + ", quoteCount=" + quoteCount + "]";
	}

}
