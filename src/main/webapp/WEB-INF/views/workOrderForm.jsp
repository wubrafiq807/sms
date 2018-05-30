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
<title>Work Order Form -Synergy Inc</title>
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
	src="${pageContext.request.contextPath}/resource/js/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/js/additional-methods.min.js"></script>
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
								action="${pageContext.request.contextPath}/saveWorkOrder">

								<%-- 	<div class="form-group">
									<label class="col-lg-2 control-label">ID :</label>
									<div class="col-lg-5">
										<form:input id="id" path="id" value="${travelRequisition.id}"
											class="form-control" readonly="true" />
									</div>
								</div> --%>
								
								 <c:if test="${!empty success}">
									
									<div class="row">
									<div class="col-md-12">
										<div class="alert alert-success">
											<strong>Success!</strong> You have added a new work order.
										
										</div>
									</div>
								</div>
								
								</c:if> 
								

								<div class="row">
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Vendor Name <span
												class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="vendorName" name="vendorName" type="text"
													value="" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Address Line 1
												<span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="addressLine1" name="addressLine1" value=""
													class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<div class="form-group">
											<label class="col-lg-2 control-label">Address Line 2
												<span class="red">*</span>:
											</label>
											<div class="col-lg-5">
												<input id="addressLine2" name="addressLine2" value=""
													class="form-control" />
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
												
													<select class="form-control" name="paymentMode">
													<option value="">Select</option>
													<c:forEach var="list"
																items="${settingList}" varStatus="loop">
																<c:if test="${list.type==1}">
																<option value="${list.value}">${list.value}</option>
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
												
													<select class="form-control" name="deliverySchedule">
													<option value="">Select</option>
													<c:forEach var="list"
																items="${settingList}" varStatus="loop">
																<c:if test="${list.type==2}">
																<option value="${list.value}">${list.value}</option>
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
<!-- 												<input id="deliveryPlace" name="deliveryPlace" value="" -->
<!-- 													class="form-control" /> -->
													<select class="form-control" name="deliveryPlace">
													<option value="">Select</option>
													<c:forEach var="list"
																items="${settingList}" varStatus="loop">
																<c:if test="${list.type==3}">
																<option value="${list.value}">${list.value}</option>
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
												<input id="workOrderSubject" name="workOrderSubject" "
													value="" class="form-control" />
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
												<input id="workOrderNo" name="workOrderNo" value=""
													class="form-control" />
													<label id="workOrderNo-already" class="error" ></label>
													<input type="hidden" id="workOrderNo_already" value="0">
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
													name="workOrderDate" id="workOrderDate" value="">
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
													value="" class="form-control" />
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
													value="">
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
													class="form-control"></textarea>
											</div>
										</div>
									</div>

								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-lg-2 control-label"> Footer Text
												 <span class="red">*</span>:
											</label>
											<div class="col-lg-5">

												<input type="text" name="footerText"
													class="form-control"/>
											</div>
										</div>
									</div>

								</div>
								<input type="hidden" id="div_no" name="div_no" value="0">
								<div class="dynamy_div_data_next dn_div_n_0">
									<button class="pull-right btn btn-warning" type="button"
										onclick="removeThisDive(0)">
										<i class="fa fa-minus fa-lg" aria-hidden="true"></i>
									</button>
									<!-- <div class="row">
								<div class="col-md-11 height_f_0"> -->
									<div class="row">
										<div class="col-md-12 ">
											<div class="form-group">
												<label class="col-lg-2 control-label">Select Item
													Property <span class="red">*</span>:
												</label>
												<div class="col-lg-5">
													<select name="reagent_name"
														class="form-control reagent_pro_name_value_0"
														onchange="sendajaxReagentPro(0)">
														<option value="">Select</option>
														<c:forEach items="${reagentproperty_lis}" var="propert">
															<option value="${propert.id}">${propert.propertyName}</option>
														</c:forEach>
													</select>


												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="form-group">
												<label class="col-lg-2 control-label">Select Item
													<span class="red">*</span>:
												</label>
												<div class="col-lg-5">
													<select name="reagent_name"
														class="form-control reagent_name_value_0"
														onchange="sendajax(0)">
														<%-- 	<option value="">Select</option>
													<c:forEach items="${reagentlist}" var="reagent">
														<option value="${reagent.id}">${reagent.reagentName}</option>
													</c:forEach> --%>
													</select>


												</div>
											</div>
										</div>

										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="form-group">
												<label class="col-lg-2 control-label">S/N <span
													class="red">*</span>:
												</label>
												<div class="col-lg-5">
													<input id="serialNo" name="serialNo_0" value=""
														class="form-control serialNo_com" />
												</div>
											</div>
										</div>

									</div>



									<div class="row">

										<div class="col-md-12">
											<table class="table table-striped" id="myTable_0">
												<thead>
													<tr>
														<th>Reagent Name</th>
														<th>Part No</th>
														<th>Origin</th>
														<th>Unit Price</th>
														<th>Qty</th>
														<th>Total Price at Site(TK.)</th>
														<th style="text-align: right;"></th>
													</tr>
												</thead>
												<tbody>

												</tbody>
												<tfoot>
													<tr>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td style="text-align: right;">Sub Total:</td>
														<td><input type="text" id="sub_total_0"
															class="form-control sub_total_com"></td>
														<td></td>

													</tr>

												</tfoot>


											</table>

										</div>

									</div>
									<!-- </div> -->
									<!-- <div class="col-md-1 height_second height_g_0 btn btn-danger">
								</div>
								</div> -->

								</div>

								<div class="dynamy_div_data"></div>
								<div class="row">

									<div class="col-md-7">
										<h1 class="pull-right">Discount Amount</h1>

									</div>
									<div class="col-md-4">
										<input type="number" id="discountAmount" name="discountAmount" value="0" class="form-control" onchange="getDiscountInfo()">
									</div>

								</div>
								<div class="row">

									<div class="col-md-7">	
										<h1 class="pull-right">Total:</h1>

									</div>
									<div class="col-md-4">
										<input type="text" id="total_sum" name="discountedTotalAmount" class="form-control">
									</div>

								</div>
								<div class="row"
									style="margin-bottom: 10px; text-align: center;">
									<div class="col-md-12">
										<button class="btn btn-info form-control" type="button"
											onclick="dynamicData()">
											<i class="fa fa-plus" aria-hidden="true"></i>
										</button>
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
	<script src="${pageContext.request.contextPath}/resource/js/sweetalert.min.js"></script>
	<script type="text/javascript">
	$(function () {
	    $('#workOrderSubject').on('keyup keydown keypress', function (event) {
	    	var text=$('#workOrderSubject').val().toUpperCase();
			$('#workOrderSubject').val(text);
	    });
	});
	function updateWorkOrder() {
		var text=$('#workOrderSubject').val().trim().toUpperCase();
		$('#workOrderSubject').val(text);
	}
	</script>
	<script>
		var div_count = 0;

		function dynamicData() {
			div_count++;

			var html = '';
			// 			html+='<div class="row">';
			// 				html+='<div class="col-md-11 height_f_'+div_count+'">';
			html += '<div class="dynamy_div_data_next dn_div_n_'+div_count+'">';
			html += '<button class="pull-right btn btn-warning" type="button" onclick="removeThisDive('
					+ div_count
					+ ')"><i class="fa fa-minus fa-lg" aria-hidden="true"></i></button>';
			html += '<div class="row">';
			html += '<div class="col-md-12 ">';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2 control-label">Select Item Property <span class="red">*</span>:</label>';
			html += '	<div class="col-lg-5"><select name="reagent_name"class="form-control reagent_pro_name_value_'
					+ div_count
					+ '"	onchange="sendajaxReagentPro('
					+ div_count
					+ ')">';
			html += '		<option value="">Select</option>';
			html += '		<c:forEach items="${reagentproperty_lis}" var="propert">';
			html += '	<option value="${propert.id}">${propert.propertyName}</option>';
			html += '	</c:forEach>';
			html += '	</select></div></div></div>	</div>';
			html += '<div class="row">';
			html += '<div class="col-md-6 col-sm-6 col-xs-12">';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2 control-label">Select Item';
			html += '<span class="red">*</span>:</label>';

			html += '<div class="col-lg-5">';
			html += '<select name="reagent_name"';
			html += '	class="form-control reagent_name_value_' + div_count
					+ '"';
			html += '	onchange="sendajax(' + div_count + ')">';
			/* 	html += '	<option value="">Select</option>';
				html += '<c:forEach items="${reagentlist}" var="reagent">'
				html += '<option value="${reagent.id}">${reagent.reagentName} </option>';
				html += '	</c:forEach>'; */
			html += '	</select>';

			html += '	</div></div></div>';

			html += '<div class="col-md-6 col-sm-6 col-xs-12">';
			html += '<div class="form-group">';
			html += '<label class="col-lg-2 control-label">S/N <span';
		html+='class="red">*</span>:</label>';
			html += '<div class="col-lg-5">';
			html += '<input id="serialNo_'+div_count+'" name="serialNo_'+div_count+'" value="" class="form-control serialNo_com" /></div>';
			html += '</div>';
			html += '</div></div>';
			html += '<div class="row">';

			html += '<div class="col-md-12">';
			html += '<table class="table table-striped" id="myTable_'+div_count+'">';
			html += '<thead>';
			html += '<tr>';
			html += '<th>Reagent Name</th>';
			html += '<th>Part No</th>';
			html += '<th>Origin</th>';
			html += '<th>Unit Price</th>'
			html += '<th>Qty</th>';
			html += '<th>Total Price at Site(TK.)</th>';
			html += '<th style="text-align: right;"></th>';
			html += '</tr>';
			html += '</thead>';
			html += '<tbody></tbody>';
			html += '<tfoot><tr><td></td><td></td><td></td><td></td><td style="text-align: right;">Sub Total:</td>';
			html += '<td><input type="text" id="sub_total_'+div_count+'" class="form-control sub_total_com"></td>';
			html += '	<td></td></tr></tfoot>';
			html += '</table></div>';

			html += '</div>';
			html += '</div>';
			/* html += '</div>';
			html += '<div class="col-md-1 height_second height_g_'+div_count+' btn btn-danger">';
			html += '</div>';
			html += '</div>'; */
			$('.dynamy_div_data').append(html);
			var div_num = [ "" ];
			var trainindIdArray = $('#div_no').val().split(',');
			$.each(trainindIdArray, function(index, value) {
				div_num.push("" + value + "");
			});

			div_num.push("" + div_count + "");
			var new_array = $.map(div_num, function(el) {
				return el !== '' ? el : null;
			});
			$('#div_no').val(new_array.join());

		}
		$(function() {
			$('#workOrderNo').on("change",function(e){
				e.preventDefault();
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/checkWorkOrderExist",
					dataType : 'json',
					data : {
						workOrderNo : $('#workOrderNo').val()
					},
					success : function(response) {
						if(response.masterinfo!=''){
							$('#workOrderNo-already').text('Work Order NO Already Exist.');
							$('#workOrderNo_already').val('1');
						}if(response.masterinfo==null){
							$('#workOrderNo-already').text('');
							$('#workOrderNo_already').val('0');
						}
					},
					error : function() {
					}

				});
			});
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
					serialNo : "required",
					quantity : "required",
					footerText:{
						 required: true,
                         maxlength: 100,
					}

				},
				// Specify validation error messages

				submitHandler : function(form) {
					form.submit();
				}
			});
			
			$('.req-save-update-btn').click(function(e){
				
				if ($('#workOrderNo_already').val() =='1') {
					 e.preventDefault();
						swal('Wrror...',
								  'Work Order NO Already Exist!',
								  'error'
							);
				    }
				$('.quantity_com').each(function(j, v) {
					//console.log(v.value);
					
					if(v.value=='0' || v.value==''){
					e.preventDefault();
					swal('Somthing went Wrong...',
							  'Please Check the form care fully . Quantity can not be Zero or Empty!',
							  'error'
							);
					return false;
					}
				});
				 if ($(".quantity_com").length ==0) {
					 e.preventDefault();
						swal('Worning...',
								  'You did not add any Product!',
								  'error'
								);
				    }
				$('.serialNo_com').each(function(j, v) {
					//console.log(v.value);
					if(v.value=='0' || v.value==''){
					e.preventDefault();
					swal('Somthing went Wrong...',
							  'Please Check the form care fully . Serial Number Can Not Be Empty!',
							  'error'
							);
					return false;
					}
				});
				
				
				
			});
		});
		
		
	</script>
	<script type="text/javascript">
	function getDiscountInfo() {
		  var full_total = [];
			
			$('.sub_total_com').each(function(j, v) {
				full_total.push(v.value);
			})
			var full_total = full_total.filter(function(v) {
				return v !== ''
			});
			
			var sum_full = full_total.reduce((pv,cv)=>{
				   return pv + (parseFloat(cv)||0);
				},0);
			total=sum_full-parseFloat($('#discountAmount').val());
			$('#total_sum').val(parseFloat(total).toFixed(2));
	}
		var count = 0;
		function sendajax(i) {

			count++;
			var requestForAnOtp = '<c:out value="${requestForAnOtp}"/>';
			var otp = '';
			var reagent_id = $('.reagent_name_value_' + i).val();
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
							var html = '';
							html += '<tr> <input type="hidden" name="reagent_id_'+i+'" value="'+response.reagentinfo.id+'"/>';
							html += '<td>' + response.reagentinfo.reagentName
									+ '</td>';
							html += '<td>' + response.reagentinfo.partNo
									+ '</td>';
							html += '<td>' + response.reagentinfo.origin
									+ '</td>';
							html += '<td><input type="hidden" value="'+response.reagentinfo.reagentUnitValue+'" id="unit_price_'+count+'" />'
									+ response.reagentinfo.reagentUnitValue
									+ '</td>';
							html += '<td><input type="text" id="quantity_'
									+ count + '" onchange="getdatainfo(' + count
									+ ',' + i
									+ ')" class="form-control quantity_com" name="quantity_'
									+ i + '" id="quantity"	value=""></td>';
							html += '<td><input type="text" class="form-control single_'+i+'_to_'+count+' single_total_'+i+'" name="total" id="total_price_'+count+'"	></td>';
							html += '<td style="text-align: right;"><button 	onclick="deleteRow(this,'
									+ i
									+ ','+count+')" class="btn btn-danger" style="text-align: center;"> <i class="fa fa-minus" aria-hidden="true"></i></button></td></tr>';
							$('#myTable_' + i + ' tbody').append(html);
						},
						error : function() {
						}

					});
			/* $('.height_g_'+i).css("height",$('.height_f_'+i).outerHeight()); */
		}

		function sendajaxReagentPro(i) {
			var property_id = $('.reagent_pro_name_value_' + i).val();
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
					$('.reagent_name_value_' + i).empty();
					var html = '	<option value="">Select</option>';
					$.each(response.reagentinfo, function(index, value) {

						html += '	<option value="'+value.id+'">'
								+ value.reagentName.replace(/[^a-z0-9\s]/gi,
										' ').replace(/[_\s]/g, ' ')
								+ '</option>';
					});
					$('.reagent_name_value_' + i).append(html);
				},
				error : function() {
				}

			});
			/* alert(i);
			$('.height_g_'+i).css("height",$('.height_f_'+i).outerHeight()); */

		}

		function deleteRow(r, no,count) {
			//alert(no);
		var item_val=$('.single_'+no+'_to_'+count).val();
		var sub_total=$('#sub_total_'+no).val();
		sub_total=parseFloat(sub_total)-parseFloat(item_val);
		$('#sub_total_'+no).val(sub_total.toFixed(2));
		
		var total=$('#total_sum').val();
		total=parseFloat(total)-parseFloat(item_val);
		total=total-parseFloat($('#discountAmount').val());
		$('#total_sum').val(parseFloat(total).toFixed(2));
		//console.log(item_val);
			var i = r.parentNode.parentNode.rowIndex;
			document.getElementById("myTable_" + no).deleteRow(i);
			/* $('.height_g_'+no).css("height",$('.height_f_'+no).outerHeight()); */
			return false;
		}
		function removeThisDive(i) {
			
			
			var item_val=$('#sub_total_'+i).val();
			var total=$('#total_sum').val();
			total=parseFloat(total)-parseFloat(item_val);
			total=total-parseFloat($('#discountAmount').val());
			$('#total_sum').val(parseFloat(total).toFixed(2));
			$('.dn_div_n_' + i).remove();

			var div_num = [ "" ];
			var trainindIdArray = $('#div_no').val().split(',');
			/* $.each(trainindIdArray, function( index, value ) {
				div_num.push(""+value+"");
				});
			
			div_num.push(""+div_count+"");
			var new_array = $.map(div_num, function (el) {
			    return el !== '' ? el : null;
			}); */

			var arr = [ 1, 2, 3, 4, 5, 5 ];

			var result = trainindIdArray.filter(function(elem) {
				return elem != i;
			});
			$('#div_no').val(result.join());

		}
		function getdatainfo(count, i) {
			if(parseInt($('#quantity_' + count).val())==0){
				swal('Worning...',
						  'Quantity can not be Zero or Empty!',
						  'error'
						);
			}
			
			var total_price = parseFloat($('#unit_price_' + count).val())
					.toFixed(2)
					* parseInt($('#quantity_' + count).val());
			$('.single_' + i + '_to_' + count).val(
					parseFloat(total_price).toFixed(2));
			var sub_total = [];
			
			$('.single_total_' + i).each(function(j, v) {
				sub_total.push(v.value);
			})
			var sub_total = sub_total.filter(function(v) {
				return v !== ''
			});
			/* var total = 0.0;
			for (var i = 0; i < sub_total.length; i++) {
			    total += parseFloat(sub_total[i])<< 0;
			} */
			var sum = sub_total.reduce((pv,cv)=>{
				   return pv + (parseFloat(cv)||0);
				},0);
			
			$('#sub_total_'+i).val(parseFloat(sum).toFixed(2));
			
          var full_total = [];
			
			$('.sub_total_com').each(function(j, v) {
				full_total.push(v.value);
			})
			var full_total = full_total.filter(function(v) {
				return v !== ''
			});
			
			var sum_full = full_total.reduce((pv,cv)=>{
				   return pv + (parseFloat(cv)||0);
				},0);
			total=sum_full-parseFloat($('#discountAmount').val());
			$('#total_sum').val(parseFloat(total).toFixed(2));

		}

		$(function() {
			var month = (new Date()).getMonth() + 1;
			var year = (new Date()).getFullYear();
			// US Format
			$('input[type=eu-date1]').w2field('date', {
				format : 'yyyy-mm-dd',
				
			});
			$('input[type=eu-date2]').w2field('date', {
				format : 'yyyy-mm-dd',
				
			});
		});
	</script>

</body>
</html>