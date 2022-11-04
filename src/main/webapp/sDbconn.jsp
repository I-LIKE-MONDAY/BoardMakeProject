<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  String url = "jdbc:mysql://localhost:3306/javadb";
  String uid = "test1";
  String upw = "java505";

  Class.forName("com.mysql.cj.jdbc.Driver");
%>