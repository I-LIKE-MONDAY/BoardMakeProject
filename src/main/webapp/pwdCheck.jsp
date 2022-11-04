<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ include file="sDbconn.jsp"%>

<%
  int idx = Integer.parseInt(request.getParameter("idx"));
  String pwd = request.getParameter("pwd");
  int count = 0;

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  // 해당 idx 값에 맞는 pwd가 들어가면 1이 반환되고, 다르면 0이 반환됨
  String query = "SELECT count(pwd) as cnt FROM s_board WHERE idx = ? AND pwd = ? ";

  try {
    conn = DriverManager.getConnection(url, uid, upw);
    pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, idx);
    pstmt.setString(2, pwd);
    rs = pstmt.executeQuery();

    if (rs.next()) {
      count = rs.getInt("cnt");
    }
  }
  catch (SQLException e) {
    out.println("SQLException : " + e.getMessage());
  }
  finally {
    if (rs != null) {
      rs.close();
    }
    if (pstmt != null) {
      pstmt.close();
    }
    if (conn != null) {
      conn.close();
    }
  }

  Map<String, String> map = new HashMap<>();
  Gson gson = new Gson();

  if (count == 1) {
    map.put("result", "success");
    map.put("value", "1");
  }
  else {
    map.put("result", "error");
    map.put("value", "0");
  }

  out.print(gson.toJson(map));
%>