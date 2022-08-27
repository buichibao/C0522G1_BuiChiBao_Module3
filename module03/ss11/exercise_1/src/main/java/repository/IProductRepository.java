package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findByAll();
    void add(Product product);
    Product searchById(int id);
    List<Product> searchByName(String name);

}
