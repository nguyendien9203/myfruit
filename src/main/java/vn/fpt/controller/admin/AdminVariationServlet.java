package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.constant.Status;
import vn.fpt.dal.VariationDAO;
import vn.fpt.entity.Unit;
import vn.fpt.entity.Variation;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminVariationServlet", urlPatterns = "/admin/variation")
public class AdminVariationServlet extends HttpServlet {
    private VariationDAO variationDAO = VariationDAO.getInstance();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String variationInput = req.getParameter("txt-variation");
        Variation variation = new Variation();
        variation.setName(variationInput);
        variation.setStatus(Status.ACTIVE);
        variationDAO.save(variation);

        resp.sendRedirect("addProduct");
    }
}
