<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvanceSearchPage.aspx.cs" Inherits="WordsRelation.AdvanceSearchPage" %>

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
			<li ><a href="NewTopics.aspx"><em class="fa fa-dashboard">&nbsp;</em> New Topic</a></li>
			<li><a href="AllOldTopics.aspx"><em class="fa fa-calendar">&nbsp;</em> All Topics</a></li>
            <li class="active"><a href="Search.aspx"><em class="fa fa-calendar">&nbsp;</em> Search</a></li>
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
				<li class="active">Neo4j</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Advance search & Neo4j Query</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
			
				
				
				<div class="panel panel-default">
				
					<div class="panel-body">
						<div class="col-md-8">









                            							<div class="col-md-8">
							<div class="form-group">
                                 <input runat="server"  type="text" id="topic" class="form-control" /><br />
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
                                         <%--<input runat="server"  type="text" id="topic" class="form-control" /><br />--%>
										<label>Relation Type</label>
                                       <!-- Dropdown -->
    <select class="form-control" id='selRelation' >
        <option></option>
        <option value="NEW">Add new type</option>
        
    </select>
    <br />
    <div id='result'></div>					
        </div>
            <%--<input  type='button' value='SaveAll' id='saveAll' class="btn btn-primary btnShow">--%>
            <input  type='button' value='Search' id='searchTopicDetails' class="btn btn-primary">
            <input  type='button' value='Update' id='updateTopicDetails' 
                class="btn btn-primary btnHide">
            <input  type='button' value='Reset' id='btn-reset' 
                class="btn btn-primary">
          <input  type='button' value='Neo4jQuery' id='Neo4jQueryId' class="btn btn-primary">
        </div>




                               
        <textarea placeholder="" id="PlaceHolder2" rows="4" cols="100"></textarea>
        <%-- <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>--%>
    <table id="topicDetailsTable"></table>





                                        <!-- end project list -->
                                	
								</div>
							
						
						</div>
					</div>
				</div>

            <!-- /.panel-->
			</div><!-- /.col-->
		
		</div><!-- /.row -->




        </div>
    </form>
</body>
</html>

<script>
    $(document).ready(function(){
        //All on document ready fn's are in its corresponding js files
        //with self executing functions.

        //$('#saveAll').click(function () {
        //    saveAllWR(false, '0');
        //});

        //$('#savetopic').click(function () {
        //    saveTopic();
        //});

        //$('#getTopicDetails').click(function () {
        //    topicName = $('#topic').val();
            
        //    if (topicName !== null && topicName !== '') {
        //        getAllDetailsForTopic(topicName);
        //    } else {
        //        alert('Topic field cannot be empty!!');
        //    }
            
        //});

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

        
        function querySt() {
            var url = window.location.href;
            KeysValues = url.split(/[\?&]+/);
            if (KeysValues.length > 1 && !!KeysValues[1]) {
                var topicNameFromUrl = KeysValues[1].split("=")[1];
                if (topicNameFromUrl) {
                    console.log(' topic name : ' + topicNameFromUrl);
                    $("#topic").val(topicNameFromUrl);
                } else {
                    console.log('no topic name');
                }
            }
            // console.log(KeysValues);
            //for (i = 0; i < KeysValues.length; i++) {
            //    KeyValue = KeysValues[i].split("=");
            //    console.log(keyValue);
            //    //if (KeyValue[0] == 'dfd') {
            //    //    console.log(KeyValue[1]);
            //    //}
            //}
        }


        //$('#EdittopicDettsId').click(function () {
        //    alert('test');
        //});

        
        
        
    });
</script>
