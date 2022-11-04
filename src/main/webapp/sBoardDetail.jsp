<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>상세 페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function () {
           $('#btn-back').on('click', function () {
            history.back();
           });
        });
    </script>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
//    int idx = Integer.parseInt(request.getParameter("idx"));
    int idx = Integer.parseInt(request.getParameter("idx"));
    String title = "";
    String contents = "";
    String userId = "";
    int hitCnt = 0;
    String createDt = "";
    String updateDt = "";

%>

<%@ include file="sDbconn.jsp"%>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    String query = "SELECT idx, title, contents, user_id, create_dt, update_dt, hit_cnt FROM s_board ";
    query += "WHERE deleted_yn = 'N' ORDER By idx DESC ";

    try {
        conn = DriverManager.getConnection(url, uid, upw);
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);

        if (rs.next()) {
            idx = rs.getInt("idx");
            title = rs.getString("title");
            contents = rs.getString("contents");
            userId = rs.getString("user_id");
            createDt = rs.getString("create_dt");
            updateDt = rs.getString("update_dt");
            hitCnt = rs.getInt("hit_cnt");

        }
    }
    catch (SQLException e) {
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>

<%-- 헤더, 푸터 파일 가져와서 사용 --%>
<%@ include file="header.jsp"%>

<main class="container mt-5">
    <div class="row">
        <div class="col-sm">
            <%--  제목  --%>
            <div class="row my-3">
                <div class="col-sm">
                    <label for="title" class="form-label">제목 : </label>
                    <input type="text" class="form-control" id="title" name="title" value="<%=title%>">
                </div>
            </div>

            <div class="row my-3">

                <%--  아이디  --%>
                <div class="col-sm">
                    <label for="user-id" class="form-label">아이디 : </label>
                    <input type="text" class="form-control text-end" id="user-id" name="userId" value="<%=userId%>">
                </div>

                <%--  조회수  --%>
                <div class="col-sm">
                    <label for="hit-cnt" class="form-label">조회수 : </label>
                    <input type="text" class="form-control text-end" id="hit-cnt" name="hitCnt" value="<%=hitCnt%>">
                </div>

                <%--   등록 날짜  --%>
                <div class="col-sm">
                    <label for="create-dt" class="form-label">등록 날짜 : </label>
                    <input type="text" class="form-control text-end" id="create-dt" name="createDt" value="<%=createDt%>">
                </div>
            </div>

            <div class="row my-3">
                <%--  글 내용  --%>
                <div class="col-sm">
                    <label for="contents" class="form-label">글 내용 : </label>
                    <textarea class="form-control" name="contents" id="contents" rows="10"><%=contents%></textarea>
                </div>
            </div>

            <div class="row my-3">
                <div class="col-sm">
<%--                    버튼 태그 설정시 타입을 지정하지 않으면 기본값인 submit으로 들어감. 타입 지정은 꼭 해주기! --%>
                    <button class="btn btn-secondary" type="button" id="btn-back">목록으로</button>
                </div>
                <div class="col-sm d-flex justify-content-end">
                    <a href="sBoardUpdate.jsp?idx=<%=idx%>" class="btn btn-warning me-2" id="btn-update">수정하기</a>
                    <a href="sBoardDelete.jsp?idx=<%=idx%>" class="btn btn-danger" id="btn-delete">삭제하기</a>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp"%>
</body>
</html>
