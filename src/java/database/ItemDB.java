package database;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import modules.Item;
import modules.User;

/**
 *
 * @author WL
 */
public class ItemDB {

    public List<Item> getItems() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Item> items = em.createNamedQuery("Item.findAll", Item.class).getResultList();
            return items;
        } finally {
            em.close();
        }
    }

    public Item getItem(Integer itemID) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            Item item = em.find(Item.class, itemID);
            return item;
        } finally {
            em.close();
        }
    }

    public void updateItems(List<Item> items) {
        for (Item item : items) {
            this.updateItem(item);
        }
    }

    public List<Item> getItemsOf(User user) {
        try {
            List<Item> items = getItems();
            List<Item> userItems = new ArrayList<>();
            for (Item item : items) {
                if (item.getOwner().equals(user)) {
                    userItems.add(item);
                }
            }
            return userItems;
        } catch (Exception e) {
            System.out.println("Exception during getting Items");
        }
        return null;
    }

    public void insertItem(Item newItem) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            User user = newItem.getOwner();
            user.getItemList().add(newItem);
            trans.begin();
            em.persist(newItem);
            em.merge(user);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public void updateItem(Item item) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(item);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public void removeItem(Item item) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            User user = item.getOwner();
            user.getItemList().remove(item);
            trans.begin();
            em.remove(em.merge(item));
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

}
