package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.fpt.dal.UserDAO;
import vn.fpt.entity.Role;
import vn.fpt.entity.User;

import java.io.IOException;
import java.util.Set;

@WebServlet(name = "AdminLoginServlet", urlPatterns = "/admin/login")
public class AdminLoginServlet extends HttpServlet {
    private UserDAO userDAO = UserDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("login?error=emptyInput");
            return;
        }

        HttpSession session = request.getSession(false);

        User user = userDAO.findByUsername(username);

        if(user == null) {
            response.sendRedirect("login?success=false");
            return;
        }

        if ("INACTIVE".equals(user.getStatus()) || user.getStatus() == null) {
            response.sendRedirect("login?error=lockedAccount");
            return;
        }

        boolean isUser = false;
        Set<Role> roles = user.getRole();
        if (roles != null) {
            for (Role role : roles) {
                if ("admin".equals(role.getRoleName())) {
                    isUser = true;
                    break;
                }
            }
        }


        if(isUser) {
            session.setAttribute("user", user);

            response.sendRedirect("home");
        }else {
            response.sendRedirect("login?success=false");
        }


    }
}
