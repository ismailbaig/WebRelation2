<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewTopics.aspx.cs" Inherits="WordsRelation.Home1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <style>
table, td, th {
  border: 1px solid black;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th {
  text-align: left;
}
</style>



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

            <asp:Label ID="lblTopicID"  runat="server" Text="Label"></asp:Label>

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
			<li><a href="OldTopics.aspx"><em class="fa fa-calendar">&nbsp;</em> Old Topics</a></li>
			<li><a href="ConceptSearch.aspx"><em class="fa fa-calendar">&nbsp;</em> Search</a></li>
			<li><a href="ConceptSearch.aspx"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
		</ul>
	</div><!--/.sidebar-->




    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">New Topic</li>
			</ol>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Make New Relation</h1>
			</div>
		</div>
				
		
		<div class="row">
			<div class="col-lg-12">
			
				
				
				<div class="panel panel-default">
				
					<div class="panel-body">
						<div class="col-md-8">
							<form role="form">
								
			<div class="form-group">
									<label>New Topic Name</label>
								
                                <%--<asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>--%>
                                <input type="text" id="topic" class="form-control" /><br />
                                <input  type='button' value='Save Topic' id='savetopic' class="btn btn-primary">
                                <input  type='button' value='Get Topic Details' id='getTopicDetails' class="btn btn-primary">
								</div>
								<div class="form-group">
									<label>File input</label>
							
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
               <asp:GridView ID="grdvConceptRelation" runat="server" AutoGenerateColumns="False">
            <Columns>
              <asp:BoundField DataField="CrID" HeaderText="Id" Visible="False"></asp:BoundField>
              
              <asp:BoundField DataField="ConceptOne" HeaderText="Concept One">
                  <HeaderStyle BackColor="#3498DB" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="150"></HeaderStyle>
                  
              </asp:BoundField>
              <asp:BoundField DataField="ConceptTwo" HeaderText="Concept Two">
                  <HeaderStyle BackColor="#3498DB" ForeColor="White" Height="30px"  HorizontalAlign="Center" VerticalAlign="Middle" Width="150"></HeaderStyle>
              </asp:BoundField>
              <asp:BoundField DataField="CoceptRelation" HeaderText="Relation Type">
                  <HeaderStyle BackColor="#3498DB" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="150"></HeaderStyle>
              </asp:BoundField>
             
              <asp:ButtonField Text="Edit" HeaderText="Modify">
                  <HeaderStyle BackColor="#3498DB" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Width="150"></HeaderStyle>
                  <ItemStyle ForeColor="#0066FF"></ItemStyle>
              </asp:ButtonField>

             
          </Columns>

     <alternatingrowstyle backcolor="PaleTurquoise"  
          forecolor="DarkBlue"
         />
    <RowStyle ForeColor="#4A3C8C" BackColor="#E7E7FF" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
      </asp:GridView>


                                	</form>
								</div>
								<div class="col-md-4">
							<div class="form-group">
									<label>Concept 1</label>
								
                               <%-- <asp:TextBox ID="txtConcept1" class="form-control" runat="server"></asp:TextBox>
							--%>	
                                <select class="form-control" id='selConceptOne' >
                                <option></option>
                                <option value="NEW">Add new type</option>
                                </select>

							</div>
								<div class="form-group">
									<label>Concept 2</label>
								
                                     <%--<asp:TextBox ID="txtConcept2" class="form-control" runat="server"></asp:TextBox>
							--%>
                                <select class="form-control" id='selConceptTwo' >
                                <option></option>
                                <option value="NEW">Add new type</option>
                                </select>
								</div>
									<div class="form-group">
										<label>Relation Type</label>
                                       <!-- Dropdown -->
    <select class="form-control" id='selRelation' >
        <option></option>
        <option value="NEW">Add new type</option>
        
    </select>

    

    <br />
    <div id='result'></div>


									
        </div>
							
<%--        <asp:Button class="btn btn-primary" ID="SaveConceptsRelation" runat="server" Text="Save" OnClick="SaveConceptsRelation_Click"/>--%>
            <input  type='button' value='SaveAll' id='saveAll' class="btn btn-primary">
        </div></div></div></div></div>


                      <table id="topicDetailsTable">
               
              </table>
    </div>           
        </div>
    </form>

<%--    <div class="row">
	 <div class="col-lg-12">
	  <div class="panel panel-default">
	   <div class="panel-body">
		<div class="col-md-8">
		 <form role="form">
          <div class="form-group">





            <div class="table table-bordered table-striped" id="topicDetailsTable">
             <tr>
                 <th style="visibility: hidden">topicId</th>
                 <th>Concept One</th>
                 <th>Concept Two</th>
                 <th>Relation Type</th>
                 <th>Action</th>
             </tr>
            </div>
          </div></form></div></div></div></div></div>--%>
</body>
</html>
<!-- Script -->
<script>
    $(document).ready(function(){
        //All on document ready fn's are in its corresponding js files
        //with self executing functions.

        $('#saveAll').click(function () {
            saveAllWR();
        });

        $('#savetopic').click(function () {
            saveTopic();
        });

        $('#getTopicDetails').click(function () {
            topicName = $('#topic').val();
            if (topicName !== null && topicName !== '') {
                getAllDetailsForTopic(topicName);
            } else {
                alert('Topic field cannot be empty!!');
            }
            
        });

        $('#EdittopicDettsId').click(function () {
            alert('test');
        });
        
        
        
    });
</script>
