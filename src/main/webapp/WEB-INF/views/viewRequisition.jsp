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
<!-- <title>Dashboard - Lexicon Merchandise</title> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">

<link
	href="${pageContext.request.contextPath}/resource/select2/select2.min.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/resource/select2/select2.min.js"></script>

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
.table td.fit, .table th.fit {
	white-space: nowrap;
	width: 1%;
}
</style>

<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
	
	function doSubmit(id){
		var contextPath = $('#contextPath').val();
		var url = contextPath + '/submitRequisition?id='+id;
		w2confirm('Are you sure submit this to manager?', function btn(answer) {
		    if(answer == 'Yes'){		  
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
			$("#rejectButton").prop("disabled", true);
			$('#worngMsg').text("Please Wait...");
			$('#worngMsg').css( "color", "green" )
			window.location = url;
		}	   
	});
	
	
</script>
</head>

<body>
	<!-- Page heading start -->
	<div class="page-head">
		<h2 class="pull-left" style="color: #428bca;">Travel Requisition
			Details</h2>
		<div class="clearfix"></div>
		<input type="hidden" value="${pageContext.request.contextPath}" id="contextPath">
	</div>
	<!-- Page heading ends -->

	<!-- Matter -->

	<!--   <div class="matter"> -->
	<div class="container">

		<div class="row">

			<div class="col-md-12">


				<div class="widget wgreen">

					<div class="widget-head">
						<div class="pull-left"></div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="widget-content">
						<div class="padd">

							<br />

							<!-- Form starts.  -->
							<form:form cssClass="form-horizontal" id="travelRequisitionForm"
								class="form-horizontal">

								<%-- <div class="cal-xs-12">
									<table class="table table-bordered table-hover">
										<tr>
											<th>ID</th>
											<td>${travelRequisition.id}</td>
											<th>Purpose of Trip</th>
											<td>${travelRequisition.tripPurpose}</td>
											<th>Departure Date</th>
											<td>${travelRequisition.departureDate}</td>
											<th>Return Date</th>
											<td>${travelRequisition.returnDate}</td>
										</tr>
									</table>
								</div> --%>


								 <div class="form-group">
									<label class="col-lg-2 control-label">ID :</label>
									<div class="col-lg-5">${travelRequisition.id}</div>
								</div>


								<c:if test="${!empty travelRequisition.tripPurpose}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Purpose of Trip:</label>
										<div class="col-lg-5">${travelRequisition.tripPurpose}</div>

									</div>
								</c:if>

								<c:if test="${!empty travelRequisition.departureDate}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Departure Date:</label>
										<div class="col-lg-5">

											${travelRequisition.departureDate}</div>
									</div>
								</c:if>

								<c:if test="${!empty travelRequisition.returnDate}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Return Date:</label>
										<div class="col-lg-5">${travelRequisition.returnDate}</div>
									</div>
								</c:if> 

								<%-- <div class="cal-xs-12">
									<table class="table table-bordered table-hover">
										<tr>
											<th>Destination</th>
											<td>${travelRequisition.destination}</td>
											<th>Means of Transport</th>
											<td>${travelRequisition.meansOfTransport}</td>
											<th>Manager</th>
											<td>${travelRequisition.approveByManager}</td>
											<th>Manager Approved Date</th>
											<td>${travelRequisition.appManDate}</td>
										</tr>
									</table>
								</div> --%>

								 <c:if test="${!empty travelRequisition.destination}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Destination:</label>
										<div class="col-lg-5">${travelRequisition.destination}</div>
									</div>
								</c:if>

								<c:if test="${!empty travelRequisition.meansOfTransport}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Means of
											Transport:</label>
										<div class="col-lg-5">

											${travelRequisition.meansOfTransport}</div>
									</div>
								</c:if>

								<c:if test="${!empty travelRequisition.approveByManager}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Manager :</label>
										<div class="col-lg-5">

											${travelRequisition.approveByManager}</div>
									</div>
								</c:if>

								<c:if test="${!empty travelRequisition.appManDate}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Manager Approved
											Date :</label>
										<div class="col-lg-5">${travelRequisition.appManDate}</div>
									</div>
								</c:if>
								
								<%-- <div class="cal-xs-12">
									<table class="table table-bordered table-hover">
										<tr>
											<th>Second Line Manager</th>
											<td>${travelRequisition.approveByLineManager}</td>
											<th>Line Manager Approved Datet</th>
											<td>${travelRequisition.appLineManDate}</td>
											<th>Remarks</th>
											<td>${travelRequisition.remarks}</td>
											<th>Submit Date</th>
											<td>${travelRequisition.submitDate}</td>
										</tr>
									</table>
								</div> --%>

								 <c:if test="${!empty travelRequisition.approveByLineManager}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Second Line
											Manager:</label>
										<div class="col-lg-5">

											${travelRequisition.approveByLineManager}</div>
									</div>
								</c:if>

								<c:if test="${!empty travelRequisition.appLineManDate}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Line Manager
											Approved Date:</label>
										<div class="col-lg-5">

											${travelRequisition.appLineManDate}</div>
									</div>
								</c:if>
								
								<c:if test="${!empty travelRequisition.rejectedBy}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Rejected By :</label>
										<div class="col-lg-5">${travelRequisition.rejectedBy}</div>
									</div>
								</c:if>
								
								<c:if test="${!empty travelRequisition.rejectedDate}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Rejected Date :</label>
										<div class="col-lg-5">${travelRequisition.rejectedDate}</div>
									</div>
								</c:if>
								
								<c:if test="${!empty travelRequisition.rejectReason}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Reject Reason :</label>
										<div class="col-lg-5">${travelRequisition.rejectReason}</div>
									</div>
								</c:if>


								<c:if test="${!empty travelRequisition.remarks}">
									<div class="form-group">
										<label class="col-lg-2 control-label">Remarks :</label>
										<div class="col-lg-5">${travelRequisition.remarks}</div>
									</div>
								</c:if>

								<%-- <div class="form-group">

									<c:if test="${travelRequisition.status eq 1}">
										<div class="col-lg-offset-2 col-lg-1 col-xs-4" id="">
											<button type="button" onclick="doSubmit(${travelRequisition.id});" class="btn btn-sm btn-success ">Submit</button>
										</div>
										<div class="col-lg-1 col-xs-4">
											<a class="btn btn-sm btn-danger"
												href="${pageContext.request.contextPath}/">Cancel</a>
										</div>
									</c:if>
									
									<c:if
										test="${travelRequisition.status eq 2 || travelRequisition.status eq 3}">
										<div class="col-lg-offset-2 col-lg-1 col-xs-4" id="">
											<button onclick="doApprove(${travelRequisition.id});" type="button" class="btn btn-sm btn-success ">Approve</button>
										</div>
										<div class="col-lg-1 col-xs-4">
											<button onclick="doReject(${travelRequisition.id});" type="button" class="btn btn-sm btn-danger ">Reject</button>
										</div>
									</c:if>
									
								</div> --%>
							</form:form>
						</div>

					</div>
					<div class="widget-foot">
						<!-- Footer goes here -->
					</div>
				</div>

				<!-- Table -->

			</div>

		</div>

	</div>

	<!-- table ends -->

	<!-- Matter ends -->

	<!-- Mainbar ends -->
	<div class="clearfix"></div>

</body>
</html>