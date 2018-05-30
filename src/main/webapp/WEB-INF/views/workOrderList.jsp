<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- Title and other stuffs -->
<title>Work Order List -Synergy Inc</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">

<link href="resource/w2ui/w2ui-1.5.rc1.min.css" rel="stylesheet">
<link href="resource/w2ui/w2ui-1.5.rc1.css" rel="stylesheet">
<script src="resource/w2ui/w2ui-1.5.rc1.min.js"></script>
<script src="resource/w2ui/w2ui-1.5.rc1.js"></script>

<link href="resource/dataTable/buttons.dataTables.min.css"
	rel="stylesheet">
<script src="resource/dataTable/jquery-1.12.3.js"></script>
<script src="resource/dataTable/jquery.dataTables.min.js"></script>
<script src="resource/dataTable/dataTables.buttons.min.js"></script>
<script src="resource/dataTable/buttons.flash.min.js"></script>
<script src="resource/dataTable/jszip.min.js"></script>
<script src="resource/dataTable/pdfmake.min.js"></script>
<script src="resource/dataTable/vfs_fonts.js"></script>
<script src="resource/dataTable/buttons.html5.min.js"></script>
<script src="resource/dataTable/buttons.print.min.js"></script>




<style type="text/css">
td img {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.centered {
	width: 50px;
	margin: 0px, auto, 0px, auto;
}
</style>



<script type="text/javascript">
	function goBack() {
		window.history.back();
	}

	$(document).ready(function() {
		$('#table1').DataTable({
			dom : 'Bfrtip',
			buttons : [ 'copy', 'csv', 'excel', 'print', {
				extend : 'pdfHtml5',
				orientation : 'landscape',
				pageSize : 'LEGAL',
				
			} ]
		});

	});
</script>

</head>

<body>

	<input type="hidden" value="${pageContext.request.contextPath}"
		id="contextPath">

	<div class="page-head">
		<h2 class="pull-left" style="color: #428bca;">Work Order List</h2>
		<div class="clearfix"></div>
	</div>

	<!--   <div class="matter"> -->
	<div class="container">
		<c:if test="${!empty success}">

			<div class="row">
				<div class="col-md-12">
					<div class="alert alert-success">
						<strong>Success!</strong> ${success}

					</div>
				</div>
			</div>

		</c:if>
		<div class="row">

			<div class="col-md-12">

				<!-- Table -->

				<div class="row">

					<div class="col-md-12">

						<div class="widget">

							<div class="widget-head">
								<div class="pull-left">Work Order List</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>

							<div class="widget-content">

								<div class="table-responsive">

									<c:if test="${!empty WorkOrderList}">
										<table class="table table-striped" id="table1">
											<thead>
												<tr style="background-color: #428bca; color: white">
													<th class="text-center">Sl NO.</th>
													<th class="text-center">Work Order No.</th>
													<th class="text-center">Work Order Date</th>
													<th class="text-center">Vendor Name</th>
													<th class="text-center">Vendor's Quotation No</th>
													<th class="text-center">Vendos's Quotation Date *:</th>
													<th class="text-center">Created Date</th>
													<th class="text-center">Created By</th>
													<th class="text-center">image</th>
													<th class="text-center">Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${WorkOrderList}" var="workOrder"
													varStatus="tr">
													<tr class="row_no_${tr.count}">
													
														<td class="text-center">${tr.count}</td>
														<td class="text-center">${workOrder.workOrderNo}</td>
														<td class="text-center">${workOrder.workOrderDate}</td>
														<td class="text-center">${workOrder.vendorName}</td>
														<td class="text-center">${workOrder.vendorQuotationNo}</td>
														<td class="text-center">${workOrder.vendorQuotationDate}</td>
														<td class="text-center">${workOrder.createdDate}</td>
														<td class="text-center">${workOrder.createdBy}</td>
														<td class="text-center"><img src="https://www.biphoo.com/product-images/movie-image/4Avatar%202%20-5.jpeg" alt="Smiley face" width="42" height="42"></td>
														<td class="text-center"><a
															href="editWorkOrder/${workOrder.id}"><i
																class="fa fa-pencil-square-o" aria-hidden="true"
																title="Edit"></i></a> <a
															href="${pageContext.request.contextPath}/deleteWorkOrder/${workOrder.id}" onclick="return archiveFunction('${pageContext.request.contextPath}/deleteWorkOrder/${workOrder.id}')"><i
																class="fa fa-trash-o" aria-hidden="true" title="Delete"></i></a>
																
																<a href="${pageContext.request.contextPath}/getDtlInfo/${workOrder.id}" target="_blank"
															 class="btn btn-primary" ><i
																class="fa fa-info" aria-hidden="true" title="Work Order Details"></i></a>
																<a href="${pageContext.request.contextPath}/downloadReports/${workOrder.id}" ><i
																class="fa fa-print" aria-hidden="true" title="Print Report"></i></a>
														</td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</c:if>
								</div>


							</div>
						</div>





					</div>

				</div>

			</div>

		</div>

	</div>




	<!-- table ends -->













	<!-- Matter ends -->



	<!-- Mainbar ends -->
	<div class="clearfix"></div>
<script src="${pageContext.request.contextPath}/resource/js/sweetalert.min.js"></script>

<script type="text/javascript">
function archiveFunction(url) {
	event.preventDefault(); // prevent form submit
	swal({
		  title: "Are you sure?",
		  text: "Once deleted, you will not be able to recover this imaginary Property!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		  
		    window.location.href = url;
		  } else {
		    swal("Your imaginary Property is safe!");
		  }
		});
	}
function getDTLInfo(i,row) {
	$
	.ajax({
		type : "post",
		url : '${pageContext.request.contextPath}/ajaxGetDtlInfo',
		dataType : 'json',
		data : {
			mst_id : i
		},
		success : function(response) {
			
		},
		error : function() {
		}

	});
	
}
</script>

</body>
</html>