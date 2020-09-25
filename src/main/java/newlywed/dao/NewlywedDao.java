package newlywed.dao;


import newlywed.model.NewlywedBean;

    public interface NewlywedDao {
   
	public boolean idExists(String id);
	
	public int saveNewlyed(NewlywedBean nb); 
	
	public NewlywedBean queryNewlywed(String id);
}
