package vn.fpt.controller.admin;

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

@WebServlet(name = "AdminProductServlet", urlPatterns = "/admin/product")
public class AdminProductServlet extends HttpServlet {
    private ProductDAO productDAO = ProductDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> listProduct = productDAO.findAll();

        req.setAttribute("listProduct", listProduct);
        req.getRequestDispatcher("product.jsp").forward(req, resp);
    }
}
