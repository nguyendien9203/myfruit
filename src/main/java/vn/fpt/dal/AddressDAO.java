package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.Address;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;

public class AddressDAO extends AbstractDAO<Address, Long> {

    private AddressDAO(){}

    private static AddressDAO instance;

    public static AddressDAO getInstance() {
        if(instance == null) {
            instance = new AddressDAO();
        }
        return instance;
    }
    @Override
    public EntityManager entityManager() {
        return JPAUtil.getEntityManager();
    }
}
