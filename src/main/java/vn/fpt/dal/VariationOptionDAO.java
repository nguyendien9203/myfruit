package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.VariationOption;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;

public class VariationOptionDAO extends AbstractDAO<VariationOption, Long> {
    private VariationOptionDAO(){}
    private static VariationOptionDAO instance;

    public static VariationOptionDAO getInstance() {
        if(instance == null) {
            instance = new VariationOptionDAO();
        }
        return instance;
    }
    @Override
    public EntityManager entityManager() {
        return JPAUtil.getEntityManagerFactory().createEntityManager();
    }
}
