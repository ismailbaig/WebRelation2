<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldTopics.aspx.cs" Inherits="WordsRelation.OldTopics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

      <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
			<li class="active"><a href="OldTopics.aspx"><em class="fa fa-calendar">&nbsp;</em> Old Topics</a></li>
			<li><a href="ConceptSearch.aspx"><em class="fa fa-power-off">&nbsp;</em> Search</a></li>
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
						
					
                                


			
					 <!-- start project list -->
               <asp:GridView ID="grdvTopics" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grdvTopics_SelectedIndexChanged">
            <Columns>
              <asp:BoundField DataField="TopicID" HeaderText="Id" Visible="False"></asp:BoundField>
              
              <asp:BoundField DataField="TopicsName" HeaderText="Topics">
                  <HeaderStyle BackColor="#3498DB" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="150"></HeaderStyle>
                  
              </asp:BoundField>
          
                 <asp:HyperLinkField Text="View/Edit" HeaderText="View/Edit" DataNavigateUrlFields="TopicID" DataNavigateUrlFormatString="NewTopics.aspx?TopicID=(0)">
                         <HeaderStyle BackColor="#3498DB" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="150"></HeaderStyle>
                  <ItemStyle ForeColor="#0066FF"></ItemStyle>
                </asp:HyperLinkField>

            
            </Columns>

     <alternatingrowstyle backcolor="PaleTurquoise"  
          forecolor="DarkBlue"
         />
    <RowStyle ForeColor="#4A3C8C" BackColor="#E7E7FF" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
      </asp:GridView>
						
						
                            




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
