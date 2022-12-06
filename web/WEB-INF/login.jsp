<%--    Document : login
        Created on : 19-Oct-2022, 10:30:08 PM
        Author : WL --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Login</title>
        <style>
            <%@include file="/WEB-INF/style.css"%>
        </style>
    </head>
    <body>
        <h1>Home Inventory</h1>
        <h2>Login</h2>
        <table class="main_table"><form method="post">
                <tr>
                    <td>User Email:</td>
                    <td><input type="text" name="email" value="${email}" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" value="" /></td>
                </tr>
                <tr>
                    <td><input type="hidden" name="action" value="login" /><input type="submit" value="Login" /></td></form>
                <td><form action="registration" method="post"><input type="submit" value="Sign Up" /></form></td>
        </tr>

    </table>
    <c:if test="${message!=null}">
        <p>${message}</p>
    </c:if>
</body>
</html>
