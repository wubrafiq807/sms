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
<title>Dashboard - Synergy Inc</title>
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


</head>

<body>
	<!-- Page heading start -->
	<div class="page-head">
		<h2 class="pull-left" style="color: #428bca;">ADDITIONAL
			INFORMATION FORM</h2>
		<div class="clearfix"></div>
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
							<form:form cssClass="form-horizontal" method="POST"
								id="travelAIForm" class="form-horizontal"
								modelAttribute="command"
								action="${pageContext.request.contextPath}/saveAIForm">

								<%-- <div class="form-group">
									<label class="col-lg-2 control-label">ID :</label>
									<div class="col-lg-5">
										<form:input id="id" path="id" value="${additionalInfo.id}"
											class="form-control" readonly="true" />
									</div>
								</div>
 --%>

								<div class="form-group">
									<label class="col-lg-2 control-label">Name <span
										class="red">*</span>:
									</label>
									<div class="col-lg-5">
										<form:input id="name" path="name"
											value="${additionalInfo.name}" class="form-control" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Designation :
									</label>
									<div class="col-lg-5">
										<form:input id="designation" path="designation"
											value="${additionalInfo.designation}" class="form-control" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Department :
									</label>
									<div class="col-lg-5">
										<form:input id="deptName" path="deptName"
											value="${additionalInfo.deptName}" class="form-control" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Employee Id :
									</label>
									<div class="col-lg-5">
										<form:input id="lxnId" path="lxnId"
											value="${additionalInfo.lxnId}" class="form-control" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Mobile No. <span
										class="red">*</span>:
									</label>
									<div class="col-lg-5">
										<form:input id="mobileNo" path="mobileNo"
											value="${additionalInfo.mobileNo}" class="form-control" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Email <span
										class="red">*</span>:
									</label>
									<div class="col-lg-5">
										<input type="email" name="emailAddress" id="emailAddress"
											value="${additionalInfo.emailAddress}" class="form-control">
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Remarks :</label>
									<div class="col-lg-5">
										<textarea id="remarks" class="form-control" name="remarks"
											rows="4" type="textarea">${additionalInfo.remarks}</textarea>
									</div>
								</div>

								<div class="form-group">
									<c:choose>
										<c:when test="${edit}">
											<div class="col-lg-offset-2 col-lg-1 col-xs-4" id="">
												<!-- <input type="submit" value="Update"
													class="btn btn-sm btn-primary btn-success" /> -->
												<button type="button"
													class="btn btn-sm btn-primary btn-success ai-save-update-btn">
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
												<button type="button"
													class="btn btn-sm btn-primary ai-save-update-btn">
													Save</button>
											</div>
											<div class="col-lg-1 col-xs-4">
												<button type="reset" class="btn btn-sm btn-danger ">Reset</button>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
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


	<script type="text/javascript">
		$(document).ready(function() {
			$('.ai-save-update-btn').click(function() {
				var flag = false;
				$(".ai-save-update-btn").prop('disabled', true);

				if ($('#name').val().trim().length > 0) {
					flag = false;
				} else {
					flag = true;
					$(".ai-save-update-btn").prop('disabled', false);
					w2alert("Please Input a Name.");
					return flag;
				}

				if ($('#mobileNo').val().trim().length > 9) {
					flag = false;
				} else {
					flag = true;
					$(".ai-save-update-btn").prop('disabled', false);
					w2alert("Please Input Valid Mobile No.");
					return flag;
				}

				/* if ($('#emailAddress').val().trim().length > 0) {
					flag = false;
				} else {
					flag = true;
					$(".ai-save-update-btn").prop('disabled', false);
					w2alert("Please Input Valid Email Address.");
					return flag;
				} */
				
				if ($('#emailAddress').val().trim().length > 0) {
					
					var x = $('#emailAddress').val();
					var atpos = x.indexOf("@");
					var dotpos = x.lastIndexOf(".");
					if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
						$(".ai-save-update-btn").prop('disabled', false);
						w2alert("Please Input Valid Email Address. ex: test@example.com");
				        flag = true;
				        return;
				    }
					
					flag = false;
				} else {
					flag = true;
					$(".ai-save-update-btn").prop('disabled', false);
					w2alert("Please Input Valid Email Address. ex: test@example.com");
					return flag;
				}

				if (!flag) {

					$(".ai-save-update-btn").prop('disabled', true);
					$('#travelAIForm').submit();
				} else {
					$(".ai-save-update-btn").prop('disabled', false);
					return flag;
				}
			});

		});
		
	</script>

</body>
</html>