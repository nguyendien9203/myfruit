package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.Order;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

public class OrderDAO extends AbstractDAO<Order, Long> {

    private OrderDAO(){}

    private static OrderDAO instance;

    public static OrderDAO getInstance() {
        if(instance == null) {
            instance = new OrderDAO();
        }
        return instance;
    }
    @Override
    public EntityManager entityManager() {
        return JPAUtil.getEntityManager();
    }

    // Lấy doanh thu trong một tháng
    public BigDecimal getTotalRevenueThisMonth() {
        LocalDateTime currentDateTime = LocalDateTime.now();
        LocalDateTime firstDayOfMonth = currentDateTime.withDayOfMonth(1).with(LocalTime.MIN);
        LocalDateTime lastDayOfMonth = currentDateTime.withDayOfMonth(currentDateTime.getMonth().length(currentDateTime.toLocalDate().isLeapYear())).with(LocalTime.MAX);

        Date startDate = Date.from(firstDayOfMonth.atZone(ZoneId.systemDefault()).toInstant());
        Date endDate = Date.from(lastDayOfMonth.atZone(ZoneId.systemDefault()).toInstant());


        TypedQuery<BigDecimal> query = entityManager().createQuery(
                "SELECT SUM(o.orderTotal) FROM Order o WHERE o.orderDate BETWEEN :startDate AND :endDate",
                BigDecimal.class);
        query.setParameter("startDate", startDate);
        query.setParameter("endDate", endDate);

        return query.getSingleResult();
    }



    // Lấy doanh thu trong một ngày
    public BigDecimal getTotalRevenueToday() {
        LocalDateTime currentDateTime = LocalDateTime.now();
        LocalDateTime startOfDay = currentDateTime.with(LocalTime.MIN);
        LocalDateTime endOfDay = currentDateTime.with(LocalTime.MAX);

        // Chuyển đổi LocalDateTime sang java.util.Date
        Date startDate = Date.from(startOfDay.atZone(ZoneId.systemDefault()).toInstant());
        Date endDate = Date.from(endOfDay.atZone(ZoneId.systemDefault()).toInstant());

        TypedQuery<BigDecimal> query = entityManager().createQuery(
                "SELECT SUM(o.orderTotal) FROM Order o WHERE o.orderDate BETWEEN :startOfDay AND :endOfDay",
                BigDecimal.class);
        query.setParameter("startOfDay", startDate);
        query.setParameter("endOfDay", endDate);

        return query.getSingleResult();
    }




    public long getTotalOrdersToday() {
        LocalDateTime startOfDay = LocalDateTime.now().withHour(0).withMinute(0).withSecond(0).withNano(0);
        LocalDateTime endOfDay = LocalDateTime.now().withHour(23).withMinute(59).withSecond(59).withNano(999);

        Date startDate = Date.from(startOfDay.atZone(ZoneId.systemDefault()).toInstant());
        Date endDate = Date.from(endOfDay.atZone(ZoneId.systemDefault()).toInstant());

        TypedQuery<Long> query = entityManager().createQuery(
                "SELECT COUNT(o.id) FROM Order o WHERE o.orderDate BETWEEN :startOfDay AND :endOfDay",
                Long.class);
        query.setParameter("startOfDay", startDate);
        query.setParameter("endOfDay", endDate);

        return query.getSingleResult();
    }



    // lấy 5 đơn hàng gần nhất
    public List<Order> getLatestOrders() {

        String jpql = "SELECT o FROM Order o ORDER BY o.orderDate DESC";
        Query query = entityManager().createQuery(jpql);
        query.setMaxResults(5);
        return query.getResultList();

    }

    public static void main(String[] args) {
        OrderDAO orderDAO = OrderDAO.getInstance();
        BigDecimal total = orderDAO.getTotalRevenueToday();
        BigDecimal totalMonth = orderDAO.getTotalRevenueThisMonth();
        Long totalOrder = orderDAO.getTotalOrdersToday();
        System.out.println("Total month: " + totalMonth);
        System.out.println("Total day: " +total);
        System.out.println("Total order: " + totalOrder);
        LocalDateTime localDateTime = LocalDateTime.now();
        Date date = new Date();
        System.out.println(localDateTime);
        System.out.println(date);
    }
}
