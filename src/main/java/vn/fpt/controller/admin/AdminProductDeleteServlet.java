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
import vn.fpt.util.JPAUtil;

import javax.persistence.EntityManager;
import java.io.IOException;
import java.util.Set;

@WebServlet(name = "AdminProductDeleteServlet", urlPatterns = "/admin/deleteProduct")
public class AdminProductDeleteServlet extends HttpServlet {
    private ProductDAO productDAO = ProductDAO.getInstance();
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean deleteSuccess = false;
        String id = req.getParameter("id");

        Product product = productDAO.findById(Long.parseLong(id));
        productDAO.delete(product);
        deleteSuccess = true;


        if(deleteSuccess) {
            resp.sendRedirect("product?delete=true");
        }else {
            resp.sendRedirect("product?delete=false");
        }

    }
}
