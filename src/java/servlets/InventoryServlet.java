package servlets;

import database.CategoryDB;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modules.Category;
import modules.Item;
import modules.User;

/**
 *
 * @author WL
 */
public class InventoryServlet extends HttpServlet {

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
        if (user == null) {
            resp.sendRedirect("login");
            return;
        }
        List<Item> items = user.getItemList();
        List<Category> categories = new CategoryDB().getAll();
        req.setAttribute("user", user);
        req.setAttribute("items", items);
        req.setAttribute("categories", categories);

        getServletContext().getRequestDispatcher("/WEB-INF/inventory.jsp").forward(req, resp);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
