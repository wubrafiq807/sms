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
<title>Update Work Order - Synergy Inc.</title>
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
			Details Update Form</h2>
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
								action="${pageContext.request.contextPath}/updateWorkOrderDTl">



								<input type="hidden" name="id" value="${workOrderDetails.id}">
								<input type="hidden" name="mst_id" value="${workOrderDetails.work_order_mst_id}">
								
								<div class="row">
									<div class="col-md-12">
									<div class="form-group">
											<label class="col-lg-2 control-label">Item Property<span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
											<input type="hidden" value="${workOrderDetails.propertyname}">
												<input id="propertyname" name="propertyname" type="text" readonly
													value="${workOrderDetails.propertyname}"
													class="form-control" />
											</div>
										</div>
									
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
									<div class="form-group">
											<label class="col-lg-2 control-label">Item Description<span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
											<input type="hidden" name="reagentId" value="${workOrderDetails.reagent_id}">
												<input id="reagentId" name="" type="text" readonly
													value="${workOrderDetails.reagentname}"
													class="form-control" />
											</div>
										</div>
									
									</div>
								</div>

								<div class="row">
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Part No <span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="partNo" name="partNo" type="text" readonly
													value="${workOrderDetails.reagent_partno}"
													class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Origin <span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="origin" name="origin" readonly
													value="${workOrderDetails.reagent_origin}"
													class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Unit Price at
												Site(Tk) <span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="reagentUnitValue" name="reagentUnitValue" readonly
													value="${workOrderDetails.reagentunitvalue }"
													class="form-control" />
											</div>
										</div>
									</div>

								</div>

								<div class="row">
								<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Item Serial No <span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="serialNo" name="serialNo" readonly
													value="${workOrderDetails.serial_no}" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Quantity <span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="quantity" name="quantity"
													value="${workOrderDetails.quantity}" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Total Price at
												Site(Tk) <span class="red">*</span>:
											</label>
											<div class="col-lg-5">
											<input type="hidden" value="${workOrderDetails.quantity*workOrderDetails.reagentunitvalue}" name="totalPrice_old">
												<input id="totalPrice" name="totalPrice" readonly
													value="${workOrderDetails.quantity*workOrderDetails.reagentunitvalue}"
													class="form-control" />
											</div>
										</div>
									</div>


								</div>







								<div class="form-group">
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
	
	function sendajax() {
		var requestForAnOtp = '<c:out value="${requestForAnOtp}"/>';
		var otp = '';
		var reagent_id = $('.reagent_name_value').val();
		$
				.ajax({
					type : "post",
					url : requestForAnOtp,
					dataType : 'json',
					data : {
						reagent_id : reagent_id
					},
					success : function(response) {
						//otp = JSON.parse(response);
						console.log(response.reagentinfo);
						$('#reagentUnitValue').val(response.reagentinfo.reagentUnitValue);
						$('#origin').val(response.reagentinfo.origin);
						$('#partNo').val(response.reagentinfo.partNo);
						var total=parseFloat(response.reagentinfo.reagentUnitValue)*(parseInt($('#quantity').val()));
						$('#totalPrice').val(total.toFixed(2));
						
						
					},
					error : function() {
					}

				});
		
	}
	function sendajaxReagentPro() {
		var property_id = $('.reagent_pro_name_value').val();
		var requestForReagent = '<c:out value="${requestForReagent}"/>';

		$.ajax({
			type : "post",
			url : requestForReagent,
			dataType : 'json',
			data : {
				property_id : property_id
			},
			success : function(response) {
				//otp = JSON.parse(response);
				//console.log(response.reagentinfo);
				$('.reagent_name_value').empty();
				var html = '	<option value="">Select</option>';
				$.each(response.reagentinfo, function(index, value) {

					html += '	<option value="'+value.id+'">'
							+ value.reagentName.replace(/[^a-z0-9\s]/gi,
									' ').replace(/[_\s]/g, ' ')
							+ '</option>';
				});
				$('.reagent_name_value').append(html);
			},
			error : function() {
			}

		});
		/* alert(i);
		$('.height_g_'+i).css("height",$('.height_f_'+i).outerHeight()); */

	}
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
			
			$('#quantity').on('keyup',function(){
				if(parseInt($('#quantity').val())>0){
					var total=parseFloat($('#reagentUnitValue').val())*(parseInt($('#quantity').val()));
					$('#totalPrice').val(total.toFixed(2));
				}
				if(parseInt($('#quantity').val())==0){
					swal('Somthing went Wrong...',
							  'Please Check the form care fully . Quantity can not be Zero or Empty!',
							  'error'
							);
				}
			});
			// Initialize form validation on the registration form.
			// It has the name attribute "registration"
			$("form[name='reg']").validate({
				// Specify validation rules
				rules : {
					// The key name on the left side is the name attribute
					// of an input field. Validation rules are defined
					// on the right side
					reagentId : "required",
					quantity :{
						
						required: true,
					      minlength: 1
					} ,
					serialNo : "required",
					

				},
				// Specify validation error messages

				submitHandler : function(form) {
					form.submit();
				}
			});
			$('.req-save-update-btn').click(function(e){
				if(parseInt($('#quantity').val())==0 | $('#quantity').val()==''){
				e.preventDefault();
				swal('Somthing went Wrong...',
						  'Please Check the form care fully . Quantity can not be Zero or Empty!',
						  'error'
						);
				return false;
				}
			});
		});
	</script>

</body>
</html>