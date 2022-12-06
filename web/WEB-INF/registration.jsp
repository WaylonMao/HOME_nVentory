<%-- Document : registration Created on : 30-Nov-2022, 8:47:26 AM Author : WL
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Registration Page</title>
        <style>
            <%@include file="/WEB-INF/style.css"%>
        </style>
    </head>
    <body>
        <h1>Registration</h1>
        <form method="post">
            <table class="main_table">
                <tr>
                    <th>Email:</th>            
                    <td><input type="email" name="email" value="${email}"></td></tr>
                <tr>
                    <th>First name</th>
                    <td><input type="text" name="firstName" value="${firstName}"></td></tr>
                </tr>
                <tr>
                    <th>Last name</th>
                    <td><input type="text" name="lastName" value="${lastName}"></td></tr>
                <tr>
                    <th>Password</th>
                    <td><input type="password" name="password" value="${password}"></td></tr>
                <tr>
                    <th>Confirm password</th>
                    <td><input type="password" name="confirmPassword" value="${confirmPassword}"></td>
                </tr>
            </table>
            <table class="main_table">
                <tr>
                    <td><input type="hidden" name="action" value="reg" ><input type="submit" value="Register" ></td>
                </tr>
            </table>    
        </form>
        <form action="login" method="get">
            <table class="main_table"><tr>
                    <td><input type="submit" value="Cancel"></td>
                </tr>
            </table>
        </form>
        <c:if test="${message!=null&&message!=''}"><table class="main_table"><tr><td>${message}</td></tr></table></c:if>
    </body>
</html>
