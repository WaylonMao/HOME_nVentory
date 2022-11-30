package services;

import database.RoleDB;
import java.util.List;
import modules.Role;

/**
 *
 * @author WL
 */
public class RoleService {

    public RoleService() {
    }

    public List<Role> getRoles() {
        RoleDB rd = new RoleDB();
        return rd.getAll();
    }

    public String getRoleName(int roleId) {
        RoleDB rd = new RoleDB();
        return rd.get(roleId).getRoleName();
    }

    public Role getRole(int roleId) {
        RoleDB rd = new RoleDB();
        return rd.get(roleId);
    }

}
