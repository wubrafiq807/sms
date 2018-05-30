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
<title>Dashboard - Synergy Inc.</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">

<link href="resource/w2ui/w2ui-1.5.rc1.min.css" rel="stylesheet">
<link href="resource/w2ui/w2ui-1.5.rc1.css" rel="stylesheet">
<script src="resource/w2ui/w2ui-1.5.rc1.min.js"></script> 
<script src="resource/w2ui/w2ui-1.5.rc1.js"></script> 

<link href="resource/dataTable/buttons.dataTables.min.css" rel="stylesheet">
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
td img{
    display: block;
    margin-left: auto;
    margin-right: auto;

}
.centered{width: 50px; margin: 0px, auto, 0px, auto;}

</style>



<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
	
	$(document).ready(function() {
	    $('#table1').DataTable( {
	        dom: 'Bfrtip',
	        buttons: [
	            'copy', 'csv', 'excel', 'print', {
	                extend: 'pdfHtml5',
	                orientation: 'landscape',
	                pageSize: 'LEGAL'
	            }
	        ]
	    } );
	    
	} );
	
	
	
</script>

</head>

<body>
	
	<input type="hidden" value="${pageContext.request.contextPath}" id="contextPath">
	
	<div class="page-head">
		<h2 class="pull-left" style="color:#428bca;">Requisition History</h2>
			<div class="clearfix"></div>
	</div>

	<!--   <div class="matter"> -->
	<div class="container">

		<div class="row">

			<div class="col-md-12">

				<!-- Table -->

				<div class="row">

					<div class="col-md-12">

						<div class="widget">

							<div class="widget-head">
								<div class="pull-left">Requisition History</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>

							<div class="widget-content">

								<div class="table-responsive">

									<c:if test="${!empty requisitionHistory}">
											<table class="table table-bordered table-hover"
												 id="table1">
											<thead>
												<tr style="background-color: #428bca; color: white">
													<th class="text-center">Sl. No.</th>
													<th class="text-center">Requisition No</th>
													<th class="text-center">Employee Name</th>
													<th class="text-center">Department</th>
													<th class="text-center">Purpose</th>
													<th class="text-center">Departure Date</th>
													<th class="text-center">Return Date</th>
													<th class="text-center">Destination</th>
													<th class="text-center">Status</th>
													<th class="text-center">Created Date</th>
													<th class="text-center">Created By</th>
													<th class="text-center">Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${requisitionHistory}" var="travelRequisition" varStatus="tr">
													<tr>
														<td class="text-center">${tr.count}</td>
														<td class="text-center">${travelRequisition.reqUniqueNumber}</td>
														<td class="text-center">${travelRequisition.empName}</td>
														<td class="text-center">${travelRequisition.deptName}</td>
														<td class="text-center">${travelRequisition.tripPurpose}</td>
														<td class="text-center">${travelRequisition.departureDate}</td>
														<td class="text-center">${travelRequisition.returnDate}</td>
														<td class="text-center">${travelRequisition.destination}</td>
														<td class="text-center">
														
														<c:if test="${travelRequisition.status eq 1}">
															<span class="btn btn-primary">Ready for Submit</span>
														</c:if>
														<c:if test="${travelRequisition.status eq 2}">
															<span class="btn btn-info"> Pending for Manager Approval</span>
														</c:if>
														<c:if test="${travelRequisition.status eq 3}">
															<span class="btn btn-info">Pending for Second Line Manager Approval</span>
														</c:if>
														<c:if test="${travelRequisition.status eq 4}">
															<span class="btn btn-success"> Approved</span>
														</c:if>	
														<c:if test="${travelRequisition.status eq 5}">
															<span class="btn btn-danger"> Rejected</span>
														</c:if>	
														
														<c:if test="${travelRequisition.status eq 6}">
															<span class="btn btn-warning"> Deleted</span>
														</c:if>	
														</td>														
														<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${travelRequisition.createdDate}" /></td>
														<td class="text-center">${travelRequisition.createdBy}</td>
														<td class="center">
																<a target="_blank" href="${pageContext.request.contextPath}/downloadRequisition?id=${travelRequisition.id}" title="Download Report"><span><i class="fa fa-download" style="font-size:20px;color:red"></i></span>&nbsp;Report</a>
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




</body>
</html>