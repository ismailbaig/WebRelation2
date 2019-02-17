<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DefaultPage1.aspx.cs" Inherits="WordsRelation.DefaultPage1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


      <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Lumino - Dashboard</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->








    <script src='select2/dist/js/jquery-3.2.1.min.js' type='text/javascript'></script>
    <script src='select2/dist/js/select2.min.js' type='text/javascript'></script>

    <link href='select2/dist/css/select2.min.css' rel='stylesheet' type='text/css'>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Dropdown -->
    <select id='selRelation' style='width: 200px;'>
        <option value='0'>-- Select User --</option>
        <option value='1'>Yogesh singh</option>
        <option value='2'>Sonarika Bhadoria</option>
        <option value='3'>Anil Singh</option>
        <option value='4'>Vishal Sahu</option>
        <option value='5'>Mayank Patidar</option>
        <option value='6'>Vijay Mourya</option>
        <option value='7'>Rakesh sahu</option>
    </select>

    <input type='button' value='Seleted option' id='but_read'>

    <br />
    <div id='result'></div>

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
</asp:Content>
