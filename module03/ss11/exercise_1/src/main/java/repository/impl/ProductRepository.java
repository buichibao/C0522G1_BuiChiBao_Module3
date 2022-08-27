package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
      productList.add(new Product(1,"Duy Quyết",5,"Ngon","Bố mẹ Quyết"));
      productList.add(new Product(2,"Văn Nam",5,"Ngon","Bố mẹ Nam"));
      productList.add(new Product(3,"Phạm Đạt",5,"Ngon","Bố mẹ Đạt"));
    }
    @Override
    public List<Product> findByAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
      productList.add(product);
    }

    @Override
    public Product searchById(int id) {
        List<Product> list = new ArrayList<>();
        for (Product product:productList) {
            if(product.getId()==id){
                list.add(product);
                return product;
            }
        }
        return null;
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> list = new ArrayList<>();
        for (Product product:productList) {
           if(product.getProductName().contains(name)){
                list.add(product);
           }
        }
        return list;
    }
}
