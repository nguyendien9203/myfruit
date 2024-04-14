package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.constant.OrderStatus;
import vn.fpt.dal.AddressDAO;
import vn.fpt.dal.OrderDAO;
import vn.fpt.dal.OrderItemDAO;
import vn.fpt.entity.Address;
import vn.fpt.entity.Order;
import vn.fpt.entity.OrderItem;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "AdminOrderServlet", urlPatterns = "/admin/order")
public class AdminOrderServlet extends HttpServlet {
    private OrderDAO orderDAO = OrderDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> orders = orderDAO.findAll();
        req.setAttribute("orders", orders);

        OrderStatus[] orderStatusesArray = OrderStatus.values();
        List<OrderStatus> orderStatusesList = Arrays.asList(orderStatusesArray);
        req.setAttribute("orderStatusesList", orderStatusesList);

        req.getRequestDispatcher("order.jsp").forward(req, resp);
    }
}
