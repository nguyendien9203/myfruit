package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.CategoryDAO;
import vn.fpt.entity.Category;
import vn.fpt.entity.Product;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@WebServlet(name = "AdminCategoryDeleteServlet", urlPatterns = "/admin/deleteCategory")
public class AdminCategoryDeleteServlet extends HttpServlet {
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean deleteSuccess = false;
        String categoryId = req.getParameter("id");

        Category category = categoryDAO.findById(Long.parseLong(categoryId));

        Set<Product> products = new HashSet<>();

        category.setProduct(null);
        categoryDAO.update(category);

        categoryDAO.delete(category);
        deleteSuccess = true;

        if(deleteSuccess) {
            resp.sendRedirect("category?delete=true");
        }else {
            resp.sendRedirect("category?delete=false");
        }


    }
}
