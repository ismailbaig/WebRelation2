<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Neo4j.aspx.cs" Inherits="WordsRelation.Neo4j" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">

   <style>
    table, td, th { border: 1px solid black;}
    .nr{ background-color: lightgreen;}
    table { border-collapse: collapse; width: 100%;}
    th { text-align: left;}
    .btnHide{visibility: hidden; }
    .btnShow{visibility : visible;}
</style>


</head>
<body>
    <form id="form1" runat="server">
        <div>
           <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></button>
			<a class="navbar-brand" href="#"><span>Conceptual </span>Representation</a>
		
			</div>
		</div><!-- /.container-fluid -->
	</nav>





              	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
			</div>
	
			<div class="clear"></div>
		</div>
		<div class="divider"></div>

		<ul class="nav menu">
			<li class="active"><a href="NewTopics.aspx"><em class="fa fa-dashboard">&nbsp;</em> New Topic</a></li>
			<li><a href="AllOldTopics.aspx"><em class="fa fa-calendar">&nbsp;</em> All Topics</a></li>
            <li><a href="Search.aspx"><em class="fa fa-calendar">&nbsp;</em> Search</a></li>
			<%--<li><a href="ConceptSearch.aspx"><em class="fa fa-calendar">&nbsp;</em> Search</a></li>--%>
			<li><a href="login.html"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
		</ul>
	</div><!--/.sidebar-->


                    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Relation</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Neo4j Query</h1>
			</div>
		</div><!--/.row-->

                        	<div class="row">
			<div class="col-lg-12">
			
				
				
				<div class="panel panel-default">
				
					<div class="panel-body">
						<div class="col-md-8">





                            <textarea name="cypher" id="cypher" rows="4" cols="120" data-lang="cypher"  runat="server" class="code form-control" />


                            </div>
                          </div>
                      </div>
                  </div>

                 </div>













           
            
            <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/custom.js"></script>
	<script>
		window.onload = function () {
	var chart1 = document.getElementById("line-chart").getContext("2d");
	window.myLine = new Chart(chart1).Line(lineChartData, {
	responsive: true,
	scaleLineColor: "rgba(0,0,0,.2)",
	scaleGridLineColor: "rgba(0,0,0,.05)",
	scaleFontColor: "#c5c7cc"
	});
};
	</script>


          
        </div>
       
    </form>
</body>
</html>
