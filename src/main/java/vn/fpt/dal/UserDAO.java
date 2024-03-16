package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.constant.Status;
import vn.fpt.entity.Role;
import vn.fpt.entity.User;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class UserDAO extends AbstractDAO<User, Long> {
    @Override
    public EntityManager entityManager() {
        return JPAUtil.getEntityManagerFactory().createEntityManager();
    }

    private UserDAO(){
    }

    private static UserDAO instance;

    public static UserDAO getInstance() {
        if(instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    public User findByUsername(String username) {
        try {
            Query query = entityManager().createQuery("SELECT u FROM User u WHERE u.username = :username");
            query.setParameter("username", username);
            return (User) query.getSingleResult();
        }catch (Exception e) {
            e.getMessage();
        }
        return null;
    }

    public static void main(String[] args) {
//        User user = new User();
//        user.setFullName("Nguyễn Văn Diên");
//        user.setUsername("admin123");
//        user.setPassword("123");
//        user.setStatus(Status.ACTIVE);
//
//        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
//        em.getTransaction().begin();
//        em.persist(user);
//        System.out.println("Save success !!!");
//        em.getTransaction().commit();
//        UserDAO userDAO = UserDAO.getInstance();
//
//        List<User> list = userDAO.findAll();
//        for(User u : list) {
//            System.out.println(u);
//        }

    }
}
