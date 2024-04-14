package vn.fpt.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.CategoryDAO;
import vn.fpt.dal.ProductDAO;
import vn.fpt.entity.Category;
import vn.fpt.entity.Product;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserProductServlet", urlPatterns = "/product")
public class UserProductServlet extends HttpServlet {
    private ProductDAO productDAO = ProductDAO.getInstance();
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("categoryId");
        String keyword = req.getParameter("keyWord"); // Lấy từ khóa tìm kiếm từ request

        List<Product> products = null;
        List<Category> categories = categoryDAO.findAll();

        if (categoryId != null) {
            products = productDAO.getProductsByCategoryId(Long.parseLong(categoryId));
        } else if (keyword != null && !keyword.isEmpty()) { // Nếu có từ khóa tìm kiếm
            products = productDAO.getProductsByKeyword(keyword);
        } else {
            products = productDAO.findAll();
        }

        req.setAttribute("products", products);
        req.setAttribute("categories", categories);
        req.setAttribute("key", keyword);
        req.getRequestDispatcher("product.jsp").forward(req, resp);
    }
}
