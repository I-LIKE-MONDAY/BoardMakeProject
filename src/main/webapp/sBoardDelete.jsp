<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>글 삭제</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#btn-back').on('click', function() {
                history.back();
            });

            $('#btn-delete').on('click', function () {
                let datas = {idx: ('#idx').val(), pwd: $('#pwd').val()};
                $.ajax({
                    url: "pwdCheck.jsp",
                    type: "post",
                    data: datas,
                    success: function (data) {
                        data = JSON.parse(data);

                        if (data.result == "success") {
                            const frm = $("#frm");
                            frm.submit();
                        }
                        else {
                            alert('비밀번호가 틀렸습니다.');
                        }
                    },
                    error: function () {
                        alert("통신 오류");
                    }
                });
            });
        });
    </script>
</head>
<body>

<%
    int idx = Integer.parseInt(request.getParameter("idx"));
%>

<%-- 헤더, 푸터 파일 가져와서 사용 --%>
<%@ include file="header.jsp"%>

<main class="container mt-5">
    <div class="row">
        <div class="col-sm-6 mx-auto">
            <form action="sBoardDelete_process.jsp" method="get" id="frm">
                <div class="my-3">
                    <label for="idx" class="form-label">삭제 비밀번호 : </label>
                    <input type="password" class="form-control" id="pwd" placeholder="삭제 비밀번호를 입력해주세요">
                </div>
                <div class="my-3 d-grid gap-2">
                    <input type="hidden" id="idx" name="idx" value="<%=idx%>">
                    <button type="button" class="btn btn-danger" id="btn-delete">삭제하기</button>
                    <button type="button" class="btn btn-secondary" id="btn-back">돌아가기</button>
                </div>
            </form>
        </div>
    </div>
</main>

<%@ include file="footer.jsp"%>
</body>
</html>
