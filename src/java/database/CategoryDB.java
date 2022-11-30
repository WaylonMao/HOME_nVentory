/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import modules.Category;

/**
 *
 * @author WL
 */
public class CategoryDB {
    public Category get(Integer categoryId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            Category category = em.find(Category.class, categoryId);
            return category;
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }

    public List<Category> getAll() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Category> categorys = em.createNamedQuery("Category.findAll", Category.class).getResultList();
            return categorys;
        } finally {
            em.close();
        }
    }

    public void insert(Category category) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(category);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public void update(Category category) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(category);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

}
