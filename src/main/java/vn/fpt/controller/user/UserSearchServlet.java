package vn.fpt.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.ProductDAO;
import vn.fpt.entity.Product;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserSearchServlet", urlPatterns = "/search")
public class UserSearchServlet extends HttpServlet {
    private ProductDAO productDAO = ProductDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyWord = req.getParameter("keyWord");
        List<Product> productList = productDAO.getProductsByKeyword(keyWord);
        req.setAttribute("products", productList);
        req.getRequestDispatcher("product.jsp").forward(req, resp);
    }
}
