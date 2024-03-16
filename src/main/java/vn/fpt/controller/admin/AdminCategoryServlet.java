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

@WebServlet(name = "AdminCategoryServlet", urlPatterns = "/admin/category")
public class AdminCategoryServlet extends HttpServlet {
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> list = categoryDAO.findAll();
        req.setAttribute("listCate", list);
        req.getRequestDispatcher("category.jsp").forward(req, resp);
    }
}
