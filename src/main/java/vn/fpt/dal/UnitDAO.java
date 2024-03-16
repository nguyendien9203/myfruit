package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.Unit;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;

public class UnitDAO extends AbstractDAO<Unit, Long> {

    private UnitDAO(){}
    private static UnitDAO instance;

    public static UnitDAO getInstance() {
        if(instance == null) {
            instance = new UnitDAO();
        }
        return instance;
    }
    @Override
    public EntityManager entityManager() {
        return JPAUtil.getEntityManagerFactory().createEntityManager();
    }
}
