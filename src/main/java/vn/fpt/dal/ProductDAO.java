package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.Product;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;

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
        return JPAUtil.getEntityManagerFactory().createEntityManager();
    }
}
