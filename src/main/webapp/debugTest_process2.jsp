<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");

    int num1 = Integer.parseInt(request.getParameter("num1"));
    int num2 = Integer.parseInt(request.getParameter("num2"));

    int result = num1 + num2;

    Gson gson = new Gson();
    JsonObject jobj = new JsonObject();

    jobj.addProperty("result", result);

    out.print(gson.toJson(jobj));
%>

