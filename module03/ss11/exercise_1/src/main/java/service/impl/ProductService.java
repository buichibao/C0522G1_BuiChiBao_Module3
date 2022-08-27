package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository repository = new ProductRepository();
    @Override
    public List<Product> findByAll() {
        return  repository.findByAll();
    }

    @Override
    public void add(Product product) {
         repository.add(product);
    }

    @Override
    public Product searchById(int id) {
        return repository.searchById(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return repository.searchByName(name);
    }
}
