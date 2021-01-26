
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	</div>
        <!-- /#page-wrapper -->
     
       	 <form class="form" method="post" action="/mypage/myinfo">
          	<input type="hidden" class="userid" name="userid" value="<sec:authentication property="principal.username"/>">
          	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>	<!-- csrf토큰 -->
        </form>
        
    </div>
    <!-- /#wrapper -->

<!-- 너 AJAX 가 아래 jquery 에서 사용하는건데 얘가 없는데 지금 먼저 불러서그럼 -->
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
        $(".sidebar-nav")
        .attr("class","sidebar-nav navbar-collapse collapse")
        .attr("aria-expanded",'false')
        .attr("style","height:1px");
    });
    </script>

</body>

</html>

