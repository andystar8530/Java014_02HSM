package _04_forum.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import _01_register.model.MemberBean;

@Entity
@Table(name="forum")
public class ForumBean implements Serializable{
		private static final long serialVersionUID = 1L;
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "F_ID")
		private Integer fId;
		@Column(name = "M_NO")
		@Transient
		private Integer mNo;
		@Transient
		private String search;
		@Column(name = "F_TITLE")
		private String fTitle;
		@Column(name = "F_TEXT")
		private String fText;
		@Column(name = "F_TIME")
		private Date fTime;
		@Transient
		private Integer fCom;
		@Column(name = "PostView")
		private Integer PostView;
		@Column(name = "F_CATEGORY")
		@Transient
		private Integer fCategory;
		@Column(name = "F_LIKE")
		@Transient
		private Integer fLike;
		@Column(name = "F_HATE")
		@Transient
		private Integer fHate;
		@ManyToOne(cascade = CascadeType.PERSIST)
		@JoinColumn(name = "PK_CategoriesBean_Id")
		private CategoriesBean categoriesBean;
		@OneToMany(mappedBy = "forumBean")
		private List<CommentBean> comments = new ArrayList<>();
		@ManyToOne(cascade = CascadeType.PERSIST)
		@JoinColumn(name = "M_NO")
		private MemberBean memberBean;
		@OneToMany(mappedBy = "forumBean")
		private List<LikeOrHateBean> likeOrHate = new ArrayList<>();
		
		public ForumBean() {
			super();
		}
		
		public ForumBean(Integer fId, Integer mNo, String fTitle, String fText, Date fTime, Integer fCom,
				Integer fCategory, Integer fLike, CategoriesBean categoriesBean, List<CommentBean> comments,
				MemberBean memberBean) {
			super();
			this.fId = fId;
			this.mNo = mNo;
			this.fTitle = fTitle;
			this.fText = fText;
			this.fTime = fTime;
			this.fCom = fCom;
			this.fCategory = fCategory;
			this.fLike = fLike;
			this.categoriesBean = categoriesBean;
			this.comments = comments;
			this.memberBean = memberBean;
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

		public List<CommentBean> getComments() {
			return comments;
		}

		public void setComments(List<CommentBean> comments) {
			this.comments = comments;
		}

		public MemberBean getMemberBean() {
			return memberBean;
		}

		public void setMemberBean(MemberBean memberBean) {
			this.memberBean = memberBean;
		}

		public Integer getfHate() {
			return fHate;
		}

		public void setfHate(Integer fHate) {
			this.fHate = fHate;
		}

		public List<LikeOrHateBean> getLikeOrHate() {
			return likeOrHate;
		}

		public void setLikeOrHate(List<LikeOrHateBean> likeOrHate) {
			this.likeOrHate = likeOrHate;
		}

		public Integer getPostView() {
			return PostView;
		}

		public void setPostView(Integer postView) {
			PostView = postView;
		}

		public String getSearch() {
			return search;
		}

		public void setSearch(String search) {
			this.search = search;
		}

		@Override
		public String toString() {
			return "ForumBean [fId=" + fId + ", mNo=" + mNo + ", fTitle=" + fTitle + ", fText=" + fText + ", fTime="
					+ fTime + ", fCom=" + fCom + ", fCategory=" + fCategory + ", fLike=" + fLike + ", categoriesBean="
					+ categoriesBean + ", comments=" + comments + ", memberBean=" + memberBean + "]";
		}

}
