package newlywed.service;

import newlywed.model.NewlywedBean;

public interface NewlywedService {
	
    public boolean idExists(String id);
	
	public int saveNewlyed(NewlywedBean nb); 
	
	public NewlywedBean queryNewlywed(String id);
}
