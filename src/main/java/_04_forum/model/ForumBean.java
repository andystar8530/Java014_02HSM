package _04_forum.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="forum")
public class ForumBean implements Serializable{
		private static final long serialVersionUID = 1L;
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "F_ID")
		private Integer fId;
		@Column(name = "M_NO")
		private Integer mNo;
		@Column(name = "F_TITLE")
		private String fTitle;
		@Column(name = "F_TEXT")
		private String fText;
		@Column(name = "F_TIME")
		private Date fTime;
		@Column(name = "F_COM")
		private Integer fCom;
		@Column(name = "F_CATEGORY")
		@Transient
		private Integer fCategory;
		@Column(name = "F_LIKE")
		private Integer fLike;
		@ManyToOne(cascade = CascadeType.ALL)
		@JoinColumn(name = "PK_CategoriesBean_Id")
		private CategoriesBean categoriesBean;
		
		public ForumBean() {
			super();
		}

		public ForumBean(Integer fId, Integer mNo, String fTitle, String fText, Date fTime, Integer fCom,
				Integer fCategory, Integer fLike) {
			super();
			this.fId = fId;
			this.mNo = mNo;
			this.fTitle = fTitle;
			this.fText = fText;
			this.fTime = fTime;
			this.fCom = fCom;
			this.fCategory = fCategory;
			this.fLike = fLike;
		}
		
		public Integer getfId() {
			return fId;
		}
		public void setfId(Integer fId) {
			this.fId = fId;
		}
		public Integer getmNo() {
			return mNo;
		}
		public void setmNo(Integer mNo) {
			this.mNo = mNo;
		}
		public String getfTitle() {
			return fTitle;
		}
		public void setfTitle(String fTitle) {
			this.fTitle = fTitle;
		}
		public String getfText() {
			return fText;
		}
		public void setfText(String fText) {
			this.fText = fText;
		}
		public Date getfTime() {
			return fTime;
		}
		public void setfTime(Date fTime) {
			this.fTime = fTime;
		}
		public Integer getfCom() {
			return fCom;
		}
		public void setfCom(Integer fCom) {
			this.fCom = fCom;
		}
		public Integer getfCategory() {
			return fCategory;
		}
		public void setfCategory(Integer fCategory) {
			this.fCategory = fCategory;
		}
		public Integer getfLike() {
			return fLike;
		}
		public void setfLike(Integer fLike) {
			this.fLike = fLike;
		}
		

		public CategoriesBean getCategoriesBean() {
			return categoriesBean;
		}

		public void setCategoriesBean(CategoriesBean categoriesBean) {
			this.categoriesBean = categoriesBean;
		}

		@Override
		public String toString() {
			return "ForumBean [fId=" + fId + ", mNo=" + mNo + ", fTitle=" + fTitle + ", fText=" + fText + ", fTime="
					+ fTime + ", fCom=" + fCom + ", fCategory=" + fCategory + ", fLike=" + fLike + "]";
		}

}
