package _03_listProducts.service;

import java.util.List;
import java.util.Map;

import _03_listProducts.model.ProductBean;

public interface ProductService {
	//查詢全部記錄
	List<ProductBean> getAllProducts();

	//取類別清單ok
	List<String>  getAllCategories();

	//依類別取商品資料
	List<ProductBean>  getProductsByCategory(String category);
	
	//依ID取商品資料ok
	ProductBean getProductById(int p_Id);
	
	//類別選單ok
	String getCategoryTag();
	
	// 新增一筆記錄ok
	int saveProduct(ProductBean bean);
	
	//修改一筆記錄ok
	int updateProduct(ProductBean bean, long sizeInBytes) ;
	
	// 依p_Id來刪除單筆記錄ok
	int deleteProduct(int p_Id);
	
	//瀏覽頁相關
	Map<Integer, ProductBean> getPageProducts(int pageNo);
	long getRecordCounts();
	int getRecordsPerPage();
	int getTotalPages();
	void setRecordsPerPage(int recordsPerPage);
	void setSelected(String category);
	
	
	
}
