package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    Product findById(int id);
    List<Product> search(String name);
    void save(Product product);
    void delete(int id);
    String view(int id);
    void update(int id,Product product);
}
