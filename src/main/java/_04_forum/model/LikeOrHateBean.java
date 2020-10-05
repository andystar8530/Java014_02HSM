package _04_forum.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import _01_register.model.MemberBean;

@Entity
@Table(name = "likeOrHate")
public class LikeOrHateBean implements Serializable {
		private static final long serialVersionUID = 1L;
 
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer no;
		@ManyToOne(cascade = CascadeType.PERSIST)
		@JoinColumn(name = "postId")
		private ForumBean forumBean;
		@ManyToOne(cascade = CascadeType.PERSIST)
		@JoinColumn(name = "memId")
		private MemberBean memberBean;
		@Column(name="likeOrHate")
		private Integer likeOrHate;
		public LikeOrHateBean() {
			super();
		}

		public LikeOrHateBean(ForumBean forumBean, MemberBean memberBean, Integer likeOrHate) {
			super();
			this.forumBean = forumBean;
			this.memberBean = memberBean;
			this.likeOrHate = likeOrHate;
		}

		public ForumBean getForumBean() {
			return forumBean;
		}

		public void setForumBean(ForumBean forumBean) {
			this.forumBean = forumBean;
		}

		public MemberBean getMemberBean() {
			return memberBean;
		}

		public void setMemberBean(MemberBean memberBean) {
			this.memberBean = memberBean;
		}

		public Integer getLikeOrHate() {
			return likeOrHate;
		}

		public void setLikeOrHate(Integer likeOrHate) {
			this.likeOrHate = likeOrHate;
		}

		public Integer getNo() {
			return no;
		}

		public void setNo(Integer no) {
			this.no = no;
		}

		@Override
		public String toString() {
			return "LikeOrHateBean [forumBean=" + forumBean + ", memberBean=" + memberBean + ", likeOrHate="
					+ likeOrHate + "]";
		}
		
}
