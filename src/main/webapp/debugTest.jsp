<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>디버그 테스트</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>


<div class="container mt-5">
    <div class="row">
        <div class="col-6 mx-auto">
            <form action="debugTest_process.jsp" method="get">
                <div class="my-3">
                    <label for="num1" class="form-label">첫번째 숫자 : </label>
                    <input type="text" class="form-control" id="num1" name="number1" value="">
                </div>
                <div class="my-3">
                    <label for="num2" class="form-label">두번째 숫자 : </label>
                    <input type="text" class="form-control" id="num2" name="number2" value="">
                </div>
                <hr>
                <div class="d-grid gap-3">
                    <button class="btn btn-primary" type="submit">계산</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
