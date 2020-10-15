package partner_h.quotecontract.report.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name="QuoteReport")
public class QuoteReportBean {
	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer qrNo;
	Integer month;
	Integer quoteCount;
	Integer qrRevenue;
	Integer qrProfit;
	Integer qrCost;
	Integer qrAvgRev;
	Integer qrAvgPro;
	Integer qrAvgCost;
	
	public QuoteReportBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QuoteReportBean(Integer month, Integer quoteCount, Integer qrRevenue, Integer qrProfit, Integer qrCost,
			Integer qrAvgRev, Integer qrAvgPro, Integer qrAvgCost) {
		this.month = month;
		this.quoteCount = quoteCount;
		this.qrRevenue = qrRevenue;
		this.qrProfit = qrProfit;
		this.qrCost = qrCost;
		this.qrAvgRev = qrAvgRev;
		this.qrAvgPro = qrAvgPro;
		this.qrAvgCost = qrAvgCost;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getQuoteCount() {
		return quoteCount;
	}

	public void setQuoteCount(Integer quoteCount) {
		this.quoteCount = quoteCount;
	}

	public Integer getQrRevenue() {
		return qrRevenue;
	}

	public void setQrRevenue(Integer qrRevenue) {
		this.qrRevenue = qrRevenue;
	}

	public Integer getQrProfit() {
		return qrProfit;
	}

	public void setQrProfit(Integer qrProfit) {
		this.qrProfit = qrProfit;
	}

	public Integer getQrCost() {
		return qrCost;
	}

	public void setQrCost(Integer qrCost) {
		this.qrCost = qrCost;
	}

	public Integer getQrAvgRev() {
		return qrAvgRev;
	}

	public void setQrAvgRev(Integer qrAvgRev) {
		this.qrAvgRev = qrAvgRev;
	}

	public Integer getQrAvgPro() {
		return qrAvgPro;
	}

	public void setQrAvgPro(Integer qrAvgPro) {
		this.qrAvgPro = qrAvgPro;
	}

	public Integer getQrAvgCost() {
		return qrAvgCost;
	}

	public void setQrAvgCost(Integer qrAvgCost) {
		this.qrAvgCost = qrAvgCost;
	}

	@Override
	public String toString() {
		return "QuoteReportBean [month=" + month + ", quoteCount=" + quoteCount + ", qrRevenue=" + qrRevenue
				+ ", qrProfit=" + qrProfit + ", qrCost=" + qrCost + ", qrAvgRev=" + qrAvgRev + ", qrAvgPro=" + qrAvgPro
				+ ", qrAvgCost=" + qrAvgCost + "]";
	}


}
