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

	<s:hidden id="simulationInfos" value="%{simulationInfos}"
		name="simulationInfos" />

	<script type="text/javascript">
		var tabCount;
		sessionStorage.clickcount;

		$(function() {
			$("#txtBrithday").datepicker();
			$("#txtBrithday").datepicker("setDate", "+0");
		});

		function doAjaxPost() {

			var isWater = $("input[name='water']:checked").val();
			var istoilet = $("input[name='txttoiletstrue']:checked").val();

			var iselectricity = $("input[name='electricity']:checked").val();

			localStorage.clickcount = $('#txtHomeNumber').val();

			$('#example tbody').on('click', 'tr', function() {
				debugger;
				var d = table.row(this).data();

				d.counter++;

				table.row(this).data(d).draw();
			});

			var dataObj = {
				"txtHomeNumber" : $('#txtHomeNumber').val(),
				"txtRoad" : $('#txtRoad').val(),
				"txtAddress1" : $('#txtAddress1').val(),
				"txtAddress2" : $('#txtAddress2').val(),
				"txtAddress3" : $('#txtAddress3').val(),
				"txtAddress4" : $('#txtAddress4').val(),
				"txtTelephone" : $('#txtTelephone').val(),
				"txtroof" : $('#txtroof').val(),
				"txtfloor" : $('#txtfloor').val(),
				"txtwall" : $('#txtwall').val(),
				"txtflows" : $('#txtflows').val(),
				"txtland" : $('#txtland').val(),
				"txtlandpaper" : $('#txtlandpaper').val(),
				"txtlandnumber" : $('#txtlandnumber').val(),
				"txtHomeNumber" : $('#txtHomeNumber').val(),
				"txtlandyear" : $('#txtlandyear').val(),
				"water" : isWater,
				"txtland" : $('#txtland').val(),
				"electricity" : iselectricity,
				"txttoiletstrue" : istoilet,
				"homeId" : $('#homeId').val(),
				"txtarea" : $('#txtarea').val()

			};
			// get the form values
			// var name = $('#txtHomeNumber').val();

			var data1 = JSON.stringify(dataObj);

			// get the form values
			var name = $('#txtHomeNumber').val();

			$.ajax({
				type : "POST",
				url : "savehousedetail",
				data : "name=" + data1,
				success : function(response) {
					debugger;
					var x = response.split("@@@");
					homeNumber = x[0];
					var x = localStorage.clickcount;
					document.getElementById("result").innerHTML = homeNumber;
					// we have the response
					$('#info').html(response);
					$.gritter.add({
						// (string | mandatory) the heading of the notification
						title : 'නිවාස තොරතුරු!',
						// (string | mandatory) the text inside the notification
						text : 'නිවාස තොරතුරු සර්තකව ගබඩ කරන ලදි.',
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

		function familyPost() {
			debugger;
			var isWater = "true";
			var istoilet = "true";

			var iselectricity = "true";
			localStorage.familyvalue = $('#homeSubNumber').val();

			var dataObj = {
				"homeSubNumber" : $('#homeSubNumber').val(),
				"salararyDetail" : $('#salararyDetail').val(),
				"samurdi_donation" : $('#samurdi_donation').val(),
				"samurdi_account" : $('#samurdi_account').val(),
				"people_donation" : $('#people_donation').val(),
				"people_account" : $('#people_account').val(),
				"education_donation" : $('#education_donation').val(),
				"education_account" : $('#education_account').val(),
				"housenumber" : document.getElementById("result").innerHTML,

			};
			
			// get the form values
			// var name = $('#txtHomeNumber').val();

			var data1 = JSON.stringify(dataObj);

			// get the form values
			var name = $('#txtHomeNumber').val();

			$.ajax({
				type : "POST",
				url : "familydetail",
				data : "name=" + data1,
				success : function(response) {
					debugger;
					var x = response.split("@@@");
					homeNumber = x[0];
					var x = localStorage.clickcount;
					document.getElementById("familyid").innerHTML = homeNumber;

					var x1 = document.getElementById("personSubNumber");

					homeNumber.replace('[', '');
					var text = homeNumber.split(",");
					var option = document.createElement("option");
					$('#personSubNumber option').remove();
					for (i = 0; i < text.length; i++) {
						var option = document.createElement("option");
						if (i === 0) {
							text[i].replace('[', '');
							option.text = text[i].replace('[', '');

						} else if (i === text.length - 1) {
							text[i].replace(']', '');
							option.text = text[i].replace(']', '');
						} else {
							option.text = text[i];
						}

						x1.add(option);
					}

					$.gritter.add({
						// (string | mandatory) the heading of the notification
						title : 'සාමාජික පවුල් තොරතුරු!',
						// (string | mandatory) the text inside the notification
						text : 'සාමාජික පවුල් තොරතුරුසර්තකව ගබඩ කරන ලදි.',
						// (string | optional) the image to display on the left
						image : 'images/confirm.png'
					// (bool | optional) if you want it to fade out on its own or just sit there

					});
					
					 $('#homeSubNumber').val("");
					 $('#samurdi_donation').val("");
					$('#samurdi_account').val("");
					$('#people_donation').val("");
					$('#people_account').val("");
					 $('#education_donation').val("");
					$('#education_account').val("");

				},
				error : function(e) {
					alert('Error: ' + e);
				}
			});
		}

		function savepersondata() {
			debugger;

			
			var computerLiteracy = $("input[name='computerLiteracy']:checked")
					.val();
			var txtsex = $("input[name='txtsex']:checked").val();
			var householdertrue = $("input[name='householderstatus']:checked")
					.val();

			var iselectricity = $("input[name='electricity']:checked").val();
			localStorage.familyvalue = $('#homeSubNumber').val();

			debugger;
			var radioValue = $("input[name='electricity']:checked").val();
			var personData = {
				"txtfirstName" : $('#txtfirstName').val(),
				"personSubNumber" : $('#personSubNumber').val(),
				"txtIdNumber" : $('#txtIdNumber').val(),
				"txtTelephoneNumber" : $('#txtTelephoneNumber').val(),
				"txtGeneric" : $('#txtGeneric').val(),
				"txtBrithday" : $('#txtBrithday').val(),
				"txtsex" : txtsex,
				"txtSurname" : householdertrue,
				"txtPasspoertNumber" : $('#txtPasspoertNumber').val(),
				"txtEmail" : $('#txtEmail').val(),
				"txtReligion" : $('#txtReligion').val(),
				"txtBirthDistric" : $('#txtBirthDistric').val(),
				"txtMarage" : $('#txtMarage').val(),
				"txtJobcatagory" : $('#txtJobcatagory').val(),
				"txtBeforeDistric" : $('#txtBeforeDistric').val(),
				"txtHealth" : $('#txtHealth').val(),
				"txtJobName" : $('#txtJobName').val(),
				"txtReasonforLive" : $('#txtReasonforLive').val(),
				"txtEducationCatagory" : $('#txtEducationCatagory').val(),
				"txtSinhalaKnoledge" : $('#txtSinhalaKnoledge').val(),
				"txtEnglishKnoledge" : $('#txtEnglishKnoledge').val(),
				"computerLiteracy" : computerLiteracy,
				"txtTamilKnoledge" : $('#txtTamilKnoledge').val(),
				"housenumber" : document.getElementById("result").innerHTML,

			};
			// get the form values
			// var name = $('#txtHomeNumber').val();

			var data1 = JSON.stringify(personData);

			// get the form values

			$.ajax({
				type : "POST",
				url : "persondetail",
				data : "name=" + data1,
				success : function(response) {
					debugger;

					$.gritter.add({
						// (string | mandatory) the heading of the notification
						title : 'පුද්ගල තොරතුරු!',
						// (string | mandatory) the text inside the notification
						text : 'පුද්ගල තොරතුරු සර්තකව ගබඩ කරන ලදි..',
						// (string | optional) the image to display on the left
						image : 'images/confirm.png'
					// (bool | optional) if you want it to fade out on its own or just sit there

					});
					
					$('#txtfirstName').val("");
					$('#txtTelephoneNumber').val("");
					$('#txtGeneric').val("-- තෝරන්න --");
					 $('#txtBrithday').val("");
					 $('#txtIdNumber').val("");
					$('#txtPasspoertNumber').val("");
					$('#txtEmail').val("");
					$('#txtReligion').val("-- තෝරන්න --");
					 $('#txtBirthDistric').val("-- තෝරන්න --");
					$('#txtMarage').val("-- තෝරන්න --");
					 $('#txtJobcatagory').val("-- තෝරන්න --");
					 $('#txtBeforeDistric').val("-- තෝරන්න --");
					$('#txtHealth').val("-- තෝරන්න --");
					$('#txtJobName').val("")
					$('#txtReasonforLive').val("");
					$('#txtEducationCatagory').val("-- තෝරන්න --");
					$('#txtSinhalaKnoledge').val("-- තෝරන්න --");
					$('#txtEnglishKnoledge').val("-- තෝරන්න --");
					 $('#txtTamilKnoledge').val("-- තෝරන්න --");

				},
				error : function(e) {
					alert('Error: ' + e);
				}
			});
		}

		$(document)
				.ready(
						function() {
							debugger;
							$(
									'.nav-tabs li:eq('
											+ Number(sessionStorage.clickcount)
											+ ') a').tab('show')

							if ($('.nav-tabs .active').text() === "නිවාස තොරතුරු") {
								tabCount = 0;
								sessionStorage.clickcount = 0;

							}

							if ($('.nav-tabs .active').text() === "සාමාජික පවුල් තොරතුරු") {
								tabCount = 1;
								sessionStorage.clickcount = 1;
							}
							if ($('.nav-tabs .active').text() === "පුද්ගල තොරතුරු") {
								tabCount = 2;
								sessionStorage.clickcount = 2;
							}

							$(".nav-tabs a")
									.click(
											function() {
												debugger;
												$(this).tab('show');
												if ($('.nav-tabs .active')
														.text() === "නිවාස තොරතුරු") {

													tabCount = 0;
													sessionStorage.clickcount = 0;
												}

												if ($('.nav-tabs .active')
														.text() === "සාමාජික පවුල් තොරතුරු") {

													tabCount = 1;
													sessionStorage.clickcount = 1;
												}
												if ($('.nav-tabs .active')
														.text() === "පුද්ගල තොරතුරු") {

													tabCount = 2;
													sessionStorage.clickcount = 2;
												}
												debugger;

											});

							$(".add-row")
									.click(
											function() {
												var name = $("#txtfirstName")
														.val();
												var email = $("#txtIdNumber")
														.val();
												var markup = "<tr><td><input type='checkbox' name='record'></td><td>"
														+ name
														+ "</td><td>"
														+ email + "</td></tr>";
												$("table tbody").append(markup);
											});

							$(".delete-row")
									.click(
											function() {
												$("table tbody")
														.find(
																'input[name="record"]')
														.each(
																function() {
																	if ($(this)
																			.is(
																					":checked")) {
																		$(this)
																				.parents(
																						"tr")
																				.remove();
																	}
																});
											});

						});
		
		function loadRoadName() {
			debugger;
			$.ajax({
				type : "POST",
				url : "getRoadNameList",
				success : function(response) {
					debugger;
					var x5 = response.meg;
					var x = response.split("@@@");
					//dataSet = x[0];
					var array = JSON.parse("[" + x[0] + "]");
					var text = array[0];
					var x1 = document.getElementById("txtRoad");
					var option = document.createElement("option");
					$('#txtRoad option').remove();
					
					for (i = 0; i < text.length; i++) {
						var option = document.createElement("option");
						
							option.text = text[i];
						

						x1.add(option);
					}
					
					
				},
				error : function(e) {
					alert('Error: ' + e);
				}
			});
		}
		$(document).ready(function() {
			loadRoadName();
		});
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

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row" style="padding-top: 30px;">
					<div class="col-lg-12">

						<ol class="breadcrumb">
							<li><i class="fa fa-user"></i> <a href="index.jsp">ගෘහ
									මුලික තොරතුරු</a></li>
							<li class="active"><i class="fa fa-edit"></i>තොරතුරු එකතු
								කිරීම</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<!-- Tab Start -->
				<div class="row">


					<div class="container col-lg-12" id="maindetails">


						<div id="persontable">

							<h2 style="color: #0664F0">ගෘහ මුලික තොරතුරු ගොනු කිරිම</h2>

							<ul class="nav nav-tabs"
								style="color: #779FDA; font-size: 15px; font-weight: bold;">
								<li class="active"><a href="#home">නිවාස තොරතුරු</a></li>
								<li><a href="#menu1">සාමාජික පවුල් තොරතුරු</a></li>
								<li><a href="#menu2">පුද්ගල තොරතුරු</a></li>
							</ul>

							<div class="tab-content">

								<!-- Start First Tab -->
								<div id="home" class="tab-pane fade in active"
									style="padding-top: 30px">
									<form action="">
										<!-- Start Left hand side -->

										<div class="col-lg-6">

											<h4>
												<b>සාමාන්‍ය තොරතුරු</b>
											</h4>
											<hr />

											<div class="form-group" style="padding-top: 5px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ගෘහමුලික
													අංකය </label>
												<div class="col-xs-7">
													<input type="text" class="form-control"
														name="txtHomeNumber" id="txtHomeNumber">
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">පාර /
													පටුමග </label>
												<div class="col-xs-7">
													<select name="txtRoad" id="txtRoad" class="form-control">
														<option>-- තෝරන්න --</option>
														<option>-- තෝරන්න 1 --</option>
													</select>
												</div>
											
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ලිපිනය</label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtAddress1"
														id="txtAddress1">
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;"></label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtAddress2"
														id="txtAddress2">
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;"></label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtAddress3"
														id="txtAddress3">
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;"></label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtAddress4"
														id="txtAddress4">
												</div>
											</div>

											<div class="form-group"
												style="padding-top: 30px; padding-bottom: 70px;">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">දුරකතන
													අංකය</label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtTelephone"
														id="txtTelephone">
												</div>
											</div>

											<h4>නිවසේ තත්වය</h4>
											<hr />
											<div class="form-group" style="padding-top: 5px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left; font-weight: normal;">වහල</label>
												<div class="col-xs-7">
													<select id="txtroof" class="form-control" name="txtroof">
														<option>-- තෝරන්න --</option>
														<option>උළු සෙවිලි</option>
														<option>ෂීට් සෙවිලි</option>
														<option>ටකරං සෙවිලි</option>
														<option>පොල් අතු සෙවිලි</option>
													</select>
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ගෙබිම</label>
												<div class="col-xs-7">
													<select id="txtfloor" class="form-control" name="txtfloor">
														<option>-- තෝරන්න --</option>
														<option>මැටි</option>
														<option>සිමෙන්ති</option>
														<option>ටයිල්</option>
														<option>ටෙරසෝ</option>
													</select>
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">බිත්ති</label>
												<div class="col-xs-7">
													<select id="txtwall" class="form-control" name="txtwall">
														<option>-- තෝරන්න --</option>
														<option>මැටි</option>
														<option>සිමෙන්ති</option>
													</select>
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ස්වභාවය</label>
												<div class="col-xs-7">
													<select id="txtflows" class="form-control" name="txtflows">
														<option>-- තෝරන්න --</option>
														<option>තනි මහල්</option>
														<option>දෙමහල්</option>
														<option>තෙමහල්</option>
														<option>සිව්මහල්</option>
													</select>
												</div>
											</div>




										</div>

										<!-- End Left Side -->

										<!-- Start Right Side -->
										<div class="col-lg-6">
											<h4>
												<b>ඉඩමේ තත්වය</b>
											</h4>
											<hr />

											<div class="form-group" style="padding-top: 5px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ඉඩම</label>
												<div class="col-xs-7">
													<select id="txtland" class="form-control" name="txtland">
														<option>-- තෝරන්න --</option>
														<option>අනවසර</option>
														<option>පුද්ගලික</option>
													</select>
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ඔප්පුව </label>
												<div class="col-xs-7">
													<select id="txtlandpaper" class="form-control"
														name="txtlandpaper">
														<option>-- තෝරන්න --</option>
														<option>ඇත</option>
														<option>නැත</option>
													</select>
												</div>
											</div>



											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ඔප්පු
													අංකය </label>
												<div class="col-xs-7">
													<input type="text" class="form-control"
														name="txtlandnumber" id="txtlandnumber">
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">පදිංචි
													වර්ශය </label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtlandyear"
														id="txtlandyear">
												</div>
											</div>

											<div class="form-group"
												style="padding-top: 30px; padding-bottom: 160px;">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ඉඩමේ
													ප්‍රමාණය (පර්චස්) </label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtarea"
														id="txtarea">
												</div>
											</div>


											<h4>
												<b>යටිතල පහසුකම්</b>
											</h4>
											<hr />

											<div class="form-group" style="padding-top: 5px;">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">නළ ජලය </label>
												<div class="col-xs-7">
													<label class="radio-inline" style="padding-right: 20px;">
														<input type="radio" name="water" id="txtwatertrue"
														value="ඇත" checked>ඇත
													</label> <label class="radio-inline"> <input type="radio"
														name="water" id="txtwaterfalse" value="නැත">නැත
													</label>
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px;">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">විදුලිය
												</label>
												<div class="col-xs-7">
													<label class="radio-inline" style="padding-right: 20px;">
														<input type="radio" name="electricity"
														id="txtelectricitytrue" value="ඇත" checked>ඇත
													</label> <label class="radio-inline"> <input type="radio"
														name="electricity" id="txtelectricityfalse" value="නැත">නැත
													</label>
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px;">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">සනීපාරක්ශක
													වැසිකිලි පහසුකම් </label>
												<div class="col-xs-7">
													<label class="radio-inline" style="padding-right: 20px;">
														<input type="radio" name="txttoiletstrue"
														id="txttoiletsstrue" value="ඇත" checked>ඇත
													</label> <label class="radio-inline"> <input type="radio"
														name="txttoiletstrue" id="txttoiletsfalse" value="නැත">නැත
													</label>
												</div>
											</div>



										</div>
										<!-- End Right Side -->


										<div class="form-group">
											<div class="col-xs-10 "
												style="padding-left: 20px; margin-top: 50px;">
												<input type="button" class="btn btn-primary"
													value="ඇතුල්
												කරන්න" onclick="doAjaxPost()">
												<button type="button" class="btn btn-primary">අවලංගු
													කරන්න</button>
											</div>
											<div class="col-xs-offset-2 col-xs-9 "
												style="padding-left: 0px"></div>

										</div>

									</form>
								</div>
								<!-- END First Tab -->
								<!-- ====================Start Third Tab============================================================================ -->





								<!-- Start Second Tab -->
								<div id="menu1" class="tab-pane fade" style="padding-top: 30px">

									<form action="familydetail" method="post">
										<!-- Start Left hand side -->

										<div class="col-lg-12">

											<h5>
												ගෘහමුලික අංකය :
												<div id="result"></div>
												අදාළ සාමාජික පවුල් තොරතුරු අතුලත් කරන්න
											</h5>
											<input type="hidden" name="homeNumber"
												value="<s:property value="txtHomeNumber" /> ">
											<h4>
												<b>මූලික තොරතුරු</b>
											</h4>
											<hr />
											<div class="col-lg-6">
												<div class="form-group" style="padding-top: 5px">
													<label for="inputEmail" class="control-label col-xs-6"
														style="font-size: 15px; text-align: left;">ගෘහමුලික
														උප අංකය</label>
													<div class="col-xs-6">
														<input type="text" class="form-control"
															name="homeSubNumber" id="homeSubNumber">
													</div>
												</div>

												<div class="form-group" style="padding-top: 30px">
													<label for="inputEmail" class="control-label col-xs-6"
														style="font-size: 15px; text-align: left;">මාසික
														ආදායම </label>
													<div class="col-xs-6">
														<select id="salararyDetail" class="form-control"
															name="salararyDetail">
															<option>-- තෝරන්න --</option>
															<option>5000 ට අඩු</option>
															<option>5000 – 10000 අතර</option>
															<option>10000 – 15000 අතර</option>
															<option>15000 – 20000 අතර</option>
															<option>20000 – 25000 අතර</option>
															<option>25000 ට වැඩි</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-6"></div>
										<div class="col-lg-12" style="padding-top: 30px;">




											<h4>
												<b>රජයන් ලබන ආධාර</b>
											</h4>
											<hr />
										</div>
										<div class="row">
											<div class="col-lg-4">

												<div style="padding-bottom: 30px;">
													<label class="col-xs-12"> <input
														class="form-check-input" type="checkbox"> &nbsp;
														&nbsp;සමෘධි ආධාර
													</label>
												</div>

												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ආධාර
													මුදල</label>
												<div class="col-xs-7">
													<input type="text" class="form-control"
														name="samurdi_donation" id="samurdi_donation">
												</div>

												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left; padding-top: 10px;">ගිණුම්
													අංකය</label>
												<div class="col-xs-7" style="padding-top: 10px;">
													<input type="text" class="form-control"
														name="samurdi_account" id="samurdi_account">
												</div>


											</div>

											<div class="col-lg-4">

												<div style="padding-bottom: 30px;">
													<label class="col-xs-12"> <input
														class="form-check-input" type="checkbox"> &nbsp;
														&nbsp; මහජන ආධාර
													</label>
												</div>

												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ආධාර
													මුදල</label>
												<div class="col-xs-7">
													<input type="text" class="form-control"
														name="people_donation" id="people_donation">
												</div>

												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left; padding-top: 10px;">ගිණුම්
													අංකය</label>
												<div class="col-xs-7" style="padding-top: 10px;">
													<input type="text" class="form-control"
														name="people_account" id="people_account">
												</div>


											</div>

											<div class="col-lg-4">

												<div style="padding-bottom: 30px;">
													<label class="col-xs-12"> <input
														class="form-check-input" type="checkbox"> &nbsp;
														&nbsp;ශිෂ්‍යාධාර
													</label>
												</div>

												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ආධාර
													මුදල</label>
												<div class="col-xs-7">
													<input type="text" class="form-control"
														name="education_donation" id="education_donation">
												</div>

												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left; padding-top: 10px;">ගිණුම්
													අංකය</label>
												<div class="col-xs-7" style="padding-top: 10px;">
													<input type="text" class="form-control"
														name="education_account" id="education_account">
												</div>


											</div>
										</div>




										<div class="form-group">
											<div class="col-xs-10 "
												style="padding-left: 20px; margin-top: 50px;">
												<input type="button" class="btn btn-primary"
													value="ඇතුල්
												කරන්න" onclick="familyPost()">
												<button type="button" class="btn btn-primary">අවලංගු
													කරන්න</button>
											</div>
											<div class="col-xs-offset-2 col-xs-9 "
												style="padding-left: 0px"></div>

										</div>

									</form>






								</div>
								<!-- End Second Tab -->





								<!-- ====================Start Third Tab 3============================================================================ -->
								<div id="menu2" class="tab-pane fade">
									<form action="persondetail" method="post">
										<!-- Left Hand Side Start -->
										<div class="col-xs-6">

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left; padding-bottom: 30px;">ගෘහමූලික
													උප අංකය </label>
												<div class="col-xs-7">

													<div id="familyid"></div>
													<select id="personSubNumber" class="form-control"
														name="personSubNumber">
														<s:iterator value="">
															<option><s:property /></option>
														</s:iterator>

													</select>
												</div>
											</div>
										</div>

										<div class="col-xs-6"></div>
										<div class="col-xs-12">
											<h4>පුද්ගල මූලික තොරතුරු</h4>
											<hr />
										</div>
										<div class="col-xs-6">

											<div class="form-group" style="padding-top: 5px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">සම්පුර්න
													නම</label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtfirstName"
														id="txtfirstName">
												</div>
											</div>


											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">හැදුනුම්පත්
													අංකය</label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtIdNumber"
														id="txtIdNumber">
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">දුරකතන
													අංකය</label>
												<div class="col-xs-7">
													<input type="text" class="form-control"
														name="txtTelephoneNumber" id="txtTelephoneNumber">
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ජන වර්ගය
												</label>
												<div class="col-xs-7">
													<select id="txtGeneric" class="form-control"
														name="txtGeneric">
														<option>-- තෝරන්න --</option>
														<option>සිංහල</option>
														<option>දමිළ</option>
														<option>මුස්ලිම්</option>
														<option>බර්ගර්</option>
														<option>මැලේ</option>
														<option>වෙනත්</option>
													</select>
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">උපන්
													දිනය</label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtBrithday"
														id="txtBrithday">
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px;">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ස්ත්‍රී
													/ පුරුෂ භාවය </label>
												<div class="col-xs-7">
													<label class="radio-inline" style="padding-right: 20px;">
														<input type="radio" name="txtsex" id="txtsex"
														value="ස්ත්‍රී" checked>ස්ත්‍රී
													</label> <label class="radio-inline"> <input type="radio"
														name="txtsex" id="txtsex" value="පුරුෂ">පුරුෂ
													</label>
												</div>
											</div>


										</div>
										<!-- Left Hand Side End -->


										<div class="col-xs-6">
											<!-- RIght Hand Side Start -->

											<div class="form-group" style="padding-top: 5px;" id="rates">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ගෘහමූලික</label>
												<div class="col-xs-7" id="rates">
													<label class="radio-inline" style="padding-right: 20px;">
														<input type="radio" name="householderstatus"
														id="householdertrue" value="ගෘහ මූලික" checked>ඔව්
													</label> <label class="radio-inline"> <input type="radio"
														name="householderstatus" id="householderfalse" value="නැත"
														checked>නැත
													</label>
												</div>
											</div>




											<div class="form-group" style="padding-top: 40px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">විදේශ
													ගමන් බලපත්‍ර අංකය</label>
												<div class="col-xs-7">
													<input type="text" class="form-control"
														name="txtPasspoertNumber" id="txtPasspoertNumber">
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ඊ-මේල්
													ලිපිනය</label>
												<div class="col-xs-7">
													<input type="text" class="form-control" name="txtEmail"
														id="txtEmail">
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">ආගම</label>
												<div class="col-xs-7">
													<select id="txtReligion" class="form-control"
														name="txtReligion">
														<option>-- තෝරන්න --</option>
														<option>බෞද්ධ</option>
														<option>කතෝලික</option>
														<option>ක්‍රිස්තියානි</option>
														<option>හින්දු</option>
														<option>ඉස්ලාම්</option>
													</select>
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">උපන්
													දිස්ත්‍රික්කය</label>
												<div class="col-xs-7">
													<select id="txtBirthDistric" class="form-control"
														name="txtBirthDistric">
														<option>-- තෝරන්න --</option>
														<option>ගම්පහ</option>
														<option>කොළඹ</option>
														<option>කළුතර</option>
													</select>
												</div>
											</div>

											<div class="form-group" style="padding-top: 30px">
												<label for="inputEmail" class="control-label col-xs-5"
													style="font-size: 15px; text-align: left;">විවාහක /
													අවිවාහක භාවය</label>
												<div class="col-xs-7">
													<select id="txtMarage" class="form-control"
														name="txtMarage">
														<option>-- තෝරන්න --</option>
														<option>විවාහක</option>
														<option>අවිවාහක</option>
														<option>දික්කසාද වූ</option>
														<option>වැන්දඹු</option>
													</select>
												</div>
											</div>

										</div>
										<!-- RIght Hand Side End -->

										<div class="control-label col-xs-12"
											style="padding-top: 30px;">
											<h4>වෙනත් තොරතුරු</h4>
											<hr />
											<!--වෙනත් තොරතුරු RIght Hand Side Start -->
											<div class="control-label col-xs-6">

												<div class="form-group" style="padding-top: 5px">
													<label for="inputEmail" class="control-label col-xs-5"
														style="font-size: 15px; text-align: left;">රැකියා
														අංශය</label>
													<div class="col-xs-7">
														<select id="txtJobcatagory" class="form-control"
															name="txtJobcatagory">
															<option>-- තෝරන්න --</option>
															<option>රාජ්‍ය අංශය</option>
															<option>අර්ධ රාජ්‍ය අංශය</option>
															<option>පෞද්ගලික අංශය</option>
															<option>විදේශ රැකියා</option>
															<option>රජයේ ආරක්ෂක අංශ</option>
															<option>ස්වයං රැකියා</option>
															<option>කෘෂි කාර්මික</option>
															<option>ධීවර</option>
															<option>සත්ව පාලන</option>
															<option>සේවා යෝජක</option>
															<option>විශ්‍රාමික</option>
															<option>රැකියා වියුක්ති</option>
														</select>
													</div>
												</div>

												<div class="form-group" style="padding-top: 30px">
													<label for="inputEmail" class="control-label col-xs-5"
														style="font-size: 15px; text-align: left;">පෙර
														සිටි දිස්ත්‍රික්කය</label>
													<div class="col-xs-7">
														<select id="txtBeforeDistric" class="form-control"
															name="txtBeforeDistric">
															<option>-- තෝරන්න --</option>
															<option>ගම්පහ</option>
															<option>කොළඹ</option>
															<option>කළුතර</option>
														</select>
													</div>
												</div>

												<div class="form-group" style="padding-top: 30px">
													<label for="inputEmail" class="control-label col-xs-5"
														style="font-size: 15px; text-align: left;">සෞඛ්‍ය
														තත්වය</label>
													<div class="col-xs-7">
														<select id="txtHealth" class="form-control"
															name="txtHealth">
															<option>-- තෝරන්න --</option>
															<option>සාමාන්‍ය</option>
															<option>ශ්‍රව්‍යාබාධිත</option>
															<option>දෘශ්‍යාබාධිත</option>
															<option>කථනාබාධිත</option>
															<option>මන්ද මානසික</option>
															<option>වෙනත්</option>
														</select>
													</div>
												</div>
											</div>
											<!--වෙනත් තොරතුරු RIght Hand Side End -->

											<!--වෙනත් තොරතුරු Left Hand Side Start -->
											<div class="control-label col-xs-6">

												<div class="form-group" style="padding-top: 5px">
													<label for="inputEmail" class="control-label col-xs-5"
														style="font-size: 15px; text-align: left;">රැකියාව</label>
													<div class="col-xs-7">
														<input type="text" class="form-control" name="txtJobName"
															id="txtJobName">
													</div>
												</div>
												<div class="form-group" style="padding-top: 30px">
													<label for="inputEmail" class="control-label col-xs-5"
														style="font-size: 15px; text-align: left;">පදිංචියට
														පැමිණීමට හේතුව</label>
													<div class="col-xs-7">
														<textarea class="form-control" rows="3"
															id="txtReasonforLive" name="txtReasonforLive"></textarea>
													</div>
												</div>



											</div>

											<!--වෙනත් තොරතුරු Left Hand Side End -->

										</div>

										<div class="control-label col-xs-12"
											style="padding-top: 30px;">
											<h4>අධ්‍යාපන තොරතුරු</h4>
											<hr />
											<!-- අධ්‍යාපන තොරතුරු Right Hand Side Start -->
											<div class="control-label col-xs-6">
												<div class="form-group" style="padding-top: 5px">
													<label for="inputEmail" class="control-label col-xs-5"
														style="font-size: 15px; text-align: left;">අධ්‍යාපන
														මට්‍ටම </label>
													<div class="col-xs-7">
														<select id="txtEducationCatagory" class="form-control"
															name="txtEducationCatagory">
															<option>-- තෝරන්න --</option>
															<option>පාසල් යාමට පෙර</option>
															<option>1 - 5 ශ්‍රේණිය දක්වා</option>
															<option>5 සිට සා/පෙළ දක්වා</option>
															<option>සමාන්‍ය පෙළ සමත්</option>
															<option>උසස් පෙළ දක්වා</option>
															<option>උසස් පෙළ සමත්</option>
															<option>උපාධි හා ඊට ඉහළ</option>
															<option>වෘත්තිය පුහුණුව ලත්</option>
															<option>කිසිදා පාසැල් නොගිය</option>
														</select>
													</div>
												</div>

												<div class="form-group" style="padding-top: 30px">
													<label for="inputEmail" class="control-label col-xs-5"
														style="font-size: 15px; text-align: left;">සිංහල
														භාශා දැනුම</label>
													<div class="col-xs-7">
														<select id="txtSinhalaKnoledge" class="form-control"
															name="txtSinhalaKnoledge">
															<option>-- තෝරන්න --</option>
															<option>ලිවීම හා කථනය</option>
															<option>ලිවීම පමණී</option>
															<option>කථනය පමණී</option>
															<option>නැත</option>
														</select>
													</div>
												</div>

												<div class="form-group" style="padding-top: 30px">
													<label for="inputEmail" class="control-label col-xs-5"
														style="font-size: 15px; text-align: left;">ඉංග්‍රීසි
														භාශා දැනුම</label>
													<div class="col-xs-7">
														<select id="txtEnglishKnoledge" class="form-control"
															name="txtEnglishKnoledge">
															<option>-- තෝරන්න --</option>
															<option>ලිවීම හා කථනය</option>
															<option>ලිවීම පමණී</option>
															<option>කථනය පමණී</option>
															<option>නැත</option>
														</select>
													</div>
												</div>

											</div>
											<!-- අධ්‍යාපන තොරතුරු Right Hand Side End -->

											<!--අධ්‍යාපන තොරතුරු Left Hand Side Start -->
											<div class="control-label col-xs-6">
												<div class="form-group" style="padding-top: 5px;">
													<label for="inputEmail" class="control-label col-xs-5"
														style="font-size: 15px; text-align: left;">පරිඝණක
														සාක්ෂරතාවය </label>
													<div class="col-xs-7">
														<label class="radio-inline" style="padding-right: 20px;">
															<input type="radio" name="computerLiteracy"
															id="computerLiteracy" value="ඇත" checked>ඇත
														</label> <label class="radio-inline"> <input type="radio"
															name="computerLiteracy" id="sex" value="නැත">නැත
														</label>
													</div>
												</div>

												<div class="form-group" style="padding-top: 30px">
													<label for="inputEmail" class="control-label col-xs-5"
														style="font-size: 15px; text-align: left;">දමිළ
														භාශා දැනුම</label>
													<div class="col-xs-7">
														<select id="txtTamilKnoledge" class="form-control"
															name="txtTamilKnoledge">
															<option>-- තෝරන්න --</option>
															<option>ලිවීම හා කථනය</option>
															<option>ලිවීම පමණී</option>
															<option>කථනය පමණී</option>
															<option>නැත</option>
														</select>
													</div>
												</div>

											</div>



											<!--අධ්‍යාපන තොරතුරු Left Hand Side End -->

											<div class="form-group">
												<div class="col-xs-10 "
													style="padding-left: 20px; margin-top: 50px;">
													<input type="button" class="btn btn-primary"
														value="ඇතුල්
												කරන්න"
														onclick="savepersondata()">
												
												</div>
												<div class="col-xs-offset-2 col-xs-9 "
													style="padding-left: 0px"></div>

											</div>


											<div></div>
										</div>


									</form>
									<div class="row"></div>

								</div>
								<!-- End Third Tab -->

								<div id="menu3" class="tab-pane fade">
									<h3>Menu 3</h3>
									<p>Eaque ipsa quae ab illo inventore veritatis et quasi
										architecto beatae vitae dicta sunt explicabo.</p>
								</div>

							</div>
						</div>
					</div>
					<div class="col-lg-6" style="padding-top: 50px;"></div>

				</div>
				<!-- /.row -->

			</div>
			<!-- /.container-fluid -->

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

