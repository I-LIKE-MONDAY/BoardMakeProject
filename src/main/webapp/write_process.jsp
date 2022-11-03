<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp"%>



<%
  request.setCharacterEncoding("UTF-8");

  String title = request.getParameter("title");
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");
  String contents = request.getParameter("contents");

  PreparedStatement pstmt = null;

  try {
    String sql = "INSERT INTO t_board(title, contents, user_id, pwd, create_dt) ";
    sql += "VALUES (?, ?, ?, ?, now()) ";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, contents);
    pstmt.setString(3, userId);
    pstmt.setString(4, userPw);
    pstmt.executeUpdate();
  }
  catch (SQLException e) {
    out.println("SQLException : " + e.getMessage());
  }
  finally {
    if (pstmt != null) {
      pstmt.close();
    }
    if (conn != null) {
      conn.close();
    }
  }

  response.sendRedirect("tBoardList.jsp");
%>