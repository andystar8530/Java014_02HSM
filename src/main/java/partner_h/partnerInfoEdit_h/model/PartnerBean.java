package partner_h.partnerInfoEdit_h.model; 
//合作商資料
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mysql.cj.jdbc.Clob;

import _01_register.model.MemberBean;
import _06_Program.model.ProgramBean;
import partner_h._01_profolios.model.PortfoliosBean;

@Entity
@Table(name="Partner")
public class PartnerBean implements Serializable {
	
	// 本類別封裝單筆合作商家資料	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer p_id; //合作商家ID
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="p_mId")
	@JsonIgnore
	private MemberBean memberBean;
	
	@Transient
	private Integer p_mId;      //會員編號
	private String p_storeName;   //店家名稱
	@JsonIgnore
	private Blob p_stamp; //公司大小章
	@JsonIgnore
	private Blob p_coverPic; //封面圖
	private String p_service; //主要服務類型
	private String p_info;       			// 簡介
	private Integer p_area;    			// 服務區域
	private Double	p_review;     			// 評價
	private String p_lineId;    //LINE ID
	private String p_bankAcc; //銀行帳戶
	private Integer p_hRate; // 預估時薪
	private java.sql.Timestamp p_createTime;	// 會員建立日期
	private java.sql.Timestamp p_editTime;	// 最後編輯日期
	private String p_covFilename;
	private String p_staFilename;
	

	@OneToMany(mappedBy = "partnerBean")
	private List<PortfoliosBean> portfoliosList;
	
	@OneToMany(mappedBy = "partnerBean2")
	private List<ProgramBean> programsList ; 
	
	@Transient
	@JsonIgnore
	private MultipartFile covImage;
	@Transient
	@JsonIgnore
	private MultipartFile staImage;
	
	
	public PartnerBean() {}

		public PartnerBean(Integer p_id, Integer p_mId, String p_storeName, Blob p_stamp,
			Blob p_coverPic, String p_service, String p_info, Integer p_area, Double p_review, String p_lineId,
			String p_bankAcc, Integer p_hRate, Timestamp p_createTime, Timestamp p_editTime, String p_covFilename,
			String p_staFilename) {
		super();
		this.p_id = p_id;
		this.p_mId = p_mId;
		this.p_storeName = p_storeName;
		this.p_stamp = p_stamp;
		this.p_coverPic = p_coverPic;
		this.p_service = p_service;
		this.p_info = p_info;
		this.p_area = p_area;
		this.p_review = p_review;
		this.p_lineId = p_lineId;
		this.p_bankAcc = p_bankAcc;
		this.p_hRate = p_hRate;
		this.p_createTime = p_createTime;
		this.p_editTime = p_editTime;
		this.p_covFilename = p_covFilename;
		this.p_staFilename = p_staFilename;
	}

		public PartnerBean(Integer p_id, MemberBean memberBean, Integer p_mId, String p_storeName, Blob p_stamp,
				Blob p_coverPic, String p_service, String p_info, Integer p_area, Double p_review, String p_lineId,
				String p_bankAcc, Integer p_hRate, Timestamp p_createTime, Timestamp p_editTime, String p_covFilename,
				String p_staFilename, List<PortfoliosBean> portfoliosList, MultipartFile covImage,
				MultipartFile staImage) {
			this.p_id = p_id;
			this.memberBean = memberBean;
			this.p_mId = p_mId;
			this.p_storeName = p_storeName;
			this.p_stamp = p_stamp;
			this.p_coverPic = p_coverPic;
			this.p_service = p_service;
			this.p_info = p_info;
			this.p_area = p_area;
			this.p_review = p_review;
			this.p_lineId = p_lineId;
			this.p_bankAcc = p_bankAcc;
			this.p_hRate = p_hRate;
			this.p_createTime = p_createTime;
			this.p_editTime = p_editTime;
			this.p_covFilename = p_covFilename;
			this.p_staFilename = p_staFilename;
			this.portfoliosList = portfoliosList;
			this.covImage = covImage;
			this.staImage = staImage;
		}

		public Integer getP_id() {
			return p_id;
		}


		public void setP_id(Integer p_id) {
			this.p_id = p_id;
		}


		public MemberBean getMemberBean() {
			return memberBean;
		}


		public void setMemberBean(MemberBean memberBean) {
			this.memberBean = memberBean;
		}


		public Integer getP_mId() {
			return p_mId;
		}

		public void setP_mId(Integer p_mId) {
			this.p_mId = p_mId;
		}


		public String getP_storeName() {
			return p_storeName;
		}


		public void setP_storeName(String p_storeName) {
			this.p_storeName = p_storeName;
		}


		public Blob getP_stamp() {
			return p_stamp;
		}


		public void setP_stamp(Blob p_stamp) {
			this.p_stamp = p_stamp;
		}

		public Blob getP_coverPic() {
			return p_coverPic;
		}

		public void setP_coverPic(Blob p_coverPic) {
			this.p_coverPic = p_coverPic;
		}


		public String getP_service() {
			return p_service;
		}


		public void setP_service(String p_service) {
			this.p_service = p_service;
		}


		public String getP_info() {
			return p_info;
		}


		public void setP_info(String p_info) {
			this.p_info = p_info;
		}


		public Integer getP_area() {
			return p_area;
		}


		public void setP_area(Integer p_area) {
			this.p_area = p_area;
		}


		public Double getP_review() {
			return p_review;
		}

	
		public void setP_review(Double p_review) {
			this.p_review = p_review;
		}


		public String getP_lineId() {
			return p_lineId;
		}


		public void setP_lineId(String p_lineId) {
			this.p_lineId = p_lineId;
		}



		public String getP_bankAcc() {
			return p_bankAcc;
		}


		public void setP_bankAcc(String p_bankAcc) {
			this.p_bankAcc = p_bankAcc;
		}

		public Integer getP_hRate() {
			return p_hRate;
		}


		public void setP_hRate(Integer p_hRate) {
			this.p_hRate = p_hRate;
		}


		public java.sql.Timestamp getP_createTime() {
			return p_createTime;
		}


		public void setP_createTime(java.sql.Timestamp p_createTime) {
			this.p_createTime = p_createTime;
		}


		public java.sql.Timestamp getP_editTime() {
			return p_editTime;
		}






		/**
		 * @param p_editTime the p_editTime to set
		 */
		public void setP_editTime(java.sql.Timestamp p_editTime) {
			this.p_editTime = p_editTime;
		}






		/**
		 * @return the p_covFilename
		 */
		public String getP_covFilename() {
			return p_covFilename;
		}




		public void setP_covFilename(String p_covFilename) {
			this.p_covFilename = p_covFilename;
		}



		public String getP_staFilename() {
			return p_staFilename;
		}



		public void setP_staFilename(String p_staFilename) {
			this.p_staFilename = p_staFilename;
		}


		public MultipartFile getCovImage() {
			return covImage;
		}

		public void setCovImage(MultipartFile covImage) {
			this.covImage = covImage;
		}


		public MultipartFile getStaImage() {
			return staImage;
		}


		public void setStaImage(MultipartFile staImage) {
			this.staImage = staImage;
		}




		@Override
		public String toString() {
			return p_id+"/"+p_storeName+"/"+p_info+"/"+p_lineId;
		}


	


	
	

}