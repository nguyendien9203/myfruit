package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.Category;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;

public class CategoryDAO extends AbstractDAO<Category, Long> {

    private CategoryDAO() {
    }

    private static CategoryDAO instance;

    public static CategoryDAO getInstance() {
        if(instance == null) {
            instance = new CategoryDAO();
        }
        return instance;
    }
    @Override
    public EntityManager entityManager() {
        return JPAUtil.getEntityManagerFactory().createEntityManager();
    }
}
