<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright &copy; SAAN 2019</span>
        </div>
    </div>
</footer>

<!-- End of Footer -->

</div>

<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>


<!-- Bootstrap core JavaScript-->
<script src="dashboard/vendor/jquery/jquery.min.js"></script>
<script src="dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="dashboard/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="dashboard/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="dashboard/js/demo/chart-area-demo.js"></script>
<script src="dashboard/js/demo/chart-pie-demo.js"></script>

<c:if test="${not empty imprimir}">
    <script>alert("${imprimir}");</script>
</c:if>

</body>

</html>
