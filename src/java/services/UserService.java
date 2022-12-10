package services;

import java.util.List;
import database.UserDB;
import java.security.NoSuchAlgorithmException;
import modules.Role;
import modules.User;

/**
 *
 * @author WL
 */
public class UserService {

    private final User USER;

    public UserService() {
        this.USER = null;
    }

    public UserService(User user) {
        this.USER = user;
    }

    public List<User> getAll() {
        List<User> users;
        UserDB ud = new UserDB();
        users = ud.getAll();
        return users;
    }

    public User get(String email) {
        UserDB ud = new UserDB();
        User user = ud.get(email);
        return user;
    }

    public String add(String email, String firstName, String lastName, String password, Role role) {
        try {
            String salt = HashPasswordUtil.getSalt();
            String hashedPassword = HashPasswordUtil.hashAndSaltPassword(password, salt);
            User user = new User(email, true, firstName, lastName, hashedPassword, salt);
            user.setRole(role);
            UserDB ud = new UserDB();
            if (!validate(user)) {
                return "Invalid user data! Please try again.";
            }
            if (ud.get(user.getEmail()) != null) {
                return "User's email address already exists!";
            }
            ud.insert(user);
            return "User added successfully!";
        } catch (NoSuchAlgorithmException ex) {
            return "NoSuchAlgorithmException.";
        }
    }

    public String update(User user) {
        UserDB ud = new UserDB();
        User targetUser = ud.get(user.getEmail());
        if (targetUser == null) {
            return "User not found!";
        }
        if (!USER.getIsAdmin() && !user.getEmail().equals(USER.getEmail())) {
            return "You do not have permission!";
        }
        if (validate(user)) {
            ud.update(user);
            return "User updated successfully!";
        }
        return "Invalid user data! Please try again.";
    }

    public String suUpdate(User user) {
        UserDB ud = new UserDB();
        User targetUser = ud.get(user.getEmail());
        if (targetUser == null) {
            return "User not found!";
        }
        if (validate(user)) {
            ud.update(user);
            return "User updated successfully!";
        }
        return "Invalid user data! Please try again.";
    }

    public String delete(User user) {
        if (user.equals(USER)) {
            return "You cannot delete yourself.";
        }
        UserDB ud = new UserDB();
        User targetUser = ud.get(user.getEmail());
        if (targetUser == null) {
            return "User not found!";
        }
        ud.delete(user);
        return "User deleted successfully!";
    }

    public boolean isExist(User user) {
        UserDB ud = new UserDB();
        User dbUser = ud.get(user.getEmail());
        return user.equals(dbUser);
    }

    private boolean validate(User user) {
        String email = user.getEmail();
        String firstName = user.getFirstName();
        String lastName = user.getLastName();
        String password = user.getPassword();
        if (email == null || email.isEmpty() || email.length() > 40
                || !email.matches("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")) {
            return false;
        }
        if (firstName == null || firstName.isEmpty() || firstName.length() > 20) {
            return false;
        }
        if (lastName == null || lastName.isEmpty() || lastName.length() > 20) {
            return false;
        }
        if (password == null || password.isEmpty() || password.length() > 70) {
            return false;
        }
        return true;
    }
}
