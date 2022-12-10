package servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modules.Role;
import modules.User;
import services.HashPasswordUtil;
import services.RoleService;
import services.UserService;

/**
 *
 * @author WL
 */
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        if (action != null && action.equals("logout")) {
            session.invalidate();
            resp.sendRedirect("login");
            return;
        }
        User user = (User) session.getAttribute("user");
        UserService us = new UserService();
        List<User> users = us.getAll();
        req.setAttribute("users", users);

        RoleService rs = new RoleService();
        List<Role> roles = rs.getRoles();
        req.setAttribute("roles", roles);

        getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(req, resp);
        return;

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        User admin = (User) session.getAttribute("user");
        UserService us = new UserService(admin);
        switch (action) {
            case "edit": {
                String email = req.getParameter("email");
                User user = us.get(email);
                req.setAttribute("editUser", user);
                break;
            }
            case "cancel": {
                req.setAttribute("editUser", null);
                req.setAttribute("message", "Cancel");
                break;
            }
            case "update": {
                String email = req.getParameter("email");
                boolean active = req.getParameter("active") != null;
                String firstName = req.getParameter("firstName");
                String lastName = req.getParameter("lastName");
                String roleId = req.getParameter("role");
                RoleService rs = new RoleService();
                Role role = rs.getRole(Integer.parseInt(roleId));

                User user = us.get(email);
                user.setActive(active);
                user.setRole(role);
                user.setEmail(email);
                user.setFirstName(firstName);
                user.setLastName(lastName);

                req.setAttribute("message", us.update(user));

                break;
            }
            case "add": {

                String email = req.getParameter("email");
                boolean active = req.getParameter("active") != null;
                String firstName = req.getParameter("firstName");
                String lastName = req.getParameter("lastName");
                String password = req.getParameter("password");
                String roleId = req.getParameter("role");
                RoleService rs = new RoleService();
                Role role = rs.getRole(Integer.parseInt(roleId));

                req.setAttribute("message", us.add(email, firstName, lastName, password, role));

                break;
            }
            case "delete": {
                String email = req.getParameter("email");
                User user = (User) req.getSession().getAttribute("user");
                if (user.getEmail().equals(email)) {
                    req.setAttribute("message", "You can not delete yourself!");
                    break;
                }
                String message = "Are you sure about that? "
                        + "<form method='post'><input type='hidden' name='action' value='remove' />"
                        + "<input type='hidden' name='email' value='" + email + "' />"
                        + "<input type='submit' value='Confirm' /></form><form method='post'>"
                        + "<input type='hidden' name='action' value='cancel' />"
                        + "<input type='submit' value='Cancel' /></form>";
                req.setAttribute("message", message);
                break;
            }
            case "remove": {
                String email = req.getParameter("email");
                User user = (User) req.getSession().getAttribute("user");
                if (user.getEmail().equals(email)) {
                    req.setAttribute("message", "You can not delete yourself!");
                    break;
                }
                User deleteUser = us.get(email);

                req.setAttribute("message", us.delete(deleteUser));

                break;
            }
            case "changePassword": {
                String email = req.getParameter("email");
                User user = us.get(email);
                req.setAttribute("passUser", user);

                break;
            }
            case "cancelPassword": {
                req.setAttribute("passUser", null);
                break;
            }
            case "confirmPassword": {
                String password = req.getParameter("newPassword");
                if (password == null || password == "" || password.indexOf(" ") >= 0) {
                    req.setAttribute("message", "Invalid Password!");
                    req.setAttribute("passUser", null);
                    break;
                }
                String email = req.getParameter("email");
                User user = us.get(email);
                String salt = HashPasswordUtil.getSalt();
                try {
                    String newPassword = HashPasswordUtil.hashAndSaltPassword(password, salt);
                    user.setPassword(newPassword);
                    user.setSalt(salt);
                } catch (NoSuchAlgorithmException ex) {
                    req.setAttribute("message", "NoSuchAlgorithmException.");
                    req.setAttribute("passUser", null);
                    break;
                }
                req.setAttribute("message", us.update(user));
                break;
            }
            default: {
                req.setAttribute("message", "Please don't hack me -_-! Thank you!");
                break;
            }
        }

        this.doGet(req, resp);

        return;
    }

}
