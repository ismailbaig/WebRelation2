<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="OldFiles.aspx.cs" Inherits="WordsRelation.OldFiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	



    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
			</div>
	
			<div class="clear"></div>
		</div>
		<div class="divider"></div>

		<ul class="nav menu">
			<li ><a href="DefaultPage.aspx"><em class="fa fa-dashboard">&nbsp;</em> New Relation</a></li>
			<li class="active"><a href="OldTopics.aspx"><em class="fa fa-calendar">&nbsp;</em> Old Files</a></li>
			
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
				<h1 class="page-header">Old Files List</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
			
				
				
				<div class="panel panel-default">
				
					<div class="panel-body">
						<div class="col-md-8">
							<form role="form">
								
			
					
						
						

                                 <!-- start project list -->
                                <table>
  <tr>
    <th>File Name</th>
    <th>Open File</th>
    <th>Export Concepts Relations</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td><a href="#">Open</a></td>
    <td><a href="#">Export</a></td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td><a href="#">Open</a></td>
    <td><a href="#">Export</a></td>
  </tr>
  <tr>
    <td>Ernst Handel</td>
    <td><a href="#">Open</a></td>
    <td><a href="#">Export</a></td>
  </tr>
  <tr>
    <td>Island Trading</td>
    <td><a href="#">Open</a></td>
    <td><a href="#">Export</a></td>
  </tr>
  <tr>
    <td>Laughing Bacchus Winecellars</td>
    <td><a href="#">Open</a></td>
    <td><a href="#">Export</a></td>
  </tr>
  <tr>
    <td>Magazzini Alimentari Riuniti</td>
    <td><a href="#">Open</a></td>
    <td><a href="#">Export</a></td>
  </tr>
</table>

            <%--   <asp:GridView ID="GridView1" runat="server">
                                     <Columns>
                                         <asp:BoundField HeaderText="ID" Visible="False"></asp:BoundField>
                                         <asp:BoundField HeaderText="Concept One"></asp:BoundField>
                                     </Columns>
                                 </asp:GridView>--%>




                    <!-- end project list -->

								</div>
							
							</form>
						</div>
					</div>
				</div><!-- /.panel-->
			</div><!-- /.col-->
		
		</div><!-- /.row -->





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




    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</asp:Content>
