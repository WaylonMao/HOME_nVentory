package servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modules.User;
import services.HashPasswordUtil;
import services.RoleService;
import services.UserService;

/**
 *
 * @author WL
 */
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        getServletContext().getRequestDispatcher("/WEB-INF/registration.jsp").forward(req, resp);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || !action.equals("reg")) {
            this.doGet(req, resp);
            return;
        }
        String email = req.getParameter("email");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String password1 = req.getParameter("password");
        String password2 = req.getParameter("confirmPassword");
        String message = "";
        if (!password1.equals(password2)) {
            req.setAttribute("email", email);
            req.setAttribute("firstName", firstName);
            req.setAttribute("lastName", lastName);
            req.setAttribute("password", "");
            req.setAttribute("confirmPassword", "");
            req.setAttribute("message", "Two passwords do not match.");
            this.doGet(req, resp);
            return;
        }
        // Set new user default as regular user.
        message = new UserService().add(email,firstName,lastName,password1,new RoleService().getRole(2));
        req.setAttribute("message", message);
        this.doGet(req, resp);
        return;
    }

}
