package servlets;

import database.ItemDB;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modules.Item;

/**
 *
 * @author WL
 */
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("logout")) {
            HttpSession session = req.getSession();
            session.invalidate();
            resp.sendRedirect("login");
            return;
        }

        getServletContext().getRequestDispatcher("/WEB-INF/inventorysearch.jsp").forward(req, resp);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("search")) {
            String keyWord = req.getParameter("keyword");
            List<Item> items = new ItemDB().getAllItems();
            List<Item> results = new ArrayList<>();
            for (Item item : items) {
                boolean added = false;
                if (item.getItemName().toLowerCase().startsWith(keyWord.toLowerCase())) {
                    results.add(item);
                    added = true;
                }
                if (!added && item.getItemName().toLowerCase().indexOf(keyWord.toLowerCase()) >= 0) {
                    results.add(item);
                }
            }
            req.setAttribute("items", results);
        }
        this.doGet(req, resp);
        return;
    }

}
