package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.Product;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class ProductDAO extends AbstractDAO<Product, Long> {

    private ProductDAO(){}
    private static ProductDAO instance;
    public static ProductDAO getInstance() {
        if(instance == null) {
            instance = new ProductDAO();
        }
        return instance;
    }
    @Override
    public EntityManager entityManager() {
        return JPAUtil.getEntityManager();
    }

    public List<Product> getProductsByCategoryId(Long categoryId) {
        String jpql = "SELECT p FROM Product p JOIN p.category c WHERE c.id = :categoryId";
        TypedQuery<Product> query = entityManager().createQuery(jpql, Product.class);
        query.setParameter("categoryId", categoryId);
        return query.getResultList();
    }

    public List<Product> getProductsByKeyword(String keyword) {
        String jpql = "SELECT p FROM Product p WHERE p.name LIKE :keyword OR p.desc LIKE :keyword";
        TypedQuery<Product> query = entityManager().createQuery(jpql, Product.class);
        query.setParameter("keyword", "%" + keyword + "%");
        return query.getResultList();
    }



}
