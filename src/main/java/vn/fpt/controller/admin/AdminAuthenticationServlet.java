package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.RoleDAO;
import vn.fpt.dal.UserDAO;
import vn.fpt.entity.Role;
import vn.fpt.entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminAuthenticationServlet", urlPatterns = "/admin/authentication")
public class AdminAuthenticationServlet extends HttpServlet {

    private UserDAO userDAO = UserDAO.getInstance();
    private RoleDAO roleDAO = RoleDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userDAO.findAll();
        List<Role> roles = roleDAO.findAll();
        request.setAttribute("listUsers", users);
        request.setAttribute("listRoles", roles);
        request.getRequestDispatcher("authentication.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
