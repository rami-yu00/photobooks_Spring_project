<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- Required meta tags --%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- Bootstrap CSS --%>
<link rel="stylesheet" href="resources/libs/vendor/bootstrap/css/bootstrap.min.css">
<%-- Font Awesome --%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
<%-- Custom CSS --%>
<link rel="stylesheet" href="resources/css/style.css">
<%-- jquery --%>
<script src="resources/libs/vendor/jquery/jquery.min.js"></script>
<%-- Bootstrap --%>
<script src="resources/libs/vendor/bootstrap/js/bootstrap.bundle.min.js" ></script>
<title>Photo Book · Home</title>
<link rel="icon" href="resources/img/logo_1.png">
</head>
<body>
<jsp:forward page="/post/list_main"></jsp:forward>
</body>
</html>

