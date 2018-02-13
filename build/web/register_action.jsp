<%-- 
    Document   : register_action
    Created on : Apr 12, 2017, 2:23:08 PM
    Author     : ABC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

    <%
        String fname= request.getParameter("fname");
        String lname= request.getParameter("lname");
        String email= request.getParameter("email");
        String tempm= request.getParameter("mobile");
        double mobile= Double.parseDouble(tempm);
        String address= request.getParameter("address");
        String temppin= request.getParameter("pincode");
        double pincode= Double.parseDouble(temppin);
        String password= request.getParameter("password");
        
        
        try{
        Class.forName("com.mysql.jdbc.Driver");out.println("class found");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddb","root","");out.println("connection established");
        PreparedStatement st= con.prepareStatement("insert into customer(fname, lname, email, mobile, address, pincode, password)" +" values(?,?,?,?,?,?,?)");
               
        st.setString(1, fname);
        st.setString(2, lname);
        st.setString(3, email);
        st.setDouble(4, mobile);
        st.setString(5, address);
        st.setDouble(6, pincode);
        st.setString(7, password);
        
        out.println("statment create");
        st.executeUpdate();out.println("statmetn exicuted");

        out.println("Registered successfully");
        
        }

catch(Exception e)
{
        out.println("something went wrong");
} %>














<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>register action </h1>
    </body>
</html>
