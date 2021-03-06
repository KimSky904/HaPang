package dao;

import java.util.ArrayList;
import java.sql.*;

import dto.Product;

public class ProductRepository {
	
	public static ArrayList<Product> listOfProducts = new ArrayList<Product>();
	public static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null
					&& product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}		
		return productById;
	}
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}

}
















