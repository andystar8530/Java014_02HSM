package partner_h.quotecontract.template.model;

import java.io.Serializable;

public class ContractTemplateBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int p_MId;
	private int ctId;
	private String ctContent;
	public ContractTemplateBean() {
		super();
	}
	
	public ContractTemplateBean(int p_MId, String ctContent) {
		super();
		this.p_MId = p_MId;
		this.ctContent = ctContent;
	}

	public int getP_MId() {
		return p_MId;
	}
	public void setP_MId(int p_MId) {
		this.p_MId = p_MId;
	}
	public int getCtId() {
		return ctId;
	}
	public void setCtId(int ctId) {
		this.ctId = ctId;
	}
	public String getCtContent() {
		return ctContent;
	}
	public void setCtContent(String ctContent) {
		this.ctContent = ctContent;
	}


		
	
}
