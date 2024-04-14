package vn.fpt.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.fpt.dal.ProductDAO;
import vn.fpt.entity.Order;
import vn.fpt.entity.OrderItem;
import vn.fpt.entity.Product;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet(name = "UserProductDetailServlet", urlPatterns = "/productDetail")
public class UserProductDetailServlet extends HttpServlet {
    private ProductDAO productDAO = ProductDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        Product product = productDAO.findById(Long.parseLong(productId));
        req.setAttribute("product", product);
        req.getRequestDispatcher("productDetail.jsp").forward(req, resp);
    }


}
