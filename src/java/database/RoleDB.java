package database;

import java.util.List;
import javax.persistence.EntityManager;
import modules.Role;

/**
 *
 * @author WL
 */
public class RoleDB {
     public List<Role> getAll() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            List<Role> roles = em.createNamedQuery("Role.findAll", Role.class).getResultList();
            return roles;
        } finally {
            em.close();
        }
    }


    public Role get(int role_id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            Role role = em.find(Role.class,role_id);
            return role;
        } catch (Exception e) {
            System.out.println("Exception.");
        } finally {
            em.close();
        }
        return null;
    }
}
