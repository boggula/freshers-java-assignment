<%@page import="java.util.Calendar"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.Date"  %>
<%
   //generate randam number
   Random rd=new Random();
    int no=rd.nextInt(50);
    //reada form data
    String name=request.getParameter("tname");
    //get system date and time
   
    int stTime=Calendar.HOUR;
 %>

 <%
 
 session.setAttribute("uname", name);
 session.setAttribute("cardno",no);
Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","manager");
 PreparedStatement ps=con.prepareStatement("insert into Customer_Details values(?,?,?,?)");
 ps.setString(1, "name");
 ps.setInt(2, no);
 ps.setInt(3, stTime);
 ps.setInt(4, 0);
 PrintWriter pw=response.getWriter();
 pw.println("CustName:"+name);
 pw.println("CardNo:"+no);
 pw.println("stTime:"+stTime);
 
 int res=ps.executeUpdate();
 %>
 <br>
 Customername:<%=name %><br>
 CardNo:<%=no %>
 <a href="itemShop.jsp">DoShoping</a>
 
 

 