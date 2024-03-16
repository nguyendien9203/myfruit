package vn.fpt.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.fpt.constant.ProductStatus;
import vn.fpt.dal.*;
import vn.fpt.entity.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "AdminAddProductServlet", urlPatterns = "/admin/addProduct")
public class AdminAddProductServlet extends HttpServlet {
    private UnitDAO unitDAO = UnitDAO.getInstance();

    private ProductDAO productDAO = ProductDAO.getInstance();
    private VariationOptionDAO variationOptionDAO = VariationOptionDAO.getInstance();

    private VariationDAO variationDAO = VariationDAO.getInstance();
    private CategoryDAO categoryDAO = CategoryDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Unit> listUnit = unitDAO.findAll();
        req.setAttribute("listUnit", listUnit);

        List<Variation> listVariation = variationDAO.findAll();
        req.setAttribute("listVariation", listVariation);

        List<Category> listCate = categoryDAO.findAll();
        req.setAttribute("listCate", listCate);
        req.getRequestDispatcher("addProduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String sku = req.getParameter("sku");
        String brand = req.getParameter("brand");
        String qtyInStockStr = req.getParameter("qtyInStock");
        BigDecimal qtyInStock = new BigDecimal(qtyInStockStr);
        String priceStr = req.getParameter("price");
        BigDecimal price = new BigDecimal(priceStr);
        String discountStr = req.getParameter("discount");
        BigDecimal discount = new BigDecimal(discountStr);
        String desc = req.getParameter("desc");


        Part part = req.getPart("image");
        String realPath = req.getServletContext().getRealPath("/uploads");
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if(!Files.exists(Paths.get(realPath))) {
            Files.createDirectory(Paths.get(realPath));
        }

        part.write(realPath + "/" + fileName);

        ProductStatus status = (qtyInStock.compareTo(BigDecimal.ZERO) <= 0) ? ProductStatus.OUT_OF_STOCK : ProductStatus.IN_STOCK;

        Product product = new Product();
        product.setName(name);
        product.setSKU(sku);
        product.setStatus(status);
        product.setBrand(brand);
        product.setQtyInStock(qtyInStock);
        product.setDesc(desc);
        product.setImage(fileName);
        product.setPrice(price);
        product.setDiscount(discount);

        String unitId = req.getParameter("unit");
        if(unitId != null) {
            Unit unit = unitDAO.findById(Long.parseLong(unitId));
            if(unit != null) {
                Set<Unit> unitSet = new HashSet<>();
                unitSet.add(unit);
                product.setUnits(unitSet);
            }
        }

        String categoryId = req.getParameter("category");
        if (categoryId != null) {
            Category category = categoryDAO.findById(Long.parseLong(categoryId));
            if (category != null) {
                Set<Category> categorySet = new HashSet<>();
                categorySet.add(category);
                product.setCategories(categorySet);

                Variation var = new Variation();
                var.setCategory(category);
                variationDAO.update(var);
            }
        }

        String[] variationIds = req.getParameterValues("variation");
        if(variationIds != null) {
            for (String variationId : variationIds) {
                Variation variation = variationDAO.findById(Long.parseLong(variationId));
                if (variation != null) {
                    VariationOption variationOption = new VariationOption();
                    variationOption.setVariation(variation);
                    variationOptionDAO.update(variationOption);
                }
            }
        }

        String[] variationOptionIds = req.getParameterValues("variation_option");
        Set<VariationOption> variationOptionSet = new HashSet<>();
        if (variationOptionIds != null) {
            for (String variationOptionId : variationOptionIds) {
                VariationOption variationOption = variationOptionDAO.findById(Long.parseLong(variationOptionId));
                if (variationOption != null) {
                    variationOptionSet.add(variationOption);
                }
            }
        }
        product.setVariationOptions(variationOptionSet);

        productDAO.update(product);




    }
}
