<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // 현재 내가 열고 있는 파일 명 표시해주기 위해 getServletPath() 사용
  String fileName = request.getServletPath(); // <- /sBoardDetail.jsp
  fileName = fileName.substring(1); // 슬래쉬(/) 제거

  String sBoardTitle = "";

  switch (fileName) {
    case "sBoardList.jsp":
      sBoardTitle = "게시판 목록 페이지";
      break;

    case "sBoardDetail.jsp":
      sBoardTitle = "상세 글 확인 페이지";
      break;

    case "sBoardWrite.jsp":
      sBoardTitle = "글 등록 페이지";
      break;

    case "sBoardUpdate.jsp":
      sBoardTitle = "글 수정 페이지";
      break;

    case "sBoardDelete.jsp":
      sBoardTitle = "글 삭제 페이지";
      break;
  }
%>

<header class="container mt-3">
  <div class="p-5 mb-4 bg-light rounded-3">
    <div class="container-fluid py-4">
      <h1><%=sBoardTitle%></h1>
    </div>
  </div>
</header>