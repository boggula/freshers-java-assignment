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
<title>Purchase page</title>
</head>
<%//read attribute values
String itemsNo[]=request.getParameterValues("items");
String uname=request.getParameter("uname");
int cardNo=Integer.parseInt(request.getParameter("cardno"));
//create data base  connection
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","manager");
PreparedStatement ps1=con.prepareStatement("insert into card_details values(?,?,?,?) ");
PreparedStatement ps2=con.prepareStatement("select itemNo,itemName,price from item_table where itemName=?");
ResultSet rs1=null;
int res=0;
int itemsCount[];
session.setAttribute("siNo", itemsCount.length);
for(int i=0;i<=itemsNo.length;i++){
	ps2.setString(1, itemsNo[i]);
    rs1=ps2.executeQuery();
    while(rs1.next()){
    	ps1.setInt(1, cardNo);
    	ps1.setInt(2, rs1.getInt(1));
    	ps1.setString(3, rs1.getString(2));
    	ps1.setFloat(4, rs1.getFloat(3));
    	 res=ps1.executeUpdate();
    }
    itemsCount[i]=res;
}
%>
<body>

    <table>
        <tr>
           <td>CustomerName</td>
            <td><%=uname %></td>
         </tr>
         <tr>
         <td>CardNo</td>
         <td><%=cardNo %></td>
         </tr>
         <tr>
         <td>TotalSelectedItems</td>
         <td><%=itemsCount.length %></td>
         </tr>
         <tr>
         <td> <a href="items.jsp">WantToAddMoreItems</a></td>
         <td> <a href="generateBill.jsp">GetBill</a></td>
         </tr>
    </table>
   </body>
</html>