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

import java.io.IOException;

@WebServlet(name = "UserUpdateCartServlet", urlPatterns = "/updateCart")
public class UserCartUpdateServlet extends HttpServlet {
    private ProductDAO productDAO = ProductDAO.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        String quantity = req.getParameter("quantity");

        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");

        if (order != null) {
            for (OrderItem orderItem : order.getOrderItem()) {
                if (orderItem.getProduct().getId() == (Long.parseLong(productId))) {
                    orderItem.setQty(Long.parseLong(quantity));
                    break;
                }
            }
            session.setAttribute("order", order);
        }

        // Sau khi cập nhật xong, chuyển hướng trở lại trang giỏ hàng
        resp.sendRedirect("cart?update=true");
    }
}

