<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- Title and other stuffs -->
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">


<!-- Stylesheets -->
<link href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/resource/css/demo.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet">
<!-- Font awesome icon -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/resource/css/font-awesome.min.css">
<!-- bdjobs css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bdjobs-style.css">
<!-- jQuery UI -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/jquery-ui.css">
<!-- Calendar -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/fullcalendar.css">
<!-- prettyPhoto -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/prettyPhoto.css">
<!-- Star rating -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/rateit.css">
<!-- Date picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/bootstrap-datetimepicker.min.css">
<!-- CLEditor -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/jquery.cleditor.css">
<!-- Data tables -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/jquery.dataTables.css">
<!-- Bootstrap toggle -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/jquery.onoff.css">
<!-- Main stylesheet -->
<link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resource/css/custom.css" rel="stylesheet">
<!-- Widgets stylesheet -->
<link href="${pageContext.request.contextPath}/resource/css/widgets.css" rel="stylesheet">
<!-- Widgets stylesheet -->
<link href="${pageContext.request.contextPath}/resource/css/bootstrap-table.css" rel="stylesheet">
<!-- Widgets stylesheet -->
<link href="${pageContext.request.contextPath}/resource/css/jquery.dataTables.css" rel="stylesheet">
<!-- Widgets stylesheet -->
<link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/jquery.steps.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/normalize.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resource/js/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/jquery-1.7.2.js"></script>
<!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath}/resource/js/html5shiv.js"></script>
  <![endif]-->
<link
	href="https://cdn.jsdelivr.net/bootstrap.timepicker/0.2.6/css/bootstrap-timepicker.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/bootstrap.timepicker/0.2.6/css/bootstrap-timepicker.css"
	rel="stylesheet">



<!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/img/favicon.ico">

<!--for new Dashboard-->
<link href="${pageContext.request.contextPath}/resource/css/style.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<style>
#clock {
	font-family: 'Open Sans', sans-serif;
	font-size: 1em;
	font-weight: bold;
	background-color: #0CF;
	color: #fff;
	padding: 7px 50px;
	position: relative;
	top: 100px;
	left: 100px;
}
</style>
	<script
		src="${pageContext.request.contextPath}/resource/js/sweetalert.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/js/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/js/additional-methods.min.js"></script>
<script>
	$(document).ready(function() {
		DisplayCurrentTime();
	});

	function DisplayCurrentTime() {
		var dt = new Date();
		var refresh = 1000; //Refresh rate 1000 milli sec means 1 sec
		var cDate = (dt.getMonth() + 1) + "/" + dt.getDate() + "/"
				+ dt.getFullYear();
		document.getElementById('cTime').innerHTML = cDate + "  "
				+ dt.toLocaleTimeString();
		window.setTimeout('DisplayCurrentTime()', refresh);
	}
</script>
</head>



<body>

	<input type="hidden" id="cTime">
	<div class="content">

		<%
			// Set refresh, autoload time as 5 seconds
			response.setIntHeader("Refresh", 5);
		%>

		<!-- Sidebar -->
		<div class="sidebar">
			<div class="sidebar-dropdown">
				<a href="#">Navigation</a>
			</div>

			<!--- Sidebar navigation -->
			<!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->

			<ul id="nav">
				<!-- Main menu with font awesome icon -->

				<li class="open"><a href="${pageContext.request.contextPath}/"><i
						class="fa fa-home"></i>Dashboard</a></li>

				<%-- <sec:authorize
					access="hasRole('ROLE_ADMIN') or hasRole('ROLE_LEAVE_ADMIN')">
					<li class="has_sub"><a href="#"><i class="fa fa-database"></i>System<span
							class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
						<ul>
							<li><a href="getAIForm">Additional Info Form</a></li>
							<li><a href="aiList">Additional Info List</a></li>
						</ul></li>
				</sec:authorize> --%>

				<sec:authorize
					access="hasRole('ROLE_ADMIN') or hasRole('ROLE_USER') or hasRole('ROLE_UTILITY_ADMIN') or hasRole('ROLE_LEAVE_ADMIN') or hasRole('ROLE_LEAVE_SUPERVISOR') or hasRole('ROLE_LEAVE_USER') or hasRole('ROLE_ATTENDANCE_ADMIN') or hasRole('ROLE_ATTENDANCE_SUPERVISOR') or hasRole('ROLE_ATTENDANCE_USER') or hasRole('ROLE_SUPERVISOR')">
					<li class="has_sub"><a href="#"><i class="fa fa-database"></i>Work Order<span
							class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
						<ul>
							
							<li><a href="${pageContext.request.contextPath}/newWorkOrder">Add Work Order</a></li>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li><a href="${pageContext.request.contextPath}/getWorkOrderList">Work Order List
										</a></li>
							</sec:authorize>
						</ul>
						</li>
						
						<li class="has_sub"><a href="#"><i class="fa fa-database"></i>Service Item<span
							class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
						<ul>
							
							<li><a href="${pageContext.request.contextPath}/newReagent">Add Item</a></li>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li><a href="${pageContext.request.contextPath}/geReagentList"> Item List
										</a></li>
							</sec:authorize>
						</ul>
						</li>
						<li class="has_sub"><a href="#"><i class="fa fa-database"></i>Service Property<span
							class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
						<ul>
							
							<li><a href="${pageContext.request.contextPath}/newReagentProperty">Add Service Property</a></li>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li><a href="${pageContext.request.contextPath}/geReagentPropertyList">Service Property List
										</a></li>
							</sec:authorize>
						</ul>
						</li>
				</sec:authorize>
			</ul>



		</div>

		<!-- Sidebar ends -->
		<!-- Main bar -->



		<!-- Mainbar ends -->
		<div class="clearfix"></div>

	</div>
	<!-- Content ends -->

	<!-- Footer starts -->
	<!-- <footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
            Copyright info
            <p class="copy">Copyright &copy; 2012 | <a href="http://lexiconbd.org" target="_blank">Lexicon_Merchandise</a> </p>
      </div>
    </div>
  </div>
