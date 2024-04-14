package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.CategoryDAO;
import vn.fpt.entity.Category;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminCategoryAddServlet", urlPatterns = "/admin/addCategory")
public class AdminCategoryAddServlet extends HttpServlet {
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();
    List<String> errors = new ArrayList<>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> list = categoryDAO.findAll();
        req.setAttribute("listCate", list);
        req.setAttribute("errors", errors);
        req.getRequestDispatcher("category.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        boolean addSuccess = false;

        String categoryInput = req.getParameter("txt-category");

        if(categoryInput.isEmpty() || categoryInput == null) {
            errors.add("Danh mục không được để trống");
        }

        Category existCategory = categoryDAO.getCategoryByName(categoryInput);

        if(existCategory != null && existCategory.getName().equalsIgnoreCase(categoryInput)) {
            errors.add("Danh mục đã tồn tại");
        }

        if (!errors.isEmpty()) {
            doGet(req, resp);
            return;
        }

        Category category = new Category();
        category.setName(categoryInput);
        categoryDAO.insert(category);
        addSuccess = true;

        if(addSuccess) {
            resp.sendRedirect("category?add=true");
        }else {
            resp.sendRedirect("category?add=false");
        }

    }
}
