
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
<script>
    setTimeout(function(){
        // Tìm tất cả các phần tử có class là 'alert-danger'
        var alertDangerElements = document.querySelectorAll('.alert-danger');
        var alertSuccessElements = document.querySelectorAll('.alert-success');

        // Lặp qua từng phần tử và xóa nó đi
        alertDangerElements.forEach(function(element) {
            element.remove();
        });

        alertSuccessElements.forEach(function(element) {
            element.remove();
        });
    }, 5000); // 5 giây
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var quantityInput = document.getElementById('quantity');
        var plusButton = document.querySelector('.quantity-right-plus');
        var minusButton = document.querySelector('.quantity-left-minus');

        plusButton.addEventListener('click', function() {
            var currentValue = parseInt(quantityInput.value);
            if (!isNaN(currentValue)) {
                quantityInput.value = currentValue + 1;
            }
        });

        minusButton.addEventListener('click', function() {
            var currentValue = parseInt(quantityInput.value);
            if (!isNaN(currentValue) && currentValue > 1) {
                quantityInput.value = currentValue - 1;
            }
        });
    });
</script>
