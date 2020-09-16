package _03_listProducts.dao;

import java.util.List;

import _03_listProducts.model.ProductBean;

public interface ProductDao {
	List<ProductBean> getAllProducts();
}
