package partner_h.quotecontract.main.model;

import java.sql.Blob;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="QuoteContracts")
public class QuoteContractBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer qcId;//報價合約單號
	String qcName;//合約名稱
	Date qcDate;//報價日期
	Date qcDateLine;//報價期限
	String qcStatus;//報價狀態
	String qcContent;//合約內容
	Integer n_Id;//新人ID
	Blob n_Signature;//新人簽名
	Integer p_Id;//合作商ID
	Blob p_Signature;//合作商簽名
	Date qcExecutionDate;//服務日期
	Integer qcTotalAmount;//專案總價
	Double qcDepositRate;//訂金比例
	Integer qcDeposit;//訂金金額 = 專案總價 * (訂金比例/100)
	String qcNotes;//
	
	//1中有個多
	@OneToMany(mappedBy="quoteContractBean",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	Set<QuoteContractItemBean>items = new LinkedHashSet<>(); //訂單明細

	public QuoteContractBean() {
		super();
	}

	public QuoteContractBean(Integer qcId, String qcName, Date qcDate, Date qcDateLine, String qcStatus, String qcContent,
			Integer n_Id, Blob n_Signature, Integer p_Id, Blob p_Signature, Date qcExecutionDate, Integer qcTotalAmount,
			Double qcDepositRate, Integer qcDeposit, String qcNotes, Set<QuoteContractItemBean> items) {
		super();
		this.qcId = qcId;
		this.qcName = qcName;
		this.qcDate = qcDate;
		this.qcDateLine = qcDateLine;
		this.qcStatus = qcStatus;
		this.qcContent = qcContent;
		this.n_Id = n_Id;
		this.n_Signature = n_Signature;
		this.p_Id = p_Id;
		this.p_Signature = p_Signature;
		this.qcExecutionDate = qcExecutionDate;
		this.qcTotalAmount = qcTotalAmount;
		this.qcDepositRate = qcDepositRate;
		this.qcDeposit = qcDeposit;
		this.qcNotes = qcNotes;
		this.items = items;
	}

	public QuoteContractBean(Integer qcId, String qcName, Date qcDate, Date qcDateLine, String qcStatus, 
			Integer n_Id, Blob n_Signature, Integer p_Id, Blob p_Signature, Date qcExecutionDate, Integer qcTotalAmount,
			Double qcDepositRate, Integer qcDeposit, Set<QuoteContractItemBean> items) {
		super();
		this.qcId = qcId;
		this.qcName = qcName;
		this.qcDate = qcDate;
		this.qcDateLine = qcDateLine;
		this.qcStatus = qcStatus;
		this.n_Id = n_Id;
		this.n_Signature = n_Signature;
		this.p_Id = p_Id;
		this.p_Signature = p_Signature;
		this.qcExecutionDate = qcExecutionDate;
		this.qcTotalAmount = qcTotalAmount;
		this.qcDepositRate = qcDepositRate;
		this.qcDeposit = qcDeposit;
		this.items = items;
	}
	
	
	public Integer getQcId() {
		return qcId;
	}

	public void setQcId(Integer qcId) {
		this.qcId = qcId;
	}

	public String getQcName() {
		return qcName;
	}

	public void setQcName(String qcName) {
		this.qcName = qcName;
	}

	public Date getQcDate() {
		return qcDate;
	}

	public void setQcDate(Date qcDate) {
		this.qcDate = qcDate;
	}

	public Date getQcDateLine() {
		return qcDateLine;
	}

	public void setQcDateLine(Date qcDateLine) {
		this.qcDateLine = qcDateLine;
	}

	public String getQcStatus() {
		return qcStatus;
	}

	public void setQcStatus(String qcStatus) {
		this.qcStatus = qcStatus;
	}


	public String getQcContent() {
		return qcContent;
	}

	public void setQcContent(String qcContent) {
		this.qcContent = qcContent;
	}

	public Integer getN_Id() {
		return n_Id;
	}

	public void setN_Id(Integer n_Id) {
		this.n_Id = n_Id;
	}

	public Blob getN_Signature() {
		return n_Signature;
	}

	public void setN_Signature(Blob n_Signature) {
		this.n_Signature = n_Signature;
	}

	public Integer getP_Id() {
		return p_Id;
	}

	public void setP_Id(Integer p_Id) {
		this.p_Id = p_Id;
	}

	public Blob getP_Signature() {
		return p_Signature;
	}

	public void setP_Signature(Blob p_Signature) {
		this.p_Signature = p_Signature;
	}

	public Date getQcExecutionDate() {
		return qcExecutionDate;
	}

	public void setQcExecutionDate(Date qcExecutionDate) {
		this.qcExecutionDate = qcExecutionDate;
	}

	public Integer getQcTotalAmount() {
		return qcTotalAmount;
	}

	public void setQcTotalAmount(Integer qcTotalAmount) {
		this.qcTotalAmount = qcTotalAmount;
	}

	public Double getQcDepositRate() {
		return qcDepositRate;
	}

	public void setQcDepositRate(Double qcDepositRate) {
		this.qcDepositRate = qcDepositRate;
	}

	public Integer getQcDeposit() {
		return qcDeposit;
	}

	public void setQcDeposit(Integer qcDeposit) {
		this.qcDeposit = qcDeposit;
	}

	public String getQcNotes() {
		return qcNotes;
	}

	public void setQcNotes(String qcNotes) {
		this.qcNotes = qcNotes;
	}

	public Set<QuoteContractItemBean> getItems() {
		return items;
	}

	public void setItems(Set<QuoteContractItemBean> items) {
		this.items = items;
	}

	
	

}
