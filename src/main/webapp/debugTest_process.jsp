<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%!
    // 함수 디버깅
    int sum(String num1, String num2) {
        int result = 0;

        int number1 = Integer.parseInt(num1);
        int number2 = Integer.parseInt(num2);
        result = number1 + number2;
        return result;
    }
%>
<%
  request.setCharacterEncoding("utf-8");

  String strNum1 = request.getParameter("number1");
  String strNum2 = request.getParameter("number2");

  int result = sum(strNum1, strNum2);
//  int num1 = Integer.parseInt(strNum1);
//  int num2 = Integer.parseInt(strNum2);

//  int result = num1 + num2;

  out.println("두 수의 합은 " + result);


%>
</body>
</html>