</footer> 	 -->

	<!-- Footer ends -->

	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span>
	<!--chart js   -->
	<!-- <script src="js/jquery-1.11.1.min.js"></script> -->
	<!-- <script src="js/highcharts.js"></script> -->
	<script src="${pageContext.request.contextPath}/resource/js/Chart.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/Chart1.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/legend.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/demo.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/zingchart.min.js"></script>

	<!-- for add delete row -->
	<script src="${pageContext.request.contextPath}/resource/js/itemSelect.js"></script>
	<!-- JS -->
	<!-- <script src="${pageContext.request.contextPath}/resource/js/jquery.js"></script> -->
	<!-- jQuery -->
	<!-- <script src="${pageContext.request.contextPath}/resource/js/jquery.min.js"></script> jQuery -->
	<!-- <script src="${pageContext.request.contextPath}/resource/js/jquery-3.1.0.min.js"></script> -->
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery-ui.min.js"></script>
	<!-- jQuery UI -->
	<script src="${pageContext.request.contextPath}/resource/js/fullcalendar.min.js"></script>
	<!-- Full Google Calendar - Calendar -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery.rateit.min.js"></script>
	<!-- RateIt - Star rating -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery.prettyPhoto.js"></script>
	<!-- prettyPhoto -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery.slimscroll.min.js"></script>
	<!-- jQuery Slim Scroll -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery.dataTables.min.js"></script>
	<!-- Data tables -->

	<!-- jQuery Flot -->
	<script src="${pageContext.request.contextPath}/resource/js/excanvas.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/jquery.flot.resize.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/jquery.flot.stack.js"></script>

	<!-- jQuery Notification - Noty -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery.noty.js"></script>
	<!-- jQuery Notify -->
	<script src="${pageContext.request.contextPath}/resource/js/themes/default.js"></script>
	<!-- jQuery Notify -->
	<script src="${pageContext.request.contextPath}/resource/js/layouts/bottom.js"></script>
	<!-- jQuery Notify -->
	<script src="${pageContext.request.contextPath}/resource/js/layouts/topRight.js"></script>
	<!-- jQuery Notify -->
	<script src="${pageContext.request.contextPath}/resource/js/layouts/top.js"></script>
	<!-- jQuery Notify -->
	<!-- jQuery Notification ends -->

	<script src="${pageContext.request.contextPath}/resource/js/sparklines.js"></script>
	<!-- Sparklines -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery.cleditor.min.js"></script>
	<!-- CLEditor -->
	<script src="${pageContext.request.contextPath}/resource/js/bootstrap-datetimepicker.min.js"></script>
	<!-- Date picker -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery.onoff.min.js"></script>
	<!-- Bootstrap Toggle -->
	<script src="${pageContext.request.contextPath}/resource/js/filter.js"></script>
	<!-- Filter for support page -->
	<script src="${pageContext.request.contextPath}/resource/js/custom.js"></script>
	<!-- Custom codes -->
	<script src="${pageContext.request.contextPath}/resource/js/charts.js"></script>
	<!-- Charts & Graphs -->



	<!-- jQuery Unknown -->
	<script src="${pageContext.request.contextPath}/resource/js/jquery.calculation.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/legend.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/respond.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/topRight.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/navAccordion.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/navAccordion.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resource/js/bootstrap-timepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/resource/js/bootstrap-timepicker.min.js"></script>
<!-- <script
		src="https://cdn.jsdelivr.net/bootstrap.timepicker/0.2.6/js/bootstrap-timepicker.js"></script>
	<script
		src="https://cdn.jsdelivr.net/bootstrap.timepicker/0.2.6/js/bootstrap-timepicker.min.js"></script> 
 -->




</body>
</html>

