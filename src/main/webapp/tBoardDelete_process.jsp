<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    int idx = Integer.parseInt(request.getParameter("idx"));
    String userPwd = request.getParameter("userPwd");
    String pwd = request.getParameter("pwd");

    if (pwd.equals(userPwd)) {

        String sql = "UPDATE t_board SET deleted_yn = 'Y' ";
        sql += "WHERE idx = ?";

        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idx);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            out.println("SQLException : " + e.getMessage());
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        response.sendRedirect("tBoardList.jsp");
    }
    else {
        out.println("비밀번호가 틀렸습니다.");
    }


%>