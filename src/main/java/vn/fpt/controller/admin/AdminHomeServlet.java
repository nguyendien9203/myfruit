package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.OrderDAO;
import vn.fpt.entity.Order;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name = "AdminHomeServlet", urlPatterns = "/admin/home")
public class AdminHomeServlet extends HttpServlet {
    private OrderDAO orderDAO = OrderDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BigDecimal totalRevenueInMonth = orderDAO.getTotalRevenueThisMonth();

        // Lấy doanh thu hôm nay
        BigDecimal totalRevenueToday = orderDAO.getTotalRevenueToday();

        // Lấy số đơn hàng hôm nay
        Long ordersCountToday = orderDAO.getTotalOrdersToday();

        List<Order> orders = orderDAO.getLatestOrders();

        // Đặt các giá trị vào request để truyền tới JSP
        request.setAttribute("totalRevenueInMonth", totalRevenueInMonth);
        request.setAttribute("totalRevenueToday", totalRevenueToday);
        request.setAttribute("ordersCountToday", ordersCountToday);
        request.setAttribute("orders", orders);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
