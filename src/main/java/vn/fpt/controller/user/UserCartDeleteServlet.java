package vn.fpt.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.fpt.dal.CategoryDAO;
import vn.fpt.dal.ProductDAO;
import vn.fpt.entity.Category;
import vn.fpt.entity.Order;
import vn.fpt.entity.OrderItem;

import java.io.IOException;
import java.util.List;
import java.util.Set;

@WebServlet(name = "UserCartDeleteServlet", urlPatterns = "/deleteCart")
public class UserCartDeleteServlet extends HttpServlet {
    private ProductDAO productDAO = ProductDAO.getInstance();
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        List<Category> categories = categoryDAO.findAll();
        req.setAttribute("categories", categories);


        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");

        if (order != null) {
            Set<OrderItem> orderItems = order.getOrderItem();

            for (OrderItem orderItem : orderItems) {
                if (orderItem.getProduct().getId() == Long.parseLong(productId)) {
                    orderItems.remove(orderItem);
                    break;
                }
            }
            session.setAttribute("order", order);
        }


        resp.sendRedirect("cart?delete=true");
    }
}
