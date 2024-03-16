package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.CategoryDAO;
import vn.fpt.entity.Category;
import vn.fpt.entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminEditCategoryServlet", urlPatterns = "/admin/editCategory")

public class AdminEditCategoryServlet extends HttpServlet {
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("id");
        Long id = Long.parseLong(categoryId);


        Category category = categoryDAO.findById(id);
        req.setAttribute("category", category);
        req.setAttribute("categoryId", categoryId);
        req.getRequestDispatcher("category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String editCategory = req.getParameter("category");
        Category category = new Category();
        category.setName(editCategory);

        categoryDAO.update(category);

        resp.sendRedirect("category");
    }

}
