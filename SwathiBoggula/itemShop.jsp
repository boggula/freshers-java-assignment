<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.ResolveResult"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Items page</title>
</head>

<%//read attribute values
String uname=(String)pageContext.getAttribute("uname");
//int cardNo=Integer.parseInt(request.getParameter("cardno"));
PrintWriter pw=response.getWriter();
pw.println("CustName:"+uname);
//pw.println("CardNo:"+cardNo);
//create data base  connection
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","manager");
PreparedStatement ps=con.prepareStatement("select  itemname from item_table");
ResultSet rs=ps.executeQuery();
%>
<body>
<form action="purchase.jsp" >
<center><h1>Select Items</h1></center>
<select multiple="multiple" name="items">
        <%while(rs.next()){%>
	            <option value="<%=rs.getInt(1)%>"><%=rs.getInt(1) %></option>
         <%} %>  
</select>
<input type="text" value="addToCard"/>
</form>
</body>
</html>