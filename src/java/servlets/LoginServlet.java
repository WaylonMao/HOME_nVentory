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
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
            return;
        } else if (user.getIsAdmin()) {
            resp.sendRedirect("admin");
            return;
        } else {
            resp.sendRedirect("inventory");
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if (action == null || !action.equals("login") || email == null
                || email.equals("") || password == null || password.equals("")) {
            req.setAttribute("message", "Invalid login.");
            req.setAttribute("email", email);
            req.setAttribute("password", "");
            doGet(req, resp);
            return;
        }
        UserService us = new UserService();
        User user = us.get(email);
        if (user == null || !user.getActive()) {
            req.setAttribute("message", "Invalid login.");
            req.setAttribute("email", email);
            req.setAttribute("password", "");
            doGet(req, resp);
            return;
        }

        String salt = user.getSalt();
        if (salt == null) {
            salt = HashPasswordUtil.getSalt();
            String dbPassword = user.getPassword();
            try {
                String newPassword = HashPasswordUtil.hashAndSaltPassword(dbPassword, salt);
                user.setSalt(salt);
                user.setPassword(newPassword);
            } catch (NoSuchAlgorithmException ex) {
                req.setAttribute("message", "NoSuchAlgorithmException.");
            }
            us.suUpdate(user);
        }

        try {
            String inputPassword = HashPasswordUtil.hashAndSaltPassword(password, salt);
            String dbPassword = user.getPassword();
            if (!inputPassword.equals(dbPassword)) {
                req.setAttribute("message", "Invalid login.");
                req.setAttribute("email", email);
                req.setAttribute("password", "");
                doGet(req, resp);
                return;
            }
        } catch (NoSuchAlgorithmException ex) {
            req.setAttribute("message", "NoSuchAlgorithmException.");
        }

        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        if (user.getIsAdmin()) {
            resp.sendRedirect("admin");
        } else {
            resp.sendRedirect("inventory");
        }
        return;
    }

}
