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
<title>Service Item - Synergy Inc.</title>
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
<script
	src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script
	src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
<style type="text/css">
form .error {
	color: #ff0000;
}
</style>
<style type="text/css">
.table td.fit, .table th.fit {
	white-space: nowrap;
	width: 1%;
}

.dynamy_div_data_next {
	border: 11px solid #e7d5ec;
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.height_second {
	margin-top: 12px;
	margin-right: 5px;
	width: 53px
}
</style>


</head>

<body>
	<!-- Page heading start -->
	<div class="page-head">
		<h2 class="pull-left" style="color: #428bca;">Service Item
			Form</h2>
		<div class="clearfix"></div>
		<!-- <p class="pull-left" style="color: #428bca;">This form is used to authorize travel and request a travel advance</p>
		<div class="clearfix"></div> -->
	</div>
	<!-- Page heading ends -->

	<!-- Matter -->

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
							<form cssClass="form-horizontal" method="POST" name="reg"
								id="travelRequisitionForm" class="form-horizontal"
								action="${pageContext.request.contextPath}/addUpdateReagent">


								<div class="row">
									<div class="col-md-12 ">
											<div class="form-group">
												<label class="col-lg-2 control-label">Select 
													Property <span class="red">*</span>:
												</label>
												<div class="col-lg-5">
													<select name="propertyId"
														class="form-control ">
														<option value="">Select</option>
														<c:forEach items="${reagentproperty_lis}" var="propert">
														<c:if test="${reagent.propertyId==propert.id}">
														<option value="${propert.id}" selected="selected">${propert.propertyName}</option>
														</c:if>
														<c:if test="${reagent.propertyId!=propert.id}">
														<option value="${propert.id}">${propert.propertyName}</option>
														</c:if>
															
														</c:forEach>
													</select>


												</div>
											</div>
										</div>

								</div>

								<div class="row">
									<div class="col-md-6 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Item Name<span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="reagentName" name="reagentName"
													<c:if test = "${!empty reagent.reagentName}"> value="${reagent.reagentName}" </c:if>
													class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-6 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Item Unit Price<span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="reagentUnitValue" name="reagentUnitValue"
													<c:if test = "${!empty reagent.reagentUnitValue}"> value="${reagent.reagentUnitValue}" </c:if>
													class="form-control" />
											</div>
										</div>
									</div>


								</div>
								<div class="row">
									<div class="col-md-6 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Part No<span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="partNo" name="partNo"
													<c:if test = "${!empty reagent.partNo}"> value="${reagent.partNo}" </c:if>
													class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-6 col-sm-12 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Origin<span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="origin" name="origin"
													<c:if test = "${!empty reagent.partNo}"> value="${reagent.partNo}" </c:if>
													class="form-control" />
											</div>
										</div>
									</div>


								</div>








								<div class="form-group">
									<c:choose>
										<c:when test="${edit=='edit'}">
										<input type="hidden" name="reagent_id"  value="${reagent.id}">
											<div class="col-lg-offset-2 col-lg-1 col-xs-4" id="">
												<!-- <input type="submit" value="Update"
													class="btn btn-sm btn-primary btn-success" /> -->
												<button type="submit" name="btn-save" value="update"
													class="btn btn-sm btn-primary btn-success req-save-update-btn">
													Update</button>
											</div>
											<div class="col-lg-1 col-xs-4">

												<a class="btn btn-sm btn-danger"
													href="${pageContext.request.contextPath}/">Cancel</a>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-lg-offset-2 col-lg-1 col-xs-4" id="">
												<!-- <input type="submit" value="Save"
													class="btn btn-sm btn-primary" /> -->
												<button type="submit" name="btn-save" value="save"
													class="btn btn-sm btn-primary req-save-update-btn">
													Save</button>
											</div>
											<div class="col-lg-1 col-xs-4">
												<button type="reset" class="btn btn-sm btn-danger ">Reset</button>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</form>
						</div>

					</div>
					<div class="widget-foot">
						<!-- Footer goes here -->
					</div>
				</div>
				<c:url var="requestForAnOtp" value="/getReagentAjax" />
				<c:url var="requestForReagent" value="/getReagentAjaxbyProperty" />

				<!-- Table -->

			</div>

		</div>

	</div>

	<!-- table ends -->

	<!-- Matter ends -->

	<!-- Mainbar ends -->
	<div class="clearfix"></div>


	<script>
		$(function() {
			// Initialize form validation on the registration form.
			// It has the name attribute "registration"
			$("form[name='reg']").validate({
				// Specify validation rules
				rules : {

					origin : "required",
					partNo : "required",
					reagentUnitValue : "required",
					reagentName : "required",
					propertyId : "required",
				},
				// Specify validation error messages

				submitHandler : function(form) {
					form.submit();
				}
			});
		});
	</script>

</body>
</html>