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
<title>Work Order Update - Synergy Inc</title>
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
		<h2 class="pull-left" style="color: #428bca;">Account Work Order
			Form</h2>
		<div class="clearfix"></div>
		<!-- <p class="pull-left" style="color: #428bca;">This form is used to authorize travel and request a travel advance</p>
		<div class="clearfix"></div> -->
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
							<form cssClass="form-horizontal" method="POST" name="reg"
								id="travelRequisitionForm" class="form-horizontal"
								action="${pageContext.request.contextPath}/updateWorkOrderMast">

								<%-- 	<div class="form-group">
									<label class="col-lg-2 control-label">ID :</label>
									<div class="col-lg-5">
										<form:input id="id" path="id" value="${travelRequisition.id}"
											class="form-control" readonly="true" />
									</div>
								</div> --%>


								<input type="hidden" name="id" value="${mst.id}">

								<div class="row">
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Vendor Name <span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="vendorName" name="vendorName" type="text"
													value="${mst.vendorName}" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Address Line 1
												<span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="addressLine1" name="addressLine1"
													value="${mst.addressLine1}" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Address Line 2
												<span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="addressLine2" name="addressLine2"
													value="${mst.addressLine2}" class="form-control" />
											</div>
										</div>
									</div>

								</div>

								<div class="row">
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Mode of Payment
												<span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<!-- 												<input id="paymentMode" name="paymentMode" -->
												<%-- 													value="${mst.paymentMode}" class="form-control" /> --%>
												<select class="form-control" name="paymentMode">
													<option value="">Select</option>
													<c:forEach var="list" items="${settingList}"
														varStatus="loop">
														<c:if test="${list.type==1}">
														<c:if test="${list.value==mst.paymentMode}">
															<option value="${list.value}" selected="selected">${list.value}</option>
															</c:if>
															<c:if test="${list.value!=mst.paymentMode}">
															<option value="${list.value}" >${list.value}</option>
															</c:if>
														</c:if>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Delivery/Service
												Schedule <span class="red">*</span>:
											</label>
											<div class="col-lg-5">
<!-- 												<input id="deliverySchedule" name="deliverySchedule" -->
<%-- 													value="${mst.deliverySchedule}" class="form-control" /> --%>
													<select class="form-control" name="deliverySchedule">
													<option value="">Select</option>
													<c:forEach var="list" items="${settingList}"
														varStatus="loop">
														<c:if test="${list.type==2}">
														<c:if test="${list.value==mst.deliverySchedule}">
															<option value="${list.value}" selected="selected">${list.value}</option>
															</c:if>
															<c:if test="${list.value!=mst.deliverySchedule}">
															<option value="${list.value}" >${list.value}</option>
															</c:if>
														</c:if>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Delivery/Service
												Place <span class="red">*</span>:
											</label>
											<div class="col-lg-5">
<!-- 												<input id="deliveryPlace" name="deliveryPlace" -->
<%-- 													value="${mst.deliveryPlace}" class="form-control" /> --%>
													<select class="form-control" name="deliveryPlace">
													<option value="">Select</option>
													<c:forEach var="list" items="${settingList}"
														varStatus="loop">
														<c:if test="${list.type==3}">
														<c:if test="${list.value==mst.deliveryPlace}">
															<option value="${list.value}" selected="selected">${list.value}</option>
															</c:if>
															<c:if test="${list.value!=mst.deliveryPlace}">
															<option value="${list.value}" >${list.value}</option>
															</c:if>
														</c:if>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>

								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Work Order
												Subject <span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="workOrderSubject" name="workOrderSubject"
													value="${mst.workOrderSubject}" value=""
													class="form-control" />
											</div>
										</div>
									</div>

								</div>
								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Work Order No <span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="workOrderNo" name="workOrderNo"
													value="${mst.workOrderNo}" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Work Order Date
												<span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input type="eu-date2" class="form-control"
													name="workOrderDate" id="workOrderDate"
													value="${mst.workOrderDate}">
											</div>
										</div>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Vendor's
												Quotation No. <span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="vendorQuotationNo" name="vendorQuotationNo"
													value="${mst.vendorQuotationNo }" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Vendos's
												Quotation Date <span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input type="eu-date1" class="form-control"
													name="vendorQuotationDate" id="vendorQuotationDate"
													value="${mst.vendorQuotationDate }">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Total Original
												Price<span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="originalTotalAmount" readonly="readonly"
													name="originalTotalAmount"
													value="${mst.originalTotalAmount}" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Discount Amount
												<span class="red"></span>:
											</label>
											<div class="col-lg-5">
												<input type="text" class="form-control"
													onchange="updateDiscountInfp()" name="discountAmount"
													id="discountAmount" value="${mst.discountAmount}">
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Total Price
												After Discount <span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="discountedTotalAmount" readonly="readonly"
													name="discountedTotalAmount"
													value="${mst.discountedTotalAmount}" class="form-control" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-lg-2 control-label"> Special
												Conditions <span class="red">*</span>:
											</label>
											<div class="col-lg-5">

												<textarea rows="5" name="specialCondition"
													class="form-control">${mst.specialCondition }</textarea>
											</div>
										</div>
									</div>

								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-lg-2 control-label"> Footer text <span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">

												<textarea rows="5" name="footerText" class="form-control">${mst.footerText }</textarea>
											</div>
										</div>
									</div>

								</div>






								<div class="form-group">
									<c:choose>
										<c:when test="${edit}">
											<div class="col-lg-offset-2 col-lg-1 col-xs-4" id="">
												<!-- <input type="submit" value="Update"
													class="btn btn-sm btn-primary btn-success" /> -->
												<button type="button"
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
												<button type="submit"
													class="btn btn-sm btn-primary req-save-update-btn">
													Update</button>
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
	<script
		src="${pageContext.request.contextPath}/resource/js/sweetalert.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/js/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/js/additional-methods.min.js"></script>
	<script type="text/javascript">
		function updateDiscountInfp() {
			var totaafterdis = parseFloat($('#originalTotalAmount').val())
					- parseFloat($('#discountAmount').val());
			$('#discountedTotalAmount').val(totaafterdis.toFixed(2));
		}
	</script>
	<script>
		$(function() {
			var month = (new Date()).getMonth() + 1;
			var year = (new Date()).getFullYear();
			// US Format
			$('input[type=eu-date1]').w2field('date', {
				format : 'yyyy-mm-dd',
				end : $('input[type=eu-date2]')
			});
			$('input[type=eu-date2]').w2field('date', {
				format : 'yyyy-mm-dd',
				start : $('input[type=eu-date1]')
			});
		});

		$(function() {
			// Initialize form validation on the registration form.
			// It has the name attribute "registration"
			$("form[name='reg']").validate({
				// Specify validation rules
				rules : {
					// The key name on the left side is the name attribute
					// of an input field. Validation rules are defined
					// on the right side
					vendorName : "required",
					addressLine1 : "required",
					addressLine2 : "required",
					paymentMode : "required",
					deliverySchedule : "required",
					deliveryPlace : "required",
					workOrderSubject : "required",
					workOrderNo : "required",
					workOrderDate : "required",
					vendorQuotationNo : "required",
					vendorQuotationDate : "required",
					footerText : {
						required : true,
						maxlength : 100,
					}

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