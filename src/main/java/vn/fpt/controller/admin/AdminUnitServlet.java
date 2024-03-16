package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.dal.UnitDAO;
import vn.fpt.entity.Unit;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminUnitServlet", urlPatterns = "/admin/unit")
public class AdminUnitServlet extends HttpServlet {
    private UnitDAO unitDAO = UnitDAO.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String unitInput = req.getParameter("txt-unit");
        Unit unit = new Unit();
        unit.setName(unitInput);
        unitDAO.save(unit);

        resp.sendRedirect("addProduct");
    }
}
