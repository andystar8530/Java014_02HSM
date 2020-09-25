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
@Table(name = "Comment")
public class CommentBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ComID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer comId;

	@Column(name = "PostID")
	@Transient
	private Integer postId;
	@Column(name = "MemID")
	private Integer memId;
	@Column(name = "ComText")
	private String comText;
	@Column(name = "ComTime")
	private Date comTime;
	@Column(name = "ComLike")
	private Integer comLike;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "PostID")
	private ForumBean forumBean;
	
	public CommentBean() {
		super();
	}

	public Integer getComId() {
		return comId;
	}

	public void setComId(Integer comId) {
		this.comId = comId;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public Integer getMemId() {
		return memId;
	}

	public void setMemId(Integer memId) {
		this.memId = memId;
	}

	public String getComText() {
		return comText;
	}

	public void setComText(String comText) {
		this.comText = comText;
	}

	public Date getComTime() {
		return comTime;
	}

	public void setComTime(Date comTime) {
		this.comTime = comTime;
	}

	public Integer getComLike() {
		return comLike;
	}

	public void setComLike(Integer comLike) {
		this.comLike = comLike;
	}

	public ForumBean getForumBean() {
		return forumBean;
	}

	public void setForumBean(ForumBean forumBean) {
		this.forumBean = forumBean;
	}

	@Override
	public String toString() {
		return "CommentBean [comId=" + comId + ", postId=" + postId + ", memId=" + memId + ", comText=" + comText
				+ ", comTime=" + comTime + ", comLike=" + comLike + ", forumBean=" + forumBean + "]";
	}
}
