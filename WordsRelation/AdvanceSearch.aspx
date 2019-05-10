<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvanceSearch.aspx.cs" Inherits="WordsRelation.AdvanceSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

           <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">

    <script src='select2/dist/js/jquery-3.2.1.min.js' type='text/javascript'></script>
    <%--<script src='select2/dist/js/select2.min.js' type='text/javascript'></script>--%>
    <script src='select2/dist/js/select2.full.js' type='text/javascript'></script>
    <%--<script src='https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.full.js'
        type="text/javascript"></script>--%>

    <link href='select2/dist/css/select2.min.css' rel='stylesheet' type='text/css'>
    <script src='js/WR-Relation.js' type='text/javascript'></script>
     <script src='js/WR-ConceptOne.js' type='text/javascript'></script>
    <script src='js/WR-ConceptTwo.js' type='text/javascript'></script>
    <script src='js/WR-SaveAll.js' type='text/javascript'></script>
    <script src='js/WR-Topics.js' type='text/javascript'></script>
    <script src='js/WR-TopicDetails.js' type='text/javascript'></script>
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
				<a class="navbar-brand" href="#"><span>Concepts</span>Relation</a>
		
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
				<h1 class="page-header">Old Files List</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
			
				
				
				<div class="panel panel-default">
				
					<div class="panel-body">
						<div class="col-md-8">














                                        <!-- end project list -->
                                	
								</div>
							
						
						</div>
					</div>
				</div><!-- /.panel-->
			</div><!-- /.col-->
		
		</div><!-- /.row -->

        </div>
    </form>
</body>
</html>
