package _04_forum.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="postcategories")
public class CategoriesBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PC_NO")
	private Integer pcNo;
	@Column(name = "PC_TYPE")
	private String pcType;
	@OneToMany(mappedBy = "categoriesBean")
	private List<ForumBean> posts = new ArrayList<>();
	
	public CategoriesBean() {
		super();
	}

	public CategoriesBean(Integer pcNo, String pcType) {
		super();
		this.pcNo = pcNo;
		this.pcType = pcType;
	}

	public Integer getPcNo() {
		return pcNo;
	}

	public void setPcNo(Integer pcNo) {
		this.pcNo = pcNo;
	}

	public String getPcType() {
		return pcType;
	}

	public void setPcType(String pcType) {
		this.pcType = pcType;
	}

	@Override
	public String toString() {
		return "CategoriesBean [pcNo=" + pcNo + ", pcType=" + pcType + "]";
	}
	
}
