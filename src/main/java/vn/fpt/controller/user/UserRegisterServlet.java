package vn.fpt.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.constant.Status;
import vn.fpt.dal.CategoryDAO;
import vn.fpt.dal.RoleDAO;
import vn.fpt.dal.UserDAO;
import vn.fpt.entity.Category;
import vn.fpt.entity.Role;
import vn.fpt.entity.User;
import vn.fpt.util.MD5Util;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet(name = "UserRegisterServlet", urlPatterns = {"/register"})
public class UserRegisterServlet extends HttpServlet {
    private UserDAO userDAO = UserDAO.getInstance();
    private RoleDAO roleDAO = RoleDAO.getInstance();

    private CategoryDAO categoryDAO = CategoryDAO.getInstance();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryDAO.findAll();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");

        if (fullName == null || fullName.isEmpty() || username == null || username.isEmpty() ||
                password == null || password.isEmpty() || rePassword == null || rePassword.isEmpty()) {
            response.sendRedirect("register.jsp?error=emptyInput");
            return;
        }

        if(!password.equals(rePassword)) {
            response.sendRedirect("register.jsp?error=passwordMismatch");
            return;
        }


        String hashedPassword = MD5Util.hashPasswordMD5(password);

        User user = new User();
        user.setFullName(fullName);
        user.setUsername(username);
        user.setPassword(hashedPassword);
        user.setStatus(Status.ACTIVE);
        userDAO.insert(user);
        Role userRole = roleDAO.findByRoleName("user");


        Set<Role> roles = user.getRole();


        if (roles == null) {
            roles = new HashSet<>();
            user.setRole(roles);
        }


        roles.add(userRole);


        userDAO.update(user);

        response.sendRedirect("login?success=true");

    }


}
