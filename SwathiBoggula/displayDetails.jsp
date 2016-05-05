<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.ResolveResult"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details page</title>
</head>
<%//read attribute values
//get system date and time
Date date=new Date();
long edTime=date.getTime();
int temsCount=Integer.parseInt(request.getParameter("siNo"));
String uname=request.getParameter("uname");
int cardNo=Integer.parseInt(request.getParameter("cardno"));
//create data base  connection
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","manager");

PreparedStatement ps1=con.prepareStatement("select  itemNo,ItemName,price from cardDetails_Table where cardNo=?");
PreparedStatement ps2=con.prepareStatement("alter table Customer_Details set endtime=?");
ps2.setLong(1, edTime);
ps1.setInt(1,cardNo);
ResultSet rs=ps1.executeQuery();
while(rs.next()){%>
<table>
     <tr>
        <th>CustomerName</th><th>CardNo</th><th>ItemNo</th><th>ItemName</th><th>Price</th>
      </tr>
       <tr>
           <td><%=uname%></td> 
           <td><%=cardNo %></td>
           <td><%=rs.getInt(1) %></td>
           <td><%=rs.getString(2) %></td>
           <td><%=rs.getFloat(3) %></td>  
        </tr>  
  </table>
  <%} %>
  <br>
  <b>GenerateTotalBill:<%=request.getParameter("totallBill") %></b>
  <%
    PrintWriter pw=response.getWriter();
  int res=ps2.executeUpdate();
  pw.println("Customer outed fron shop");
  
  %>

