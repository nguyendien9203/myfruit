package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.OrderDAO;
import vn.fpt.entity.Order;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminViewOrderServlet", urlPatterns = "/admin/viewOrder")
public class AdminViewOrderServlet extends HttpServlet {
    private OrderDAO orderDAO = OrderDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        Order order = orderDAO.findById(Long.parseLong(orderId));
        req.setAttribute("order", order);
        req.getRequestDispatcher("viewOrder.jsp").forward(req, resp);
    }
}
