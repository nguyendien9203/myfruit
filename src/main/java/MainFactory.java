import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;

public class MainFactory {
    public static void main(String[] args) {
        EntityManager entityManager = JPAUtil.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.getTransaction().commit();
        entityManager.close();
        JPAUtil.close();
    }
}
