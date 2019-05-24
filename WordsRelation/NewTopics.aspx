<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewTopics.aspx.cs" Inherits="WordsRelation.Home1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    table, td, th { border: 1px solid black;}
    .nr{ background-color: lightgreen;}
    table { border-collapse: collapse; width: 100%;}
    th { text-align: left;}
    .btnHide{visibility: hidden; }
    .btnShow{visibility : visible;}
</style>
   
	

<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>--%>

     <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src='select2/dist/js/jquery-3.2.1.min.js' type='text/javascript'></script>
    <script src='js/bootstrap.min.js' type='text/javascript'></script>
    <script src='select2/dist/js/select2.full.js' type='text/javascript'></script>

    <link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">

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
				<a class="navbar-brand" href="#"><span>Conceptual </span>Representation</a>
			</div>
		</div>
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
	</div>
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Topic</li>
			</ol>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Topic</h1>
			</div>
		</div>
				
		
		<div class="row">
			<div class="col-lg-12">
			
				
				
				<div class="panel panel-default">
				
					<div class="panel-body">
						<div class="col-md-8">
							<form role="form">
								
			<div class="form-group">
									<label>Topic Name</label>
								
                                <%--<asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>--%>
                               <%-- <asp:TextBox ID="topic" runat="server" class="form-control"></asp:TextBox>--%>
                                <input runat="server"  type="text" id="topic" class="form-control" /><br />
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

    <!-- Concept One Modal -->
    <div class="modal fade" id="newConceptOneId" tabindex="-1" role="dialog" aria-labelledby="newConceptOneLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="newConceptOneLabel">Add New Concept One</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="newC1Val" class="col-form-label">Enter New Value:</label>
                <input type="text" class="form-control" id="newC1Val">
              </div>
              <div class="form-group">
                <label for="newC1Type" class="col-form-label">Property Type:</label>
                <input type="text" class="form-control" id="newC1Type">
              </div>
              <div class="form-group">
                <label for="newC1Property" class="col-form-label">Property Description:</label>
                <input type="text" class="form-control" id="newC1Property">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="addNewC1()">Save New C1</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Concept Two Modal -->
    <div class="modal fade" id="newConceptTwoId" tabindex="-1" role="dialog" aria-labelledby="newConceptTwoLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="newConceptTwoLabel">Add New Concept Two</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="newC2Val" class="col-form-label">Enter New Value:</label>
                <input type="text" class="form-control" id="newC2Val">
              </div>
              <div class="form-group">
                <label for="newC2Type" class="col-form-label">Property type:</label>
                <input type="text" class="form-control" id="newC2Type">
              </div>
              <div class="form-group">
                <label for="newC2Property" class="col-form-label">Property Description:</label>
                <input type="text" class="form-control" id="newC2Property">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="addNewC2()">Save New C2</button>
          </div>
        </div>
      </div>
    </div>

    <!-- New Relation Type Modal -->
    <div class="modal fade" id="newRelationTypeId" tabindex="-1" role="dialog" aria-labelledby="newRelationTypeLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="newRelationTypeLabel">Add New Relationship Type</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="newRTVal" class="col-form-label">Enter New Value:</label>
                <input type="text" class="form-control" id="newRTVal">
              </div>
              <div class="form-group">
                <label for="newRTType" class="col-form-label">Property Type:</label>
                <input type="text" class="form-control" id="newRTType">
              </div>
              <div class="form-group">
                <label for="newRTProperty" class="col-form-label">Property Description:</label>
                <input type="text" class="form-control" id="newRTProperty">
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="addNewRT()">Save New RT</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteConfirmation_modal_id" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmation_modal_label" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Delete Confirmation!</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label class="col-form-label">Are you sure you want to Delete ?</label>
              </div>
              <div id="deleteConfirm_topicId" hidden="hidden"></div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="DeleteCancel()">No</button>
            <button type="button" class="btn btn-primary" onclick="Delete()">Yes</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Delete Confirmation modal -->
    <div class="modal fade" id="deleteConfirmationId" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="deleteConfirmationLabel">Delete Confirmation</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label class="col-form-label">Are you sure you want to delete?</label>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick = 'Delete(event)'>Yes</button>
            <button type="button" class="btn btn-primary" onclick = 'DeleteCancel()'>No</button>
          </div>
        </div>
      </div>
    </div>

    </form></div>
        <div class="col-md-4">
		 <div class="form-group">
		    <label>Concept 1</label>
			  <select class="form-control" id='selConceptOne' >
               <option></option>
               <%--<option value="NEW">Add new type</option>--%>
                </select></div>
                 <div>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newConceptOneId">
                        Add New Concept 1
                    </button>
                </div><br />
				<div class="form-group">
				<label>Concept 2</label>
                <select class="form-control" id='selConceptTwo' >
                <option></option>
                <%-- <option value="NEW">Add new type</option>--%>
                </select>
				</div>
                <div>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newConceptTwoId">
                        Add New Concept 2
                    </button>
                </div><br />
				<div class="form-group">
					<label>Relation Type</label>
                    <select class="form-control" id='selRelation' >
                    <option></option>
                    <%--<option value="NEW">Add new type</option>--%>
                </select>   
                <br />
                <div id='result'></div>					
                </div>
                <div>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newRelationTypeId">
                    Add New Relation Type
                </button>
                </div><br />
            <input  type='button' value='SaveAll' id='saveAll' class="btn btn-primary btnShow">
            <input  type='button' value='Search' id='searchTopicDetails' class="btn btn-primary">
            <input  type='button' value='Update' id='updateTopicDetails' 
                class="btn btn-primary btnHide">
            <input  type='button' value='Reset' id='btn-reset' 
                class="btn btn-primary">
        </div></div></div></div></div>

         <input  type='button' value='Neo4jQuery' id='Neo4jQueryId' class="btn btn-primary">
        <textarea placeholder="" id="PlaceHolder2"></textarea>
        <%-- <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>--%>
    <table id="topicDetailsTable"></table>

    </div></div>
    </form>

</body>
</html>

<script>
$(document).ready(function(){
    //All on document ready fn's are in its corresponding js files
    //with self executing functions.

    $('#saveAll').click(function () {
        saveAllWR(false, '0');
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

    $('#searchTopicDetails').click(function () {
        topicName = $('#topic').val();
        c1 = $('#selConceptOne').val();
        c2 = $('#selConceptTwo').val();
        rt = $('#selRelation').val();
        if (topicName !== null && topicName !== '') {
            searchDetailsForTopic(topicName, c1, c2, rt);
        } else {
            alert('Topic field cannot be empty!!');
        }
            
    });

    //Reset Select  
    $('#btn-reset').click(function () {
        resetTopicDetails();
    });

    //update CR
    $('#updateTopicDetails').click(function () {
        updateCR();
    });

    //Neo4J
    $('#Neo4jQueryId').click(function () {

        topicName = $('#topic').val();
        c1 = $('#selConceptOne').val();
        c2 = $('#selConceptTwo').val();
        rt = $('#selRelation').val();
        if (topicName !== null && topicName !== '') {
            getNeo4jQuery(topicName, c1, c2, rt);
        } else {
            alert('Topic field cannot be empty!!');
        }
            
    });

    querySt();

});
</script>
