package vn.fpt.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.CategoryDAO;
import vn.fpt.entity.Category;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserAboutServlet", urlPatterns = "/about")
public class UserAboutServlet extends HttpServlet {
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryDAO.findAll();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("about.jsp").forward(req, resp);
    }
}
