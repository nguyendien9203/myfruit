package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.CategoryDAO;
import vn.fpt.entity.Category;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminAddCategoryServlet", urlPatterns = "/admin/addCategory")
public class AdminAddCategoryServlet extends HttpServlet {
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryInput = req.getParameter("txt-category");
        Category category = new Category();
        category.setName(categoryInput);
        categoryDAO.save(category);

        resp.sendRedirect("category");
    }
}
