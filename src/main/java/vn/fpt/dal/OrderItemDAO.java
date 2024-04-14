package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.OrderItem;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;

public class OrderItemDAO extends AbstractDAO<OrderItem, Long> {
    private OrderItemDAO(){}

    private static OrderItemDAO instance;

    public static OrderItemDAO getInstance() {
        if(instance == null) {
            instance = new OrderItemDAO();
        }
        return instance;
    }
    @Override
    public EntityManager entityManager() {
        return JPAUtil.getEntityManager();
    }
}
