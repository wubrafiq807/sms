<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- Title and other stuffs -->
<title>Dashboard - Synergy Inc</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">

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

<link href="resource/tabs/jquery-ui.css" rel="stylesheet">
<script src="resource/tabs/jquery-ui.js"></script>
<script src="resource/pdf/jspdf.min.js"></script>

<link
	href="${pageContext.request.contextPath}/resource/w2ui/w2ui-1.5.rc1.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/w2ui/w2ui-1.5.rc1.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resource/w2ui/w2ui-1.5.rc1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/w2ui/w2ui-1.5.rc1.js"></script>


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
	
	$( function() {
	    $( "#tabs" ).tabs();
	});
	
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
	    
	    $('#table2').DataTable( {
	        dom: 'Bfrtip',
	        buttons: [
	            'copy', 'csv', 'excel', 'print', {
	                extend: 'pdfHtml5',
	                orientation: 'landscape',
	                pageSize: 'LEGAL'
	            }
	        ]
	    } );
	    
	    $('#table3').DataTable( {
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
	
	function doSubmit(id){
		var contextPath = $('#contextPath').val();
		var url = contextPath + '/submitRequisition?id='+id;
		w2confirm('Are you sure submit this to manager?', function btn(answer) {
		    if(answer == 'Yes'){	
		    	$('#btn-submit'+id).hide();
		    	$('#btn-delete'+id).hide();
		    	window.location = url;
		    }
		});	
		return false;
	}
	
	function doDelete(id){
		var contextPath = $('#contextPath').val();
		var url = contextPath + '/deleteRequisition?id='+id;
		w2confirm('Are you sure delete this to manager?', function btn(answer) {
		    if(answer == 'Yes'){	
		    	$('#btn-submit'+id).hide();
		    	$('#btn-delete'+id).hide();
		    	window.location = url;
		    }
		});	
		return false;
	}
	
	function doApprove(id){
		var contextPath = $('#contextPath').val();
		var url = contextPath + '/approveRequisition?id='+id;
		w2confirm('Are you sure approve this request?', function btn(answer) {
		    if(answer == 'Yes'){	
		    	$('#btn-approved'+id).hide();
		    	$('#btn-reject'+id).hide();
		    	window.location = url;
		    }
		});	
		return false;
	}
	
	function doReject(id){		
		w2confirm('Are you sure Reject this request?', function btn(answer) {
		    if(answer == 'Yes'){		  
		    	//
		    	w2popup.open({
				    title   : 'Reject Reason Input Box',
				    body    : '<input id="identity" name = "id" type="hidden" value="'+id+'"><textarea style="resize:none;" id="rejectReason" rows="3" class="form-control"> </textarea> <br/> <p id="worngMsg" style="color:green;">Please Input a Reject Reason</p>',
				    buttons : '<button id="rejectButton"> Reject </button>',
				    modal           : true,
				    width           : 500,
				    height          : 220,
				    showClose       : true,
				    keyboard        : false,
				    mouse 			: false
				});
		    }
		});	
		return false;
	}
	
	$(document).on("click","#rejectButton",function() {	
		$("#rejectButton").prop("disabled", true);
		var id = $('#identity').val();
		var rejectReason = $('#rejectReason').val();
		var contextPath = $('#contextPath').val();
		var url = contextPath + '/rejectRequisition?id='+id+"&rejectReason="+rejectReason;
		var flag = false;
		
		if(rejectReason.trim().length > 0){
			$("#rejectButton").prop("disabled", true);
			flag = true;
		}else{
			$("#rejectButton").prop("disabled", false);
			flag = false;
			$('#worngMsg').text("You can't Reject Requisition without a reason.");
			$('#worngMsg').css( "color", "red" )
			return;
		}
		
		if(flag){
			$('#btn-approved'+id).hide();
	    	$('#btn-reject'+id).hide();
			$("#rejectButton").prop("disabled", true);
			$('#worngMsg').text("Please Wait...");
			$('#worngMsg').css( "color", "green" )
			window.location = url;
		}	   
	});
	
	$(document).on("click","#printTravelRequisition",function() {	
		var doc = new jsPDF();
		
		var specialElementHandlers = {		    
		};
					
		 doc.fromHTML($('<img style="-moz-box-shadow: 0px 1px 3px 3px #ccc; -webkit-box-shadow: 0px 1px 3px 3px #ccc; box-shadow: 0px 1px 3px 3px #ccc; -moz-border-radius: 10px; -webkit-border-radius: 10px; border-radius: 10px;" src="resource/img/logo.png"/><br/><h1>Travel Requisition Form</h1>').html(), 15, 15, {
			 'width': 170,
		        'elementHandlers': specialElementHandlers
		    });
		 doc.save('travel-requisition.pdf');
	});
	
</script>

</head>

<body>
	<div id="editor"></div>
	<div class="page-head">
		<h2 class="pull-left" style="color: #428bca;">Travel Management
			Dashboard</h2>
		<h3 class="pull-right">
			<a href="${pageContext.request.contextPath}/newRequisition"
				class="btn btn-success btn-sm"> <i class="fa fa-plus"></i> New
				Requisition
			</a>
		</h3>
		<div class="clearfix"></div>
		<input type="hidden" value="${pageContext.request.contextPath}"
			id="contextPath">
	</div>

	<!--   <div class="matter"> -->
	<div class="container">

		<div class="row">

			<div class="col-md-12">

				<!-- Table -->

				<div class="row">

					<div class="col-md-12">


						<div id="tabs">
							<ul>
								<li><a href="#tabs-personal">Personal Travel Info</a></li>
								
								
								<li>
								<c:if test="${!empty travelRequisitionSubmitList}">
										<a href="#tabs-manager" class="btn-warning" style="color: white;">Employees Request as Manager</a>
								</c:if> 
								<c:if test="${empty travelRequisitionSubmitList}">
										<a href="#tabs-manager">Employees Request as Manager</a>
								</c:if></li>
								
								<li><c:if test="${!empty travelRequisitionManAppList}">
										<a href="#tabs-line_manager" class="btn-warning" style="color: white;">Employees Request as 2nd Line Manager</a>
									</c:if> <c:if test="${empty travelRequisitionManAppList}">
										<a href="#tabs-line_manager">Employees Request as 2nd Line Manager</a>
									</c:if></li>
							</ul>

							<div id="tabs-personal">
								<div class="widget-content">
									<div class="table-responsive">
										<c:if test="${!empty travelRequisitionList}">
											<table class="table table-bordered table-hover" id="table1">
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
													<c:forEach items="${travelRequisitionList}"
														var="travelRequisition" varStatus="tr">
														<tr>
															<td class="text-center">${tr.count}</td>
															<td class="text-center">${travelRequisition.reqUniqueNumber}</td>
															<td class="text-center">${travelRequisition.empName}</td>
															<td class="text-center">${travelRequisition.deptName}</td>
															<td class="text-center">${travelRequisition.tripPurpose}</td>
															<td class="text-center">${travelRequisition.departureDate}</td>
															<td class="text-center">${travelRequisition.returnDate}</td>
															<td class="text-center">${travelRequisition.destination}</td>
															<td class="text-center"><c:if
																	test="${travelRequisition.status eq 1}">
																	<span class="btn btn-primary">Ready for Submit</span>
																</c:if> <c:if test="${travelRequisition.status eq 2}">
																	<span class="btn btn-info"> Pending for Approval</span>
																</c:if> 
																<%-- <c:if test="${travelRequisition.status eq 3}">
																	<span class="btn btn-info">Pending for Second
																		Line Manager Approval</span>
																</c:if> --%> 
																<c:if test="${travelRequisition.status eq 4}">
																	<span class="btn btn-success"> Approved</span>
																</c:if> <c:if test="${travelRequisition.status eq 5}">
																	<span class="btn btn-danger"> Rejected</span>
																</c:if> <c:if test="${travelRequisition.status eq 6}">
																	<span class="btn btn-warning"> Deleted</span>
																</c:if></td>
															<td class="text-center"><fmt:formatDate
																	pattern="yyyy-MM-dd"
																	value="${travelRequisition.createdDate}" /></td>
															<td class="text-center">${travelRequisition.createdBy}</td>
															<c:if test="${travelRequisition.status eq 1}">
																<td class="center"><a title="delete" id="btn-delete${travelRequisition.id}"
																	onclick="doDelete(${travelRequisition.id});"><span><i
																			class="fa fa-trash-o"
																			style="font-size: 20px; color: red"></i></span></a> | <a
																	title="edit"
																	href="${pageContext.request.contextPath}/editRequisition?id=${travelRequisition.id}"><span><i
																			class="fa fa-pencil-square-o info"
																			style="font-size: 20px;"></i></span></a> | <a title="submit" id="btn-submit${travelRequisition.id}"
																	onclick="doSubmit(${travelRequisition.id});"><span><i
																			class="fa fa-check-square-o"
																			style="font-size: 20px; color: green"></i></span></a> | <a
																	target="_blank"
																	href="${pageContext.request.contextPath}/downloadRequisition?id=${travelRequisition.id}"
																	title="print" id="printTravelRequisition"><span><i
																			class="fa fa-print" style="font-size: 20px;"></i></span></a></td>
															</c:if>

															<c:if
																test="${travelRequisition.status eq 4 or travelRequisition.status eq 2 or travelRequisition.status eq 3}">
																<td class="center"><a
																	href="${pageContext.request.contextPath}/viewRequisition?id=${travelRequisition.id}"
																	title="view" class="warning"><span><i
																			class="fa fa-archive" style="font-size: 20px;"></i></span>&nbsp;View</a>|
																	<a target="_blank"
																	href="${pageContext.request.contextPath}/downloadRequisition?id=${travelRequisition.id}"
																	title="Download Report"><span><i
																			class="fa fa-download"
																			style="font-size: 20px; color: red"></i></span>&nbsp;Report</a>
																</td>
															</c:if>

															<c:if
																test="${travelRequisition.status eq 5 || travelRequisition.status eq 6}">
																<td class="center"><a
																	href="${pageContext.request.contextPath}/viewRequisition?id=${travelRequisition.id}"
																	title="view" class="warning"><span><i
																			class="fa fa-archive" style="font-size: 20px;"></i></span>&nbsp;View</a>
																</td>
															</c:if>
														</tr>
													</c:forEach>

												</tbody>
											</table>
										</c:if>
									</div>
								</div>
							</div>

							<div id="tabs-manager">
								<div class="widget-content">
									<div class="table-responsive">
										<c:if test="${!empty travelRequisitionSubmitList}">
											<table class="table table-bordered table-hover" id="table2">
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
													<c:forEach items="${travelRequisitionSubmitList}"
														var="travelRequisition" varStatus="tr">
														<tr>
															<td class="text-center">${tr.count}</td>
															<td class="text-center">${travelRequisition.reqUniqueNumber}</td>
															<td class="text-center">${travelRequisition.empName}</td>
															<td class="text-center">${travelRequisition.deptName}</td>
															<td class="text-center">${travelRequisition.tripPurpose}</td>
															<td class="text-center">${travelRequisition.departureDate}</td>
															<td class="text-center">${travelRequisition.returnDate}</td>
															<td class="text-center">${travelRequisition.destination}</td>
															<td class="text-center"><c:if
																	test="${travelRequisition.status eq 1}">
																	<span class="btn btn-primary">Ready for Submit</span>
																</c:if> <c:if test="${travelRequisition.status eq 2}">
																	<span class="btn btn-info"> Pending for Approval</span>
																</c:if> 
																<%-- <c:if test="${travelRequisition.status eq 3}">
																	<span class="btn btn-info">Pending for Second
																		Line Manager Approval</span>
																</c:if> --%> 
																<c:if test="${travelRequisition.status eq 4}">
																	<span class="btn btn-success"> Approved</span>
																</c:if> <c:if test="${travelRequisition.status eq 5}">
																	<span class="btn btn-danger"> Rejected</span>
																</c:if></td>
															<td class="text-center"><fmt:formatDate
																	pattern="yyyy-MM-dd"
																	value="${travelRequisition.createdDate}" /></td>
															<td class="text-center">${travelRequisition.createdBy}</td>
															<c:if test="${travelRequisition.status eq 2}">
																<td class="center"><a
																	href="${pageContext.request.contextPath}/viewRequisition?id=${travelRequisition.id}"
																	title="view" class="warning"><span><i
																			class="fa fa-archive" style="font-size: 20px;"></i></span></a> |
																	<a title="Reject" id="btn-reject${travelRequisition.id}"
																	onclick="doReject(${travelRequisition.id});"><span><i
																			class="fa fa-trash-o"
																			style="font-size: 20px; color: red"></i></span></a> | <a
																	title="Approve"
																	onclick="doApprove(${travelRequisition.id});" id="btn-approved${travelRequisition.id}"><span><i
																			class="fa fa-check-square-o"
																			style="font-size: 20px; color: green"></i></span></a></td>
															</c:if>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</c:if>
									</div>
								</div>
							</div>

							<div id="tabs-line_manager">
								<div class="widget-content">
									<div class="table-responsive">
										<c:if test="${!empty travelRequisitionManAppList}">
											<table class="table table-bordered table-hover" id="table3">
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
													<c:forEach items="${travelRequisitionManAppList}"
														var="travelRequisition" varStatus="tr">
														<tr>
															<td class="text-center">${tr.count}</td>
															<td class="text-center">${travelRequisition.reqUniqueNumber}</td>
															<td class="text-center">${travelRequisition.empName}</td>
															<td class="text-center">${travelRequisition.deptName}</td>
															<td class="text-center">${travelRequisition.tripPurpose}</td>
															<td class="text-center">${travelRequisition.departureDate}</td>
															<td class="text-center">${travelRequisition.returnDate}</td>
															<td class="text-center">${travelRequisition.destination}</td>
															<td class="text-center"><c:if
																	test="${travelRequisition.status eq 1}">
																	<span class="btn btn-primary">Ready for Submit</span>
																</c:if> <c:if test="${travelRequisition.status eq 2}">
																	<span class="btn btn-info"> Pending for Approval</span>
																</c:if> 
																<%-- <c:if test="${travelRequisition.status eq 3}">
																	<span class="btn btn-info">Pending for Second
																		Line Manager Approval</span>
																</c:if> --%> 
																<c:if test="${travelRequisition.status eq 4}">
																	<span class="btn btn-success"> Approved</span>
																</c:if> <c:if test="${travelRequisition.status eq 5}">
																	<span class="btn btn-danger"> Rejected</span>
																</c:if></td>
															<td class="text-center"><fmt:formatDate
																	pattern="yyyy-MM-dd"
																	value="${travelRequisition.createdDate}" /></td>
															<td class="text-center">${travelRequisition.createdBy}</td>
															<c:if test="${travelRequisition.status eq 2}">
																<td class="center"><a
																	href="${pageContext.request.contextPath}/viewRequisition?id=${travelRequisition.id}"
																	title="view" class="warning"><span><i
																			class="fa fa-archive" style="font-size: 20px;"></i></span></a> |
																	<a title="Reject" id="btn-reject${travelRequisition.id}"
																	onclick="doReject(${travelRequisition.id});"><span><i
																			class="fa fa-trash-o"
																			style="font-size: 20px; color: red;"></i></span></a> | <a
																	title="Approve" id="btn-approve${travelRequisition.id}"
																	onclick="doApprove(${travelRequisition.id});"><span><i
																			class="fa fa-check-square-o"
																			style="font-size: 20px; color: green"></i></span></a></td>
															</c:if>
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

	</div>




	<!-- table ends -->













	<!-- Matter ends -->



	<!-- Mainbar ends -->
	<div class="clearfix"></div>




</body>
</html>