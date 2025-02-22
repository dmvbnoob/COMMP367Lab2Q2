<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>COMP367 Lab 2 Question 2</title>
</head>
<body>
    <%
        java.util.Calendar calendar = java.util.Calendar.getInstance();
        int hour = calendar.get(java.util.Calendar.HOUR_OF_DAY);
        String greeting = (hour < 12) ? "Good morning" : "Good afternoon";
    %>
    <h1><%= greeting %>, Donna, Welcome to COMP367</h1>
</body>
</html>
