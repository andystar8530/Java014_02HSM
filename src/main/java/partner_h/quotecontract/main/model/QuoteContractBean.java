package partner_h.quotecontract.main.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name="QuoteContracts")
public class QuoteContractBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer qcId;//報價合約單號
	String qcName;//合約名稱
	Integer p_Id;//合作商ID
	String p_storeName; //	合作商名稱
	Date qcExecutionDate;//服務日期
	String serviceName;//服務名目
	Integer qcTotalAmount;//專案總價
	Double qcDepositRate;//訂金比例
	Integer qcDeposit;//訂金金額 = 專案總價 * (訂金比例/100)
	Blob p_Signature;//合作商簽名
	String qcContent;//合約內容 
	String n_Name;//新人名字
	////
	Blob n_Signature;//新人簽名
	////
	String n_FileName;//新人簽名圖檔名稱
	////

	private String s_base64;
	private String c_base64;
	Date qcDate;//報價日期
	Date qcDateLine;//報價期限
	
	Integer qcStatus;//報價狀態
	String m_Id; //	新人帳號
	
	String qcNotes;//備註
	
	String serviceItem;//服務項目 0,1,2,3
	Integer servicePrice;//專案金額
	
	Integer costHour;//專案花費時間
	Integer costPerHour; //	專案每小時費用
	Integer costMen; //	專案人工成本:小時*成本
	Integer costOther;//專案其他花費
	Integer costTotal;//專案總花費
	Integer qcProfit;//專案利潤
	
	
	
	
	
	public QuoteContractBean(Integer qcId, String qcName, Integer p_Id, String p_storeName, Date qcExecutionDate,
			String serviceName, Integer qcTotalAmount, Double qcDepositRate, Integer qcDeposit, Blob p_Signature,
			String qcContent, String n_Name, Blob n_Signature, String n_FileName, String s_base64, String c_base64,
			Date qcDate, Date qcDateLine, Integer qcStatus, String m_Id, String qcNotes, String serviceItem,
			Integer servicePrice, Integer costHour, Integer costPerHour, Integer costMen, Integer costOther,
			Integer costTotal, Integer qcProfit, MultipartFile n_Signature1) {
		super();
		this.qcId = qcId;
		this.qcName = qcName;
		this.p_Id = p_Id;
		this.p_storeName = p_storeName;
		this.qcExecutionDate = qcExecutionDate;
		this.serviceName = serviceName;
		this.qcTotalAmount = qcTotalAmount;
		this.qcDepositRate = qcDepositRate;
		this.qcDeposit = qcDeposit;
		this.p_Signature = p_Signature;
		this.qcContent = qcContent;
		this.n_Name = n_Name;
		this.n_Signature = n_Signature;
		this.n_FileName = n_FileName;
		this.s_base64 = s_base64;
		this.c_base64 = c_base64;
		this.qcDate = qcDate;
		this.qcDateLine = qcDateLine;
		this.qcStatus = qcStatus;
		this.m_Id = m_Id;
		this.qcNotes = qcNotes;
		this.serviceItem = serviceItem;
		this.servicePrice = servicePrice;
		this.costHour = costHour;
		this.costPerHour = costPerHour;
		this.costMen = costMen;
		this.costOther = costOther;
		this.costTotal = costTotal;
		this.qcProfit = qcProfit;
		this.n_Signature1 = n_Signature1;
	}




	public String getS_base64() {
		return s_base64;
	}




	public void setS_base64(String s_base64) {
		this.s_base64 = s_base64;
	}




	public String getC_base64() {
		return c_base64;
	}




	public void setC_base64(String c_base64) {
		this.c_base64 = c_base64;
	}




	public String getN_FileName() {
		return n_FileName;
	}




	public void setN_FileName(String n_FileName) {
		this.n_FileName = n_FileName;
	}

	
	
	@Transient
	private MultipartFile n_Signature1;//取圖檔用
	
	//1中有個多
//	@OneToMany(mappedBy="quoteContractBean",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
//	Set<QuoteContractItemBean>items = new LinkedHashSet<>(); //訂單明細

	public MultipartFile getN_Signature1() {
		return n_Signature1;
	}




	public void setN_Signature1(MultipartFile n_Signature1) {
		this.n_Signature1 = n_Signature1;
	}




	public QuoteContractBean() {
		super();
	}




	

	@Override
	public String toString() {
		return "QuoteContractBean [qcId=" + qcId + ", qcName=" + qcName + ", qcDate=" + qcDate + ", qcDateLine="
				+ qcDateLine + ", qcStatus=" + qcStatus + ", qcContent=" + qcContent + ", n_Name=" + n_Name + ", m_Id="
				+ m_Id + ", n_Signature=" + n_Signature + ", p_Id=" + p_Id + ", p_storeName=" + p_storeName
				+ ", p_Signature=" + p_Signature + ", qcExecutionDate=" + qcExecutionDate + ", qcTotalAmount="
				+ qcTotalAmount + ", qcDepositRate=" + qcDepositRate + ", qcDeposit=" + qcDeposit + ", qcNotes="
				+ qcNotes + ", serviceItem=" + serviceItem + ", serviceName=" + serviceName + ", servicePrice="
				+ servicePrice + ", costHour=" + costHour + ", costPerHour=" + costPerHour + ", costMen=" + costMen
				+ ", costOther=" + costOther + ", costTotal=" + costTotal + ", qcProfit=" + qcProfit + "]";
	}




	public Integer getCostHour() {
		return costHour;
	}


	public void setCostHour(Integer costHour) {
		this.costHour = costHour;
	}


	public Integer getCostPerHour() {
		return costPerHour;
	}


	public void setCostPerHour(Integer costPerHour) {
		this.costPerHour = costPerHour;
	}


	public Integer getCostMen() {
		return costMen;
	}


	public void setCostMen(Integer costMen) {
		this.costMen = costMen;
	}


	public Integer getCostOther() {
		return costOther;
	}


	public void setCostOther(Integer costOther) {
		this.costOther = costOther;
	}


	public Integer getCostTotal() {
		return costTotal;
	}


	public void setCostTotal(Integer costTotal) {
		this.costTotal = costTotal;
	}


	public String getP_storeName() {
		return p_storeName;
	}

	public void setP_storeName(String p_storeName) {
		this.p_storeName = p_storeName;
	}

	public String getM_Id() {
		return m_Id;
	}


	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
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

	public Integer getQcStatus() {
		return qcStatus;
	}

	public void setQcStatus(Integer qcStatus) {
		this.qcStatus = qcStatus;
	}


	public String getQcContent() {
		return qcContent;
	}

	public void setQcContent(String qcContent) {
		this.qcContent = qcContent;
	}

	public String getN_Name() {
		return n_Name;
	}

	public void setN_Name(String n_Name) {
		this.n_Name = n_Name;
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

	public String getServiceItem() {
		return serviceItem;
	}

	public void setServiceItem(String serviceItem) {
		this.serviceItem = serviceItem;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public Integer getServicePrice() {
		return servicePrice;
	}


	public void setServicePrice(Integer servicePrice) {
		this.servicePrice = servicePrice;
	}

	public Integer getQcProfit() {
		return qcProfit;
	}

	public void setQcProfit(Integer qcProfit) {
		this.qcProfit = qcProfit;
	}
	

//	public Set<QuoteContractItemBean> getItems() {
//		return items;
//	}
//
//	public void setItems(Set<QuoteContractItemBean> items) {
//		this.items = items;
//	}

	

}
