document.addEventListener("DOMContentLoaded", function() {
    feather.replace(); // Khởi tạo Feather icons

    // Thêm form-row khi nhấp vào nút "Thêm Lựa Chọn Khác"
    document.getElementById("add-form-row").addEventListener("click", function() {
        var formContainer = document.getElementById("form-container");
        var clone = formContainer.querySelector("[data-repeater-item]").cloneNode(true);
        formContainer.appendChild(clone);
        feather.replace(); // Khởi tạo lại Feather icons cho các button mới
    });

    // Xóa form-row khi nhấp vào nút close
    document.addEventListener("click", function(e) {
        if (e.target && e.target.classList.contains("remove-button")) {
            var parentFormRow = e.target.closest(".form-row");
            parentFormRow.remove();
        }
    });
});