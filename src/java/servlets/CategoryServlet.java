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

/**
 *
 * @author WL
 */
public class CategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equals("logout")) {
            HttpSession session = req.getSession();
            session.invalidate();
            resp.sendRedirect("login");
            return;
        }

        CategoryDB cdb = new CategoryDB();
        List<Category> categories = cdb.getAll();
        req.setAttribute("categories", categories);

        getServletContext().getRequestDispatcher("/WEB-INF/category.jsp").forward(req, resp);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        CategoryDB cdb = new CategoryDB();

        if (action != null && action.equals("add")) {
            String message;
            String categoryName = req.getParameter("categoryName");
            if (categoryName == null || categoryName.equals("")) {
                req.setAttribute("message", "Invalid. Please re-enter.");
                this.doGet(req, resp);
                return;
            }
            Category category = new Category();
            category.setCategoryName(categoryName);
            cdb.insert(category);
            req.setAttribute("message", "Category added.");
            req.setAttribute("action", null);
        }

        if (action != null && action.equals("edit")) {
            Integer categoryId = Integer.parseInt(req.getParameter("categoryId"));
            Category editCategory = cdb.get(categoryId);
            req.setAttribute("editCategory", editCategory);
        }

        if (action != null && action.equals("update")) {
            Integer categoryId = Integer.parseInt(req.getParameter("categoryId"));
            Category editCategory = cdb.get(categoryId);
            String categoryName = req.getParameter("categoryName");
            if (categoryName == null || categoryName.equals("")) {
                req.setAttribute("message", "Invalid. Please re-enter.");
                this.doGet(req, resp);
                return;
            }
            editCategory.setCategoryName(categoryName);
            cdb.update(editCategory);
            req.setAttribute("message", "Updated successfully.");        }

        doGet(req, resp);
        return;
    }
}
