package _03_listProducts.dao;

import java.util.List;

import _03_listProducts.model.ProductBean;

public interface ProductDao {
	//查詢全部記錄
	List<ProductBean> getAllProducts();
	
	// 依P_Id來查詢單筆記錄
	ProductBean getProduct(int P_Id);
	
	//取類別清單
	List<String>  getAllCategories();
	
	//依類別取商品資料
	List<ProductBean>  getProductsByCategory(String category);
	
	//依ID取商品資料
	public ProductBean getProductById(int p_Id);
}
