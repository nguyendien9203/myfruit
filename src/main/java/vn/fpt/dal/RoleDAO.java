package vn.fpt.dal;

import vn.fpt.common.AbstractDAO;
import vn.fpt.entity.Role;
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

public class RoleDAO extends AbstractDAO<Role, Long> {
    @Override
    public EntityManager entityManager() {
        return JPAUtil.getEntityManager();
    }

    private RoleDAO() {
    }

    private static RoleDAO instance;

    public static RoleDAO getInstance() {
        if(instance == null) {
            instance = new RoleDAO();
        }
        return instance;
    }

    public Role findByRoleName(String roleName) {
        Query query = entityManager().createQuery("SELECT r FROM Role r WHERE r.roleName = :roleName");
        query.setParameter("roleName", roleName);

        Role role;
        try {
            role = (Role) query.getSingleResult();
        } catch (NoResultException e) {
            role = new Role();
            role.setRoleName(roleName);

            try {
                entityManager().getTransaction().begin();
                entityManager().persist(role);
                System.out.println("Save success !!!");
                entityManager().getTransaction().commit();
            } catch (Exception ex ) {
                System.out.println("Error save entity: " + ex.getMessage());
                entityManager().getTransaction().rollback();
            }
        }

        return role;
    }

    public static void main(String[] args) {
//        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
//        Role role = new Role();
//        role.setRoleName("admin");
//        em.getTransaction().begin();
//        em.persist(role);
//        System.out.println("Save success !!!");
//        em.getTransaction().commit();

    }


}
