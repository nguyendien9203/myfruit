package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.Category;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

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
        return JPAUtil.getEntityManager();
    }

    public Category getCategoryByName(String name) {
        Query query = entityManager().createQuery("SELECT c FROM Category c WHERE c.name = :name", Category.class);
        query.setParameter("name", name);
        List<Category> categories = query.getResultList();
        return categories.stream().findFirst().orElse(null);
    }

    public static void main(String[] args) {
        CategoryDAO categoryDAO = CategoryDAO.getInstance();
        List<Category> list = categoryDAO.findAll();
        for(Category c : list) {
            System.out.println(c);
        }
    }


}


