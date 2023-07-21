<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Page</title>

  <link rel="stylesheet" href="public/styles/adminPage.css" />
</head>

<body>
<%
ArrayList<String> arrayList = (ArrayList<String>) request.getAttribute("allId");
// Convert ArrayList to array
String[] jspArray = arrayList.toArray(new String[arrayList.size()]);

%>
  <div  id="mid-main">
    <label for="empid">Employee ID:</label>
     <div class="autocomplete" style="width:300px;">
    <input type="text" id="empid" name="empid" />
     </div>
    <button onclick='fetchData()'> Get Data</button>
  </div>  
    <br />
 	
 	<div id="nextContent"></div>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script  src="public/js/adminPage.js"></script>
   
<script>
   var jsArray = [<%= "\"" + String.join("\", \"", jspArray) + "\"" %>];
   console.log(jsArray);
   autocomplete(document.getElementById("empid"), jsArray);
</script>
	
    
</body>

</html>