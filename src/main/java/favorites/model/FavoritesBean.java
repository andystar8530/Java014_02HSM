package favorites.model;

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

import newlywed.model.NewlywedBean;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h.partnerInfoEdit_h.model.PartnerBean;

@Entity
@Table(name = "favorites")
public class FavoritesBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "FF")
	private Integer FF;

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "N_mid")
	private NewlywedBean newlywedBean;

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "P_id")
	private PartnerBean partnerBean3;
	
	@Column(name="aaa")
	private int aaa;

	public FavoritesBean() {
		super();
	}

	public FavoritesBean(Integer fF, NewlywedBean newlywedBean, PartnerBean partnerBean3) {
		super();
		FF = fF;
		this.newlywedBean = newlywedBean;
		this.partnerBean3 = partnerBean3;
	}

	public Integer getFF() {
		return FF;
	}

	public void setFF(Integer fF) {
		FF = fF;
	}

	public NewlywedBean getNewlywedBean() {
		return newlywedBean;
	}

	public void setNewlywedBean(NewlywedBean newlywedBean) {
		this.newlywedBean = newlywedBean;
	}

	public PartnerBean getPartnerBean() {
		return partnerBean3;
	}

	public void setPartnerBean(PartnerBean partnerBean) {
		this.partnerBean3 = partnerBean;
	}

	public int getAaa() {
		return aaa;
	}

	public void setAaa(int aaa) {
		this.aaa = aaa;
	}
	
	
}
