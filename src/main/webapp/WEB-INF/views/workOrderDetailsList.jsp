<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- Title and other stuffs -->
<title>Work Order Details - Synergy Inc</title>
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

div#myModal {
	padding-left: 92px;
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
				pageSize : 'LEGAL'
			} ]
		});

	});
</script>

</head>

<body>

	<input type="hidden" value="${pageContext.request.contextPath}"
		id="contextPath">

	<div class="page-head">
		<h2 class="pull-left" style="color: #428bca;">Work Order Details
			List</h2>
		<button class="pull-right btn btn-info" data-toggle="modal"
			data-target="#myModal" style="margin-top: 13px; padding: 8px;">Add
			New</button>
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

		<div class="modal fade" id="myModal" style="padding-left: 92px;"
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">New Work Order Details Form</h4>
					</div>
					<div class="modal-body">
						<form cssClass="form-horizontal" method="POST" name="reg"
							id="travelRequisitionForm" class="form-horizontal"
							action="${pageContext.request.contextPath}/updateWorkOrderDTl">




							<input type="hidden" name="mst_id"
								value="${WorkOrderDTLList[0].work_order_mst_id}">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="col-lg-2 control-label">Description
											Property<span class="red">*</span>:
										</label>
										<div class="col-lg-5">
											<select name="property_id"
												class="form-control reagent_pro_name_value"
												onchange="sendajaxReagentPro()">
												<option value="">Select</option>
												<c:forEach items="${reagentProperties}" var="propert">
													<option value="${propert.id}">${propert.propertyName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="col-lg-2 control-label">Description Item<span
											class="red">*</span>:
										</label>
										<div class="col-lg-5">
											<select name="reagentId"
												class="form-control reagent_name_value"
												onchange="sendajax()">
												<option value="">Select</option>

											</select>
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
											<input id="partNo" name="partNo" type="text"
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
											<input id="origin" name="origin" class="form-control" />
										</div>
									</div>
								</div>
								<div class="col-md-4 col-sm-6 col-xs-12">
									<div class="form-group">
										<label class="col-lg-2 control-label">Unit Price at
											Site(Tk) <span class="red">*</span>:
										</label>
										<div class="col-lg-5">
											<input id="reagentUnitValue" name="reagentUnitValue"
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
											<input id="serialNo" name="serialNo" class="form-control" />
										</div>
									</div>
								</div>
								<div class="col-md-4 col-sm-6 col-xs-12">
									<div class="form-group">
										<label class="col-lg-2 control-label">Quantity <span
											class="red">*</span>:
										</label>
										<div class="col-lg-5">
											<input id="quantity" name="quantity" class="form-control" />
										</div>
									</div>
								</div>
								<div class="col-md-4 col-sm-6 col-xs-12">
									<div class="form-group">
										<label class="col-lg-2 control-label">Total Price at
											Site(Tk) <span class="red">*</span>:
										</label>
										<div class="col-lg-5">
											<input id="totalPrice" name="totalPrice" class="form-control" />
										</div>
									</div>
								</div>


							</div>







							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-1 col-xs-4" id="">
									<!-- <input type="submit" value="Save"
													class="btn btn-sm btn-primary" /> -->
									<button type="submit" name="btn_add_new" value="add_new"
										class="btn btn-sm btn-primary req-save-update-btn">
										Save</button>
								</div>
								<div class="col-lg-1 col-xs-4">
									<button type="reset" class="btn btn-sm btn-danger ">Reset</button>
								</div>
							</div>
						</form>



					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<!-- <button type="button" class="btn btn-primary">Save
							changes</button> -->
					</div>
				</div>
			</div>
		</div>
		<div class="add_btn_extra"></div>

		<div class="row">

			<div class="col-md-12">

				<!-- Table -->

				<div class="row">

					<div class="col-md-12">

						<div class="widget">

							<div class="widget-head">
								<div class="pull-left">Work Order Details List</div>
								<div class="widget-icons pull-right">
									<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="wclose"><i class="fa fa-times"></i></a>
								</div>
								<div class="clearfix"></div>
							</div>

							<div class="widget-content">

								<div class="table-responsive">

									<c:if test="${!empty WorkOrderDTLList}">
										<table class="table table-striped" id="">
											<thead>
												<tr style="background-color: #428bca; color: white">
													<th class="text-center">Sl NO.</th>
													<th class="text-center">Description Of Item.</th>
													<th class="text-center">Item Serial No</th>
													<th class="text-center">Part No</th>
													<th class="text-center">Origin</th>
													<th class="text-center">Unit Price at site (TK)</th>
													<th class="text-center">Qty</th>
													<th class="text-center">Total Price at site(TK)</th>
													<th class="text-center">Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${WorkOrderDTLList}" var="workOrderdtl"
													varStatus="tr">
													<c:set var="string1" value="${workOrderdtl.serial_no}" />
													<c:set var="string2"
														value="${fn:replace(string1, '/', '-')}" />
													<c:set var="string3"
														value="${fn:replace(string2, '\', '-')}" />
													<c:set var="string4"
														value="${fn:replace(string3, '@', '-')}" />
													<c:set var="string5"
														value="${fn:replace(string4, ' ', '-')}" />
													<tr class="row_no_${string5} row_com_tr">
													<input type="hidden" class="serial_${string5}" value="${workOrderdtl.propertyname}">

														<td class="text-center">${tr.count}</td>
														<td class="text-center">${workOrderdtl.reagentname}</td>
														<td class="text-center">${workOrderdtl.serial_no}</td>
														<td class="text-center">${workOrderdtl.reagent_partno}</td>
														<td class="text-center">${workOrderdtl.reagent_origin }</td>
														<td class="text-center">${workOrderdtl.reagentunitvalue}</td>
														<td class="text-center">${workOrderdtl.quantity}</td>
														<td class="text-center">${workOrderdtl.quantity*workOrderdtl.reagentunitvalue}</td>
														<td class="text-center"><a
															href="${pageContext.request.contextPath}/editWorkOrderDtl/${workOrderdtl.id}/${workOrderdtl.work_order_mst_id}"><i
																class="fa fa-pencil-square-o" aria-hidden="true"
																title="Edit"></i></a> <a
															href="${pageContext.request.contextPath}/deleteWorkOrderDtl/${workOrderdtl.id}/${workOrderdtl.work_order_mst_id}"
															onclick="return archiveFunction('${pageContext.request.contextPath}/deleteWorkOrderDtl/${workOrderdtl.id}/${workOrderdtl.work_order_mst_id}')"><i
																class="fa fa-trash-o" aria-hidden="true" title="Delete"></i></a>


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

	<c:url var="requestForReagent" value="/getReagentAjaxbyProperty" />
	<c:url var="requestForAnOtp" value="/getReagentAjax" />

	<!-- table ends -->













	<!-- Matter ends -->



	<!-- Mainbar ends -->
	<div class="clearfix"></div>
	<script
		src="${pageContext.request.contextPath}/resource/js/sweetalert.min.js"></script>
	<script>
var serialArray=[];	

<c:forEach items="${WorkOrderDTLList}" var="workOrderdtl" varStatus="tr">
serialArray.push('${workOrderdtl.serial_no}');
</c:forEach>


</script>
<script>
serialArray=$.unique(serialArray);
var property_array=[];
$.each(serialArray, function( index, value ) {
	$('.serial_'+value.replace(/[_\W]+/g, "-")).each(function(j,val){
		property_array.push(val.value);
		property_array=$.unique(property_array);
	});
	var html='';
	 html+='<div class="row"><div class="col-md-12"><button class="btn btn-success btn-row-com" id="'+value.replace(/[_\W]+/g, "-")+'" style="width: 100%;margin-top:5px">'+property_array.join()+' ('+value+')</button></div></div>';
	 $('.add_btn_extra').append(html);
	 property_array=[];
	});

</script>

	<script type="text/javascript">
	$(function() {
		$('.btn-row-com').click(function(){
			$('.row_com_tr').hide();
			$('.row_no_'+$(this).get(0).id).show();
			
		});
		
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
	
	$("form[name='reg']").validate({
		// Specify validation rules
		rules : {
			// The key name on the left side is the name attribute
			// of an input field. Validation rules are defined
			// on the right side
			reagentId : "required",
			serialNo:"required",
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
function archiveFunction(url) {
	event.preventDefault(); // prevent form submit
	swal({
		  title: "Are you sure?",
		  text: "Once deleted, you will not be able to recover this imaginary file!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		  
		    window.location.href = url;
		  } else {
		    swal("Your imaginary file is safe!");
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