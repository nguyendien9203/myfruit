package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.CategoryDAO;
import vn.fpt.entity.Category;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AdminCategoryEditServlet", urlPatterns = "/admin/editCategory")

public class AdminCategoryEditServlet extends HttpServlet {
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String categoryId = req.getParameter("id");

        Category category = categoryDAO.findById(Long.parseLong(categoryId));
        req.setAttribute("category", category);
        req.getRequestDispatcher("editCategory.jsp").forward(req, resp);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean editSuccess = false;
        String categoryId = req.getParameter("categoryId");


        String errorEmpty = null;
        String errorExist = null;

        String categoryName = req.getParameter("categoryName");
        if(categoryName == null || categoryName.isEmpty()) {
            errorEmpty = "Danh mục không được để trống";
        }

        Category existCategory = categoryDAO.getCategoryByName(categoryName);

        if(existCategory != null && existCategory.getName().equalsIgnoreCase(categoryName)) {
            errorExist = "Danh mục đã tồn tại";
        }

        if (errorEmpty != null || errorExist != null) {
            req.setAttribute("errorEmpty", errorEmpty);
            req.setAttribute("errorExist", errorExist);
            doGet(req, resp);
            return;
        }

        Category category = categoryDAO.findById(Long.parseLong(categoryId));
        category.setName(categoryName);
        categoryDAO.update(category);
        editSuccess = true;

        if(editSuccess) {
            resp.sendRedirect("category?edit=true");
        }else {
            resp.sendRedirect("category?edit=false");
        }

    }

}
