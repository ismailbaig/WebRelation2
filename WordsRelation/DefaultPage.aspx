﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DefaultPage.aspx.cs" Inherits="WordsRelation.DefaultPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	





<!-- CSS dropdown-->

  <script src='select2/dist/js/jquery-3.2.1.min.js' type='text/javascript'></script>
    <script src='select2/dist/js/select2.min.js' type='text/javascript'></script>

    <link href='select2/dist/css/select2.min.css' rel='stylesheet' type='text/css'>

    
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
			<li class="active"><a href="DefaultPage.aspx"><em class="fa fa-dashboard">&nbsp;</em> New Relation</a></li>
			<li><a href="OldFiles.aspx"><em class="fa fa-calendar">&nbsp;</em> Old Files</a></li>
			
			<li><a href="login.html"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
		</ul>
	</div><!--/.sidebar-->



    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">New Relation</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Make New Relation</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
			
				
				
				<div class="panel panel-default">
				
					<div class="panel-body">
						<div class="col-md-8">
							<form role="form">
								
			
								<div class="form-group">
									<label>File input</label>
									<%--<input type="file">--%>
                                    <asp:FileUpload ID="FileUploadContent" runat="server" />
							
                                    <br />
                                    <p>
                                     <asp:Button class="btn btn-primary" ID="btnUploadFile" runat="server"
                                         Text="Display" OnClick="btnUploadFile_Click"/>
                                    </p>
                                    <p>
                                        <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label>
                                    </p>
                                    <p>
                              
                                    </p>
								</div>
								<div class="form-group">
								
                                    <label>File View</label>
                                    <div>
                                     <asp:PlaceHolder ID="iframeDocViewer" runat="server"/>
                                    </div>
								</div>
						

                                 <!-- start project list -->


                    <!-- end project list -->

								</div>
								<div class="col-md-4">
							<div class="form-group">
									<label>Concept 1</label>
								
                                <asp:TextBox ID="txtConcept1" class="form-control" runat="server"></asp:TextBox>
								</div>
								<div class="form-group">
									<label>Concept 2</label>
								
                                     <asp:TextBox ID="txtConcept2" class="form-control" runat="server"></asp:TextBox>
								</div>
									<div class="form-group">
										<label>Relation Type</label>
                                       
									<%--<asp:TextBox Visible="false" runat="server" class="form-control" value="" id="tags1"></asp:TextBox>
                                 --%>       <%-- <input  class="form-control"  name="txtBox1" type="text" id="tags">--%>

									</div>
							
									<asp:Button class="btn btn-primary" ID="SaveConceptsRelation" runat="server" Text="Save" OnClick="SaveConceptsRelation_Click"/>
								</div>
							</form>
						</div>
					</div>
				</div><!-- /.panel-->
			</div><!-- /.col-->
		<%--	<div class="col-sm-12">
				<p class="back-link">Lumino Theme by <a href="https://www.medialoot.com">Medialoot</a></p>
			</div>--%>
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
