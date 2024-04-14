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
import vn.fpt.entity.Product;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet(name = "UserCartServlet", urlPatterns = "/cart")
public class UserCartServlet extends HttpServlet {
    private ProductDAO productDAO = ProductDAO.getInstance();

    private CategoryDAO categoryDAO = CategoryDAO.getInstance();

    Order order = new Order();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");

        session.setAttribute("order", order);

        List<Category> categories = categoryDAO.findAll();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String qty = req.getParameter("qty");

        Product product = productDAO.findById(Long.parseLong(productId));

        HttpSession session = req.getSession();

        if(session.getAttribute("order") == null) {
            Order order = new Order();
            Set<OrderItem> orderItems = new HashSet<>();
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(product);
            orderItem.setQty(Long.parseLong(qty));
            if(product.getDiscount().compareTo(BigDecimal.ZERO) > 0) {
                orderItem.setPrice(product.getDiscount());
            } else {
                orderItem.setPrice(product.getPrice());
            }
            orderItems.add(orderItem);
            order.setOrderItem(orderItems);
            session.setAttribute("order", order);
        } else {
            Order order = (Order) session.getAttribute("order");
            Set<OrderItem> orderItems = order.getOrderItem();
            boolean check = false;
            for(OrderItem existingOrderItem : orderItems) {
                if(existingOrderItem.getProduct().getId() == product.getId()) {
                    existingOrderItem.setQty(existingOrderItem.getQty() + Long.parseLong(qty));
                    check = true;
                }
            }
            if(!check) {
                OrderItem orderItem = new OrderItem();
                orderItem.setProduct(product);
                orderItem.setQty(Long.parseLong(qty));
                if(product.getDiscount().compareTo(BigDecimal.ZERO) > 0) {
                    orderItem.setPrice(product.getDiscount());
                } else {
                    orderItem.setPrice(product.getPrice());
                }
                orderItems.add(orderItem);
            }
            session.setAttribute("order", order);
        }
        resp.sendRedirect("cart?add=true");
    }

}
