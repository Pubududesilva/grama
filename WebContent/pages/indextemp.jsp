<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.4/css/buttons.dataTables.min.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>මහා පමුනුගම ග්‍රාමසේවා වසම </title>
<link rel="shortcut icon" href="images/government.png" />
<link rel="icon" type="image/gif/png" href="images/government.png">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">

	
	function familyPost() {
		debugger;
		$.ajax({
			type : "POST",
			url : "loadPersonDetails",
			success : function(response) {
				debugger;
				var x5 =response.meg;
				var x = response.split("@@@");
				//dataSet = x[0];
				var array = JSON.parse("[" + x[0] + "]");

				dataSet = array[0];

				savepersondata();
				//table.column( 0 ).visible( true );
				//table.column( 1 ).visible( true );
				
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});

	}
	
	function savepersondata() {
		debugger;
		table = $('#example').DataTable({
			data : dataSet,
			 "aoColumns": [	
				 {
		                "bSortable": true,
		                "bSearchable": true,
		                "sWidth": '5%'
		            },
		            
				 {
		                "bSortable": true,
		                "bSearchable": true,
		                "sWidth": '40%'
		            },
		   		 {
		                "bSortable": true,
		                "bSearchable": true,
		                "sWidth": '15%'
		            },
				 {
		                "bSortable": true,
		                "bSearchable": true,
		                "sWidth": '10%'
		            },		            
		            {
		                "bSortable": true,
		                "bSearchable": true,
		                "sWidth": '10%'
		            },
		            {
		                "bSortable": true,
		                "bSearchable": true,
		                "sWidth": '10%'
		            },
		            {
		              "bSortable": true,
		              "bSearchable": true,
		              "sWidth": '10%'
		            },
			            {
			                "mData": 'priority',
			                "bSortable": false,
			                "bSearchable": false,
			                "sClass": "",
			                "sWidth": '5%',
			                "mRender": function (data, type, full) {
			                    return renderTableOptionButtons(full);
			                }
			            }
		        ],
		        "aaSorting": [[0,'asc']],
		        "aLengthMenu": [10, 25, 50, 100],
		        "iDisplayLength":10,
		        "bAutoWidth": false,
		        "bStateSave": true,
		        "bDestroy": true,
		        dom: 'Bfrtip',
		        buttons: [
		            'copy', 'excel', 'print'
		        ],
		        "fnDrawCallback" : function () {
		            (this).width("100%");
		        },
		        "fnCreatedRow":function( nRow, aData, iDataIndex ) {
		          //  moveUpProperty(nRow,aData,iDataIndex);
		        	viewProperty(nRow,aData,iDataIndex);
		        }
		        
		        
		});

	}


	
	 var viewProperty = function(nRow,aData,iDataIndex){
	    	debugger;
	        $(nRow).find("#view_type_btn").on('click', function(e) {
	            e.preventDefault();
	            debugger;
	            
	            currentpropertyType = aData[3];
	    	    $.ajax({
	    	        type: "POST",
	    	        url: "getPersonDetailsByID",
	    	        data: "name=" + currentpropertyType,
	    	        success: function(response){
	    	        	debugger;
	    	  
	    	            // we have the response
	    	        	var y = response.split("@@@");
	            		 
	  
	            		debugger;
	            		var array = JSON.parse("[" + y[0] + "]");
	            		
	            		var s = array[0];
	            		

	/*     				var arrayLength = array[0].length;
	    				for (var i = 0; i < arrayLength; i++) {
	    				    var val = dataSet[i];
	    				    $('#txtHomeNumber').val(dataSet[0]); 
	    				    //Do something
	    				} */
	            
	    				var persondetail =  s[0];
	    	            $('#txtfirstName').val(persondetail[2]); 
	    	            $('#txtInitial').val(persondetail[3]); 
	    	            $('#txtIdNumber').val(persondetail[4]); 
	    	            $('#txtTelephoneNumber').val(persondetail[5]); 
	    	            
	           		 $('#txtGeneric option').map(function() {
	        			    if ($(this).text() == persondetail[6]) return this;
	        			}).attr('selected', 'selected');
	           		  
	    	            $('#txtBrithday').val(persondetail[7]);  
	    	            
	    	            
	    	            if(persondetail[8] == "පුරුෂ"){
	    	            	$("#male").prop("checked", true)
	    	            }
	    	            else{
	    	            	$("#female").prop("checked", true)
	    	            }
	    	            
	    	            if(persondetail[9] == "ඔව්"){
	    	            	$("#homeleadtrue").prop("checked", true)
	    	            }
	    	            else{
	    	            	$("#homeleadfalse").prop("checked", true)
	    	            }
	    	            
	    	            $('#txtSurname').val(persondetail[9]); 
	    	            $('#txtnameByLetter').val(persondetail[10]); 
	    	            $('#txtPasspoertNumber').val(persondetail[11]); 
	    	            $('#txtEmail').val(persondetail[12]);
	    	            
		           		 $('#txtReligion option').map(function() {
		        			    if ($(this).text() == persondetail[13]) return this;
		        			}).attr('selected', 'selected');
		           		 
		           		 $('#txtBirthDistric option').map(function() {
		        			    if ($(this).text() == persondetail[14]) return this;
		        			}).attr('selected', 'selected');
		           		 
		           		 $('#txtMarage option').map(function() {
		        			    if ($(this).text() == persondetail[15]) return this;
		        			}).attr('selected', 'selected');
		           		 
		           		 $('#txtJobcatagory option').map(function() {
		        			    if ($(this).text() == persondetail[16]) return this;
		        			}).attr('selected', 'selected');
		           		 
		           		 $('#txtBeforeDistric option').map(function() {
		        			    if ($(this).text() == persondetail[17]) return this;
		        			}).attr('selected', 'selected');
		           		 
		           		 $('#txtHealth option').map(function() {
		        			    if ($(this).text() == persondetail[18]) return this;
		        			}).attr('selected', 'selected');
		           		 
		        
	    	            $('#txtJobName').val(persondetail[19]); 
	    	            $('#txtReasonforLive').val(persondetail[20]); 
		           		 
		           		 $('#txtEducationCatagory option').map(function() {
		        			    if ($(this).text() == persondetail[21]) return this;
		        			}).attr('selected', 'selected');
		           		 
		           		 $('#txtSinhalaKnoledge option').map(function() {
		        			    if ($(this).text() == persondetail[22]) return this;
		        			}).attr('selected', 'selected');
		           		 
		           		 $('#txtEnglishKnoledge option').map(function() {
		        			    if ($(this).text() == persondetail[23]) return this;
		        			}).attr('selected', 'selected');

 
		           	   if(persondetail[24] == "ඇත"){
	    	            	$("#computerLiteracytrue").prop("checked", true)
	    	            }
	    	            else{
	    	            	$("#computerLiteracyfalse").prop("checked", true)
	    	            }
		           		 
		           		 $('#txtTamilKnoledge option').map(function() {
		        			    if ($(this).text() == persondetail[25]) return this;
		        			}).attr('selected', 'selected');



	    	            
	    	            
	    	        },
	    	        error: function(e){
	    	            alert('Error: ' + e);
	    	        }
	    	    });
	            

	            
	            
	  
	            


	            
	        });
	    };
	
	   var renderTableOptionButtons = function(full){
		   debugger;
	        var buttons = $('#type_action_buttons');
	        return buttons.html();
	    };
    
    </script>

</head>

<body>

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
			<a class="navbar-brand" href="index.html"><img alt="Ja - ele"
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
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">ප්‍රධාන පුවරුව</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">26</div>
									<div>New Comments!</div>
								</div>
							</div>
						</div>

						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-tasks fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">12</div>
									<div>New Tasks!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-shopping-cart fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">124</div>
									<div>New Orders!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-support fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">13</div>
									<div>Support Tickets!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel-footer">
								<span class="pull-left">View Details</span> <span
									class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div id="myDIV">

					<h2 style="color: #0664F0">පුද්ගල තොරතුරු ගොනුව</h2>
					<table id="example" class="display" width="100%">
						<thead>
							<tr>

								<th class="col-lg-2 col-sm-12 col-xs-12">ගෘහමුලික අංකය</th>
								<th class="col-lg-2 col-sm-12 col-xs-12">නම</th>
								<th class="col-lg-2 col-sm-12 col-xs-12">පාර / පටුමග</th>
								<th class="col-lg-2 col-sm-12 col-xs-12">හැදුනුම්පත් අංකය</th>
								<th class="col-lg-2 col-sm-12 col-xs-12">ස්ත්‍රී / පුරුෂ</th>
								<th class="col-lg-2 col-sm-12 col-xs-12">ජන වර්ගය</th>
								<th class="col-lg-2 col-sm-12 col-xs-12">ආගම</th>
								<th class="col-lg-2 col-sm-12 col-xs-12"></th>
							</tr>
						</thead>
						<tbody>
						</tbody>

					</table>

				</div>
			</div>
			<div class="row" style="padding-top: 5px;pad"  ></div>

			<div id="MyModal"
				class="modal fade col-lg-12 col-md-12 col-sm-12 col-xs-12"
				role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="blue smaller">
								<i class="icon-envelope light-green bigger-160"></i>පුද්ගල මූලික
								තොරතුර
							</h4>
						</div>
						<div class="modal-body">
							<div id="add-property-model">
								<!-- Add property type modal -->
								<div class="row">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-small"></div>
									</div>
								</div>
								<!!Plus sign and hedder  -->
								<div class="row">
									<div class="space-8"></div>
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

										<div class="form-group" style="padding-top: 5px">
											<label for="inputEmail" class="control-label col-xs-5"
												style="font-size: 15px; text-align: left;">සම්පුර්න නම</label>
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
												style="font-size: 15px; text-align: left;">උපන් දිනය</label>
											<div class="col-xs-7">
												<input type="text" class="form-control" name="txtBrithday"
													id="txtBrithday">
											</div>
										</div>

										<div class="form-group" style="padding-top: 30px;" id="rates">
											<label for="inputEmail" class="control-label col-xs-5"
												style="font-size: 15px; text-align: left;">ස්ත්‍රී /
												පුරුෂ භාවය </label>
											<div class="col-xs-7" id="rates">
												<label class="radio-inline" style="padding-right: 20px;">
													<input type="radio" name="txtsex" id="femail"
													value="femail" checked>ස්ත්‍රී
												</label> <label class="radio-inline"> <input type="radio"
													name="txtsex" id="male" value="mail">පුරුෂ
												</label>
											</div>
										</div>



									</div>

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">


										<div class="form-group" style="padding-top: 30px;" id="rates">
											<label for="inputEmail" class="control-label col-xs-5"
												style="font-size: 15px; text-align: left;">ගෘහමූලික </label>
											<div class="col-xs-7" id="rates">
												<label class="radio-inline" style="padding-right: 20px;">
													<input type="radio" name="homelead" id="homeleadtrue"
													value="ඔව්" checked>ඔව්
												</label> <label class="radio-inline"> <input type="radio"
													name="homelead" id="homeleadfalse" value="නැත">නැත
												</label>
											</div>
										</div>

										<div class="form-group" style="padding-top: 30px">
											<label for="inputEmail" class="control-label col-xs-5"
												style="font-size: 15px; text-align: left;">මුලකුරු
												මගින් කියැවෙන නම</label>
											<div class="col-xs-7">
												<input type="text" class="form-control"
													name="txtnameByLetter" id="txtnameByLetter">
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
												<select id="txtMarage" class="form-control" name="txtMarage">
													<option>-- තෝරන්න --</option>
													<option>විවාහක</option>
													<option>අවිවාහක</option>
													<option>දික්කසාද වූ</option>
													<option>වැන්දඹු</option>
												</select>
											</div>
										</div>


										<div class="form-group" style="padding-top: 30px">
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
												style="font-size: 15px; text-align: left;">පෙර සිටි
												දිස්ත්‍රික්කය</label>
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
												<select id="txtHealth" class="form-control" name="txtHealth">
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

										<div class="form-group" style="padding-top: 30px">
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

										<div class="form-group" style="padding-top: 50px">
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
												<select id="txtSinhalaKnoledge" class="form-control" name="txtSinhalaKnoledge">
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
												<select id="txtEnglishKnoledge" class="form-control" name="txtEnglishKnoledge">
													<option>-- තෝරන්න --</option>
													<option>ලිවීම හා කථනය</option>
													<option>ලිවීම පමණී</option>
													<option>කථනය පමණී</option>
													<option>නැත</option>
												</select>
											</div>
										</div>

<div class="form-group" style="padding-top: 30px;">
											<label for="inputEmail" class="control-label col-xs-5"
												style="font-size: 15px; text-align: left;">පරිඝණක
												සාක්ෂරතාවය </label>
											<div class="col-xs-7">
												<label class="radio-inline" style="padding-right: 20px;">
													<input type="radio" name="computerLiteracy" id="computerLiteracytrue"
													value="option1" checked>ඇත
												</label> <label class="radio-inline"> <input type="radio"
													name="computerLiteracy" id="computerLiteracyfalse" value="false">නැත
												</label>
											</div>
										</div>
										
																				<div class="form-group" style="padding-top: 30px">
											<label for="inputEmail" class="control-label col-xs-5"
												style="font-size: 15px; text-align: left;">දමිළ භාශා
												දැනුම</label>
											<div class="col-xs-7">
												<select id="txtTamilKnoledge" class="form-control" name="txtTamilKnoledge">
													<option>-- තෝරන්න --</option>
													<option>ලිවීම හා කථනය</option>
													<option>ලිවීම පමණී</option>
													<option>කථනය පමණී</option>
													<option>නැත</option>
												</select>
											</div>
										</div>





									</div>

									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>

								</div>






							</div>
						</div>
					</div>
					<!! Close popup selection layer  -->



				</div>


			</div>
		</div>

	</div>
	<div class="hidden" id="type_action_buttons">
		<div class="action-buttons visible-lg pull-right tooltips btn_spaced">
			<a title="Inquire" data-toggle="modal" data-target="#MyModal"
				href="#" id="view_type_btn"><i class="fa fa-eye"
				aria-hidden="true"></i></a>
		</div>

	</div>


	<div id="add_setting_item_popup" class="hidden">
		<div id="add-property-model">
			<!-- Add property type modal -->
			<div class="row">
				<div class="widget-box transparent">
					<div class="widget-header widget-header-small">
						<h4 class="blue smaller">
							<i class="icon-envelope light-green bigger-160"></i>Email Details
						</h4>
					</div>
				</div>
			</div>
			<!!Plus sign and hedder  -->
			<div class="row">
				<div class="space-8"></div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<input type="hidden" name="settingItemId" id="settingItemId">
					<input type="hidden" name="priority" id="priority">
					<div class="row">
						<div class="form-group">
							<label
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 control-label no-padding-right"
								for="form-field-select-1"> Successfully Send Email</label>
							<textarea class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
								rows="5" id="txtASendEmailAddress" name="bankKeyword"></textarea>

						</div>
					</div>
					<div class="row">
						<div class="space-8"></div>
					</div>

					<div class="row">
						<div class="form-group">
							<label
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 control-label no-padding-right"
								for="form-field-select-1"> Email Address not found
								Accounts</label>
							<textarea class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
								rows="5" id="txtAEmptyEmailAddress" name="bankKeyword"></textarea>

						</div>
					</div>
					<div class="row">
						<div class="space-8"></div>
					</div>

					<div class="row">
						<div class="form-group">
							<label
								class="col-lg-12 col-md-12 col-sm-12 col-xs-12 control-label no-padding-right"
								for="form-field-select-1"> Nil Balance Account Name</label>
							<textarea class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
								rows="5" id="txtANillBalanceEmail" name="bankKeyword"></textarea>

						</div>
					</div>


				</div>
			</div>
		</div>
		<!! Close popup selection layer  -->
	</div>
	<!! Close Add property model -->
	<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->



<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

<script src="https://cdn.datatables.net/buttons/1.2.4/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.4/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.4/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.4/js/buttons.print.min.js"></script>
		
		<script >
$(document).ready(function() {
	
	familyPost();
	
	
} );

</script>

</body>

</html>
