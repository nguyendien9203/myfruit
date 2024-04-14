package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.fpt.constant.OrderStatus;
import vn.fpt.dal.OrderDAO;
import vn.fpt.entity.Order;

import java.io.IOException;

@WebServlet(name = "AdminUpdateOrderServlet", urlPatterns = "/admin/updateOrder")
public class AdminUpdateOrderServlet extends HttpServlet {
    private OrderDAO orderDAO = OrderDAO.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        String orderStatus = req.getParameter("orderStatus");

        resp.getWriter().println(orderId);


//        Order order = orderDAO.findById(Long.parseLong(orderId));
//
//
//        if (orderStatus.equals(OrderStatus.PROCESSING) || orderStatus.equals(OrderStatus.CONFIRMED)) {
//            order.setStatus(OrderStatus.CONFIRMED);
//
//            orderDAO.update(order);
//
//            HttpSession session = req.getSession();
//            session.setAttribute("updateMessage", "Đã cập nhật trạng thái đơn hàng #" + orderId + " thành công.");
//        }


        //resp.sendRedirect("order");
    }
}

