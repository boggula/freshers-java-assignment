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
<title>Bill page</title>
</head>
<%//read attribute values
int temsCount=Integer.parseInt(request.getParameter("siNo"));
String uname=request.getParameter("uname");
int cardNo=Integer.parseInt(request.getParameter("cardno"));
//create data base  connection
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","manager");

PreparedStatement ps1=con.prepareStatement("select price from cardDetails_Table where cardNo=?");
ps1.setInt(1,cardNo);
float totalAmt=0.0f;
ResultSet rs=ps1.executeQuery();
while(rs.next())
totalAmt+=rs.getFloat(3);

request.setAttribute("totalBill", totalAmt);
%>
<jsp:forward page="displayDetails.jsp"/>
</head>

</html>