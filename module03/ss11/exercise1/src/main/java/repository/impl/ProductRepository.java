package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.*;

public class ProductRepository implements IProductRepository {
    private  static Map<Integer,Product> productList = new HashMap<>();
    static {
        productList.put(1,new Product(1,"Laptop",21000,"Black","ACER"));
        productList.put(2,new Product(2,"IPhoneX",1000,"Red","APPLE"));
        productList.put(3,new Product(3,"Nokia",2000,"Yellow","NOKIA"));
        productList.put(4,new Product(4,"SmartWatch",500,"Green","APPLE"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public List<Product> search(String name) {
        List<Product> list = new ArrayList<>();
        Set<Integer> set =productList.keySet();
        for (Integer integer:set) {
            if(productList.get(integer).getProductName().contains(name)){
                list.add(productList.get(integer));
            }
        }
        return list;
    }

    @Override
    public void save(Product product) {
      productList.put(product.getId(),product);
    }

    @Override
    public void delete(int id) {
     productList.remove(id);
    }

    @Override
    public String view(int id) {
        return null;
    }

    @Override
    public void update(int id, Product product) {
       productList.put(id,product);
    }
}
