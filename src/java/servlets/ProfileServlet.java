package servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modules.User;
import services.HashPasswordUtil;
import services.UserService;

/**
 *
 * @author WL
 */
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("logout")) {
            HttpSession session = req.getSession();
            session.invalidate();
            resp.sendRedirect("login");
            return;
        }
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        req.setAttribute("user", user);
        String changePassword = req.getParameter("changePassword");
        if (changePassword != null && changePassword.equals("true")) {
            req.setAttribute("changePassword", true);
        }
        getServletContext().getRequestDispatcher("/WEB-INF/profile.jsp").forward(req, resp);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        UserService us = new UserService(user);

        if (action != null && action.equals("cancel")) {
            resp.sendRedirect("inventory");
            return;
        }

        if (action != null && action.equals("update")) {
            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            String password1 = "";
            String password2 = "";
            boolean changePass = false;
            if (req.getParameter("changePassword") != null && req.getParameter("changePassword").equals("true")) {
                password1 = req.getParameter("password1");
                password2 = req.getParameter("password2");
                changePass = true;
            }
            String message = "";
            if (changePass && !password1.equals(password2)) {
                req.setAttribute("message", "Two passwords do not match.");
                this.doGet(req, resp);
                return;
            }
            user.setFirstName(firstName);
            user.setLastName(lastName);
            if (changePass) {
                String salt = HashPasswordUtil.getSalt();
                String hashedPassword = "";
                try {
                    hashedPassword = HashPasswordUtil.hashAndSaltPassword(password1, salt);
                } catch (NoSuchAlgorithmException ex) {
                    req.setAttribute("message", "NoSuchAlgorithmException.");
                }
                user.setSalt(salt);
                user.setPassword(hashedPassword);
            }
            message = us.update(user);
            req.setAttribute("message", message);
            session.setAttribute("user", user);
            this.doGet(req, resp);
        }

        if (action != null && action.equals("deactivate")) {
            req.setAttribute("message", "Are you confirm to deactive your account?");
            req.setAttribute("deactivate", true);
            this.doGet(req, resp);
        }

        if (action != null && action.equals("doDeactivate")) {
            user.setActive(false);
            us.update(user);
            user = us.get(user.getEmail());
            if (!user.getActive()) {
                session.invalidate();
                req.setAttribute("message", "Deactivated successfully.");
                req.setAttribute("disable", true);
            } else {
                req.setAttribute("message", "Deactivated failed.");
            }
            this.doGet(req, resp);
        }
        return;
    }

}
