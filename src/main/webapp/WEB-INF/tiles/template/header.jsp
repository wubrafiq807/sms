<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page session="true"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<style>
.image {
	width: 32px;
	height: 32px;
	border-radius: 50%;
	background-image: url("path/to/image");
	background-position: center center;
	/* as mentioned by Vad: */
	background-size: cover;
}
</style>


<div class="row">
	<div class="col-xs-12 text-center">
		<h1>
			<strong>Synergy Service Management System</strong>
		</h1>

	</div>

	<div class="col-xs-11 text-center">
		${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		<c:set var="userName" value="${sessionScope.userr}" scope="page" />
		<c:set var="userId" value="${sessionScope.userrId}" scope="page" />
		<div class="col-xs-2">
			<span></span>
		</div>
		<div class="" style="float: right">

			<span class="btn btn-primary"><strong><c:out
						value="${userName}" /></strong> </span>

			<!-- added by taleb -->
			<span class=""><a class="btn btn-info"
				style="background-color: #E5EBFF; color: orange;"
				href="${pageContext.request.contextPath}/<c:url value='j_spring_security_logout' />"><i
					class="fa fa-power-off"></i><span> Logout</span></a></span> <span><button
					class="btn btn-success" data-toggle="modal"
					data-target="#myModal_header" style="height: 38px">Settings</button></span>
		</div>
	</div>


</div>
<div id="myModal_header" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Settings</h4>
				<a class="btn btn-info" href="${pageContext.request.contextPath}/settingsList">View Settings</a>
			</div>
			<div class="modal-body">
				<form class="" action="${pageContext.request.contextPath}/addSettings" name="header_form" method="post">
					<div class="row">
						<div class="col-md-6 col-sm-12-col-xs-12">
							<div class="form-group">
								<label for="tyep">Settings Type:</label> <select
									class="form-control" name="type">
									<option value="">Select a Type</option>
									<option value="1">Payment Mode</option>
									<option value="2">Delivery Schedule</option>
									<option value="3">Delivery Place</option>
								</select>
							</div>
						</div>
						<div class="col-md-6 col-sm-12-col-xs-12">
							<div class="form-group">
								<label for="value">Value:</label> <input type="text" name="value"
									class="form-control" placeholder="Enter Settins value ">
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-12">
							<button type="submit" class="btn btn-info" style="width: 100%">Submit</button>
						</div>
					</div>


				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>
