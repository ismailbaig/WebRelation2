﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WordsRelation.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src='select2/dist/js/jquery-3.2.1.min.js' type='text/javascript'></script>
    <script src='select2/dist/js/select2.min.js' type='text/javascript'></script>

    <link href='select2/dist/css/select2.min.css' rel='stylesheet' type='text/css'>
</head>
<body>
    <form id="form1" runat="server">
        <div>

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
        </div>
    </form>
</body>
</html>