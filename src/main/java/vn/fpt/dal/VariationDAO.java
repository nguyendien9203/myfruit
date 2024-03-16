package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.Variation;
import vn.fpt.entity.VariationOption;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;

public class VariationDAO extends AbstractDAO<Variation, Long> {
    private VariationDAO(){}
    private static VariationDAO instance;

    public static VariationDAO getInstance() {
        if(instance == null) {
            instance = new VariationDAO();
        }
        return instance;
    }
    @Override
    public EntityManager entityManager() {
        return JPAUtil.getEntityManagerFactory().createEntityManager();
    }
}
