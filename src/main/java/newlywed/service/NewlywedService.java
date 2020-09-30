package newlywed.service;

import newlywed.model.NewlywedBean;

public interface NewlywedService {
	
     boolean idExists(String id);
	
	 int saveNewlyed(NewlywedBean nb); 
	
	 NewlywedBean queryNewlywed(String id);
}
