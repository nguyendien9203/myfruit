package vn.fpt.common;

import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public abstract class AbstractDAO<T, ID extends Serializable> {

    EntityManager em = JPAUtil.getEntityManager();
    public abstract EntityManager entityManager();

    private final Class<T> entityClass;

    @SuppressWarnings("unchecked")
    public AbstractDAO() {
        this.entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    public T findById(ID id) {
        return em.find(entityClass, id);
    }

    public List<T> findAll() {
        return em.createQuery("FROM " + entityClass.getName()).getResultList();
    }

    public void insert(T entity) {
        try {
            em.getTransaction().begin();
            em.persist(entity);
            System.out.println("Create success !!!");
            em.getTransaction().commit();
        } catch (Exception e ) {
            System.out.println("Error save entity: " + e.getMessage());
            em.getTransaction().rollback();
        }
    }

    public void update(T entity) {
        try {
            em.getTransaction().begin();
            em.merge(entity);
            System.out.println("update success !!!");
            em.getTransaction().commit();
        } catch (Exception e ) {
            System.out.println("Error update entity: " + e.getMessage());
            em.getTransaction().rollback();
        }
    }

    public void delete(T entity) {
        try {
            em.getTransaction().begin();
            em.remove(entity);
            System.out.println("Remove success !!!");
            em.getTransaction().commit();
        } catch (Exception e ) {
            System.out.println("Error remove entity: " + e.getMessage());
            em.getTransaction().rollback();
        }
    }

    public void deleteById(ID id) {
        T entity = findById(id);
        if (entity != null) {
            try {
                em.getTransaction().begin();
                em.remove(entity);
                System.out.println("Remove success !!!");
                em.getTransaction().commit();
            } catch (Exception e ) {
                System.out.println("Error romove entity: " + e.getMessage());
                em.getTransaction().rollback();
            }
        }
    }
}
