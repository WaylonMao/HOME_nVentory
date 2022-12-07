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
import services.ItemService;

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
        ItemService is = new ItemService(user);
        CategoryDB cdb = new CategoryDB();
        List<Item> items = is.getItems();
        List<Category> categories = cdb.getAll();
        req.setAttribute("user", user);
        req.setAttribute("items", items);
        req.setAttribute("categories", categories);

        getServletContext().getRequestDispatcher("/WEB-INF/inventory.jsp").forward(req, resp);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        ItemService is = new ItemService(user);

        if (action != null && action.equals("add")) {
            String message;
            int categoryID = Integer.parseInt(req.getParameter("category"));
            Category category = new CategoryDB().get(categoryID);
            String itemName = req.getParameter("itemName");
            Double price = transToDouble(req.getParameter("price"));
            Item item = new Item();
            item.setCategory(category);
            item.setItemName(itemName);
            item.setOwner(user);
            item.setPrice(price);
            if (is.add(item)) {
                req.setAttribute("message", "Invalid. Please re-enter.");
            } else {
                req.setAttribute("message", "The item was successfully added to your inventory.");
            }
            req.setAttribute("action", null);
        }

        if (action != null && action.equals("delete")) {
            Integer itemId = Integer.parseInt(req.getParameter("itemId"));
            if (is.delete(is.getItem(itemId))) {
                req.setAttribute("message", "Delete failed.");
            } else {
                req.setAttribute("message", "Item has been deleted.");
            }
        }
        doGet(req, resp);
        return;
    }

    public Double transToDouble(String input) {
        if (!input.matches("[1-9]\\d*\\.?\\d*")) {
            return 0.0;
        } else {
            return Double.parseDouble(input);
        }
    }

}
