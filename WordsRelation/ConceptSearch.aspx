<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConceptSearch.aspx.cs" Inherits="WordsRelation.ConceptSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

      <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">




     <script src='select2/dist/js/jquery-3.2.1.min.js' type='text/javascript'></script>
    <script src='select2/dist/js/select2.min.js' type='text/javascript'></script>

    <link href='select2/dist/css/select2.min.css' rel='stylesheet' type='text/css'>
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
			<li ><a href="NewTopics.aspx"><em class="fa fa-dashboard">&nbsp;</em> New Topic</a></li>
			<li ><a href="OldTopics.aspx"><em class="fa fa-calendar">&nbsp;</em> Old Topics</a></li>
			<li class="active"><a href="ConceptSearch.aspx"><em class="fa fa-power-off">&nbsp;</em> Search</a></li>
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
				<h1 class="page-header">Search Concept Relations</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
			
				
				
				<div class="panel panel-default">
				
					<div class="panel-body">
						<div class="col-md-8">
							<form role="form">
								
			
					
						
						
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
                                       <!-- Dropdown -->
    <select class="form-control" id='selRelation' >
        <option value='0'>-- Select User --</option>
        <option value='1'>Yogesh singh</option>
        <option value='2'>Sonarika Bhadoria</option>
        <option value='3'>Anil Singh</option>
        <option value='4'>Vishal Sahu</option>
        <option value='5'>Mayank Patidar</option>
        <option value='6'>Vijay Mourya</option>
        <option value='7'>Rakesh sahu</option>
    </select>

    <input  type='button' value='Seleted option' id='but_read'>

    <br />
    <div id='result'></div>


                                        <asp:Button class="btn btn-primary" ID="SaveConceptsRelation" runat="server" Text="Search"/>
					
    <!-- Script -->
    <script>
        $(document).ready(function(){

            // Initialize select2
            $("#selRelation").select2();

            // Read selected option
            $('#but_read').click(function(){
                var username = $('#selRelation option:selected').text();
                var userid = $('#selRelation').val();

                $('#result').html("id : " + userid + ", name : " + username);
            });
        });
    </script>




                              </form>

								</div>
							
							
						</div>
					</div>
				</div>
			</div>
		
		</div>


        </div>
    </form>
</body>
</html>
