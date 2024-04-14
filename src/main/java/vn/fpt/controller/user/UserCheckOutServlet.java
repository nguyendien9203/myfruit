package vn.fpt.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.fpt.constant.OrderStatus;
import vn.fpt.dal.CategoryDAO;
import vn.fpt.dal.OrderDAO;
import vn.fpt.dal.OrderItemDAO;
import vn.fpt.dal.ProductDAO;
import vn.fpt.entity.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

@WebServlet(name = "UserCheckOutServlet", urlPatterns = "/checkout")
public class UserCheckOutServlet extends HttpServlet {
    private ProductDAO productDAO = ProductDAO.getInstance();
    private OrderDAO orderDAO = OrderDAO.getInstance();
    private OrderItemDAO orderItemDAO = OrderItemDAO.getInstance();

    private CategoryDAO categoryDAO = CategoryDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");

        session.setAttribute("order", order);

        List<Category> categories = categoryDAO.findAll();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("checkout.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");

        if (order == null || order.getOrderItem().isEmpty()) {
            resp.sendRedirect("cart");
            return;
        }

        String fullName = req.getParameter("fullName");
        String addressStr = req.getParameter("address");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String note = req.getParameter("note");

        List<String> errors = new ArrayList<>();

        // Kiểm tra từng trường và thêm thông báo lỗi vào danh sách nếu cần
        if (fullName == null || fullName.isEmpty()) {
            errors.add("Vui lòng nhập họ và tên.");
        }
        if (addressStr == null || addressStr.isEmpty()) {
            errors.add("Vui lòng nhập địa chỉ.");
        }
        if (email == null || email.isEmpty()) {
            errors.add("Vui lòng nhập địa chỉ email.");
        }
        if (phone == null || phone.isEmpty()) {
            errors.add("Vui lòng nhập số điện thoại.");
        }

        String paymentMethod = req.getParameter("paymentMethod");
        if (paymentMethod == null || (!paymentMethod.equals("cod") && !paymentMethod.equals("banking"))) {
            errors.add("Vui lòng chọn phương thức thanh toán.");
        }

        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("checkout.jsp").forward(req, resp);
            return;
        }


        String orderTotalStr = req.getParameter("orderTotal");
        BigDecimal orderTotal = new BigDecimal(orderTotalStr);




        User user = (User) session.getAttribute("user");


        OrderStatus status = OrderStatus.PROCESSING;

        Address address = new Address();
        address.setFullName(fullName);
        address.setAddress(addressStr);
        address.setEmail(email);
        address.setPhone(phone);
        address.setNote_address(note);

        Order orderEntity = new Order();
        orderEntity.setOrderDate(new Date());
        orderEntity.setOrderTotal(orderTotal);
        orderEntity.setPaymentMethod(paymentMethod);
        orderEntity.setStatus(status);
        orderEntity.setAddress(address);
        orderEntity.setUser(user);
        orderDAO.insert(orderEntity);

        for (OrderItem orderItem : order.getOrderItem()) {
            OrderItem orderItemEnity = new OrderItem();
            orderItemEnity.setQty(orderItem.getQty());
            orderItemEnity.setPrice(orderItem.getPrice());
            orderItemEnity.setProduct(orderItem.getProduct());
            orderItemEnity.setOrders(orderEntity);
            orderItemDAO.insert(orderItemEnity);

            Product product = orderItem.getProduct();
            Long currentQtyInStock = product.getQtyInStock();
            Long orderedQty = orderItem.getQty();
            Long updatedQtyInStock = currentQtyInStock - orderedQty;
            product.setQtyInStock(updatedQtyInStock);

            productDAO.update(product);
        }

        session.removeAttribute("order");

        resp.sendRedirect("cart?order=true");




    }
}


