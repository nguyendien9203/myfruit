package vn.fpt.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtil {
    private static final String PERSISTENCE_UNIT_NAME = "persistenceUnit";


    private static EntityManager entityManager;

    public static EntityManager getEntityManager() {
        if(entityManager == null) {
            entityManager = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME).createEntityManager();
        }
        return entityManager;
    }

    public static void close() {
        if(entityManager != null) {
            entityManager.close();
        }
    }
}
