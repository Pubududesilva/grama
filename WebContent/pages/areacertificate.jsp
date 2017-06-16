<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery Gritter Plugin Demos</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/jquery.gritter.js"></script>


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style type="text/css">
form {
	margin: 20px 0;
}

form input, button {
	padding: 5px;
}

table {
	width: 100%;
	margin-bottom: 20px;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #cdcdcd;
}

table th, table td {
	padding: 10px;
	text-align: left;
}
</style>

</head>

<body>
	<script type="text/javascript">
	
	function savegramadata(){
		debugger;
	}
$(function() {
	$("#txtBrithday").datepicker();
	$("#txtBrithday").datepicker("setDate", "+0");
});

function livingofcertificat(){
	debugger;
	var livetrue = $("input[name='livetrue']:checked").val();
	
	var dataObj = {
			"txtIdNo" : $('#txtIdNo').val(),
			"txtYear" : $('#txtYear').val(),
			"livetrue" : livetrue,
			"requeatfor" : $('#requeatfor').val()

		};
	var data1 = JSON.stringify(dataObj);
	
	$.ajax({
		type : "POST",
		url : "areacertificate",
		data : "name=" + data1,
		success : function(response) {
			debugger;
		

			$.gritter.add({
				// (string | mandatory) the heading of the notification
				title : 'සාමාජික පවුල් තොරතුරු!',
				// (string | mandatory) the text inside the notification
				text : 'සාමාජික පවුල් තොරතුරුසර්තකව ගබඩ කරන ලදි.',
				// (string | optional) the image to display on the left
				image : 'images/confirm.png'
			// (bool | optional) if you want it to fade out on its own or just sit there

			});

		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
	
}

</script>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp"><img alt="Ja - ele"
				src="images/jaela3.png" width="200" height="40"></a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Lorem ipsum dolor sit amet, consectetur adipiscing
								elit. Pellentesque eleifend...</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>Read
								All Messages</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-messages --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-tasks">
					<li><a href="#">
							<div>
								<p>
									<strong>Task 1</strong> <span class="pull-right text-muted">40%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100" style="width: 40%">
										<span class="sr-only">40% Complete (success)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>Task 2</strong> <span class="pull-right text-muted">20%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
										style="width: 20%">
										<span class="sr-only">20% Complete</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>Task 3</strong> <span class="pull-right text-muted">60%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-warning"
										role="progressbar" aria-valuenow="60" aria-valuemin="0"
										aria-valuemax="100" style="width: 60%">
										<span class="sr-only">60% Complete (warning)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>Task 4</strong> <span class="pull-right text-muted">80%
										Complete</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-danger"
										role="progressbar" aria-valuenow="80" aria-valuemin="0"
										aria-valuemax="100" style="width: 80%">
										<span class="sr-only">80% Complete (danger)</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>See
								All Tasks</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-tasks --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-comment fa-fw"></i> New Comment <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
									class="pull-right text-muted small">12 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-envelope fa-fw"></i> Message Sent <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-tasks fa-fw"></i> New Task <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>See
								All Alerts</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-alerts --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> User
							Profile</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
					</li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<!-- 						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div> /input-group
						</li> -->
					<li><a href="indextemp.jsp"><i class="fa fa-dashboard fa-fw"></i>
							ප්‍රධාන පුවරුව</a></li>
					<li><a href="#"><i class="fa fa-user"></i> ගෘහ මුලික
							තොරතුරු<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level sub-menu collapse">
							<li><a href="houseHolders">තොරතුරු එකතු කිරිම</a></li>
							<li><a href="changedetails">තොරතුරු වෙනස් කිරිම</a></li>
						</ul> <!-- /.nav-second-level --></li>
				
					
						<li><a href="#"><i class="fa fa-users"></i> ප්‍රස්තාර්<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level sub-menu collapse">
							<li><a href="livingcertificate">පදිංචි සහතික පත</a></li>
							<li><a href="areacertificateload">වසමෙ තොරතුරු</a></li>
						</ul> <!-- /.nav-second-level --></li>
						
					<li><a href="#"><i class="fa fa-users"></i> සමිති / සමාගම්<span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level sub-menu collapse">
							<li><a href="addsocieties">තොරතුරු එකතු කිරිම</a></li>
							<li><a href="changesocieties">තොරතුරු වෙනස් කිරිම</a></li>
						</ul> <!-- /.nav-second-level --></li>

					<li><a href="#"><i class="fa fa-building"></i> ව්‍යාපාරික
							ආයතන<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level sub-menu collapse">
							<li><a href="addbusiness">තොරතුරු එකතු කිරිම</a></li>
							<li><a href="changbusiness">තොරතුරු වෙනස් කිරිම</a></li>
						</ul> <!-- /.nav-second-level --></li>

					<li><a href="#"><i class="fa fa-wrench"></i> සැකසුම්
							තොරතුරු<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level sub-menu collapse">

							<li><a href="#"><i class="fa fa-user-o"></i>ග්‍රාම
									නිලධාරි තොරතුරු <span class="fa arrow"></span></a>
								<ul class="nav nav-third-level sub-menu collapse">
									<li><a href="addgramapersondata">තොරතුරු එකතු කිරිම</a></li>
									<li><a href="editgramapersondata">තොරතුරු සකස් කිරිම</a></li>
								</ul> <!-- /.nav-third-level --></li>

							<li><a href="#">ග්‍රාමසේවා වසම තොරතුරු <span
									class="fa arrow"></span></a>
								<ul class="nav nav-third-level sub-menu collapse">
									<li><a href="addgramadata">තොරතුරු එකතු කිරිම</a></li>
								</ul> <!-- /.nav-third-level --></li>
						</ul> <!-- /.nav-second-level --></li>


				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">

			<div class="row" style="padding-top: 30px;">
				<div class="col-lg-12">

					<ol class="breadcrumb">
						<li><i class="fa fa-wrench"></i> <a href="index.jsp">සැකසුම්
								තොරතුරු</a></li>
						<li class="active"><i class="fa fa-edit"></i>ග්‍රාම නිලධාරි
							තොරතුරු</li>
						<li class="active"><i class="fa fa-edit"></i>තොරතුරු එකතු
							කිරීම</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<h2 style="color: #0664F0">වසමෙ තොරතුරු</h2>
					<!--                     


                </div>
                
                <!-- /.col-lg-12 -->
					<div class="col-lg-12">

						<div class="col-lg-8">



							<div style="padding-bottom: 30px;">
								<label class="col-xs-12"> <input
									class="form-check-input" type="checkbox" > &nbsp;
									&nbsp;ජාතින් අනුව ජනගහනය
								</label>
							</div>
														<div style="padding-bottom: 30px;">
								<label class="col-xs-12"> <input
									class="form-check-input" type="checkbox"> &nbsp;
									&nbsp;ආගම් අනුව ජනග්‍රාහනය 
								</label>
							</div>
							
														<div style="padding-bottom: 30px;">
								<label class="col-xs-12"> <input
									class="form-check-input" type="checkbox"> &nbsp;
									&nbsp;වයස අනුව ජනග්‍රාහනය 
								</label>
							</div>


													<div style="padding-bottom: 30px;">
								<label class="col-xs-12"> <input
									class="form-check-input" type="checkbox"> &nbsp;
									&nbsp;අධයාපනය අනුව ජනගහනය
								</label>
							</div>
							
																				<div style="padding-bottom: 30px;">
								<label class="col-xs-12"> <input
									class="form-check-input" type="checkbox"> &nbsp;
									&nbsp;සේවා නියුක්තිය ජනගහනය
								</label>
							</div>
							
																				<div style="padding-bottom: 30px;">
								<label class="col-xs-12"> <input
									class="form-check-input" type="checkbox"> &nbsp;
									&nbsp;සේවා වියුක්තිය ජනගහනය
								</label>
							</div>
							
																				<div style="padding-bottom: 30px;">
								<label class="col-xs-12"> <input
									class="form-check-input" type="checkbox"> &nbsp;
									&nbsp;ආබාර සහිත ජනගහනය
								</label>
							</div>
							
																				<div style="padding-bottom: 30px;">
								<label class="col-xs-12"> <input
									class="form-check-input" type="checkbox"> &nbsp;
									&nbsp;ආබාධ සහිත ජනගහනය
								</label>
							</div>
							
																				<div style="padding-bottom: 30px;">
								<label class="col-xs-12"> <input
									class="form-check-input" type="checkbox"> &nbsp;
									&nbsp;කොට්ටාශය පාවුල් ජනගහනය
								</label>
							</div>
							
																				<div style="padding-bottom: 30px;">
								<label class="col-xs-12"> <input
									class="form-check-input" type="checkbox"> &nbsp;
									&nbsp;ආදය අනුව ජනගහනය
								</label>
							</div>




						</div>



						<div class="col-lg-4">
							<div class="row"></div>
						</div>

						<div class="form-group">
							<div class="col-xs-10 "
								style="padding-left: 20px; margin-top: 50px;">
								<input type="button" class="btn btn-primary"
									value="ඇතුල්
												කරන්න" onclick="livingofcertificat()">

							</div>
							<div class="col-xs-offset-2 col-xs-9 " style="padding-left: 0px"></div>

						</div>


						<div></div>

						<div class="row"></div>
















					</div>





					<!-- /#page-wrapper -->

				</div>
				<!-- /#wrapper -->


				<!-- Bootstrap Core JavaScript -->
				<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

				<!-- Metis Menu Plugin JavaScript -->
				<script src="../vendor/metisMenu/metisMenu.min.js"></script>

				<!-- Flot Charts JavaScript -->
				<script src="../vendor/flot/excanvas.min.js"></script>
				<script src="../vendor/flot/jquery.flot.js"></script>
				<script src="../vendor/flot/jquery.flos"></script>
				<script src="../vendor/flot/jquery.flot.resize.jt.pie.js"></script>
				<script src="../vendor/flot/jquery.flot.time.js"></script>
				<script src="../vendor/flot-tooltip/jquery.flot.tooltip.min.js"></script>


				<!-- Custom Theme JavaScript -->
				<script src="../dist/js/sb-admin-2.js"></script>
</body>

</html>

