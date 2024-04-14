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

import javax.persistence.EntityManager;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "AdminProductEditServlet", urlPatterns = "/admin/editProduct")
public class AdminProductEditServlet extends HttpServlet {

    private CategoryDAO categoryDAO = CategoryDAO.getInstance();
    private ProductDAO productDAO = ProductDAO.getInstance();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Product product = productDAO.findById(Long.parseLong(id));
        req.setAttribute("product", product);

        List<Category> listCate = categoryDAO.findAll();
        req.setAttribute("listCate", listCate);
        req.getRequestDispatcher("editProduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean editSuccess = false;
        List<String> errors = new ArrayList<>();
        String id = req.getParameter("id");
        Product product = productDAO.findById(Long.parseLong(id));


        String name = req.getParameter("name");
        String sku = req.getParameter("sku");
        String brand = req.getParameter("brand");

        if (name == null || name.isEmpty()) {
            errors.add("Tên sản phẩm không được để trống");
        }

        if (sku == null || sku.isEmpty()) {
            errors.add("SKU không được để trống");
        }

        if (brand == null || brand.isEmpty()) {
            errors.add("Thương hiệu không được để trống");
        }

        String qtyInStockStr = req.getParameter("qtyInStock");
        Long qtyInStock = -1L;
        if (qtyInStockStr == null || qtyInStockStr.isEmpty()) {
            errors.add("Số lượng không được để trống");
        } else {
            try {
                qtyInStock = Long.parseLong(qtyInStockStr);
                if (qtyInStock == null || qtyInStock <= 0) {
                    errors.add("Số lượng phải lớn hơn 0");
                }
            } catch (NumberFormatException e) {
                errors.add("Số lượng phải là một số nguyên dương");
            }
        }

        ProductStatus status;

        if (qtyInStock <= 0) {
            status = ProductStatus.OUT_OF_STOCK;
        } else {
            status = ProductStatus.IN_STOCK;
        }

        String desc = req.getParameter("desc");
        if (desc == null || desc.isEmpty()) {
            errors.add("Mô tả không được để trống");
        }


        String priceStr = req.getParameter("price");
        BigDecimal price = BigDecimal.ZERO;
        if (priceStr == null || priceStr.isEmpty()) {
            errors.add("Giá không được để trống");
        } else {
            try {
                price = new BigDecimal(priceStr);
                if (price.compareTo(BigDecimal.ZERO) <= 0) {
                    errors.add("Giá phải lớn hơn 0");
                }
            } catch (NumberFormatException e) {
                errors.add("Giá phải là một số");
            }
        }

        String discountStr = req.getParameter("discount");
        BigDecimal discount = BigDecimal.ZERO;
        if (discountStr != null && !discountStr.isEmpty()) {
            try {
                discount = new BigDecimal(discountStr);
                if (discount.compareTo(BigDecimal.ZERO) < 0) {
                    errors.add("Giảm giá không được nhỏ hơn 0");
                }
            } catch (NumberFormatException e) {
                errors.add("Giảm giá phải là một số");
            }
        }

        String categoryId = req.getParameter("category");
        if (categoryId == null || categoryId.isEmpty()) {
            errors.add("Danh mục không được để trống");
        } else {
            try {
                Long categoryIdLong = Long.parseLong(categoryId);
                Category category = categoryDAO.findById(categoryIdLong);
                if (category == null) {
                    errors.add("Danh mục không tồn tại");
                } else {
                    EntityManager entityManager = categoryDAO.entityManager();
                    category = entityManager.merge(category);
                    Set<Category> categories = new HashSet<>();
                    categories.add(category);
                    product.setCategory(categories);
                }
            } catch (NumberFormatException e) {
                errors.add("Danh mục không hợp lệ");
            }
        }


        product.setName(name);
        product.setSKU(sku);
        product.setBrand(brand);
        product.setQtyInStock(qtyInStock);
        product.setStatus(status);

        product.setDesc(desc);

        product.setPrice(price);
        product.setDiscount(discount);



        Part part = req.getPart("image");
        String fileName = "";
        if (part != null && part.getSize() > 0) {
            fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            long fileSize = part.getSize();

            // Kiểm tra kiểu tệp
            if (!fileExtension.equals("jpg") && !fileExtension.equals("jpeg") && !fileExtension.equals("png") && !fileExtension.equals("webp")) {
                errors.add("Chỉ chấp nhận các tệp hình ảnh có định dạng JPG, JPEG, PNG hoặc WEBP.");
            }

            // Kiểm tra kích thước tệp
            long maxSize = 1024 * 1024 * 10; // 10MB
            if (fileSize > maxSize) {
                errors.add("Kích thước tệp hình ảnh quá lớn. Vui lòng chọn một tệp nhỏ hơn 10MB.");
            }
            String absolutePath = getServletContext().getRealPath("/images/uploads");
            Path uploadsPath = Paths.get(absolutePath);
            if (!Files.exists(uploadsPath)) {
                Files.createDirectories(uploadsPath);
            }
            part.write(absolutePath + "/" + fileName);
        } else {
            errors.add("Hình ảnh không được để trống");
        }
        product.setImage(fileName);

        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            doGet(req, resp);
            return;
        }

        //resp.getWriter().println("Product" + product.toString());

        productDAO.update(product);
        editSuccess = true;

        if(editSuccess) {
            resp.sendRedirect("product?edit=true");
        }else {
            resp.sendRedirect("product?edit=false");
        }


    }
}
