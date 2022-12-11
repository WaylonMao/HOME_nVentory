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
        <footer class="footer">
            <table class="main_table">
                <tr></tr>
                <tr></tr>
                <tr style="font-size: 12px">
                    <td>Author: Weilong Mao</td>
                    <td><svg aria-hidden="true" height="24" viewBox="0 0 16 16" version="1.1" width="24" data-view-component="true" class="octicon octicon-mark-github d-block mr-2 float-left">
                        <path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"></path>
                        </svg></td>
                    <td><a href="https://github.com/WaylonMao">https://github.com/WaylonMao</a></td>
                </tr>
            </table>
        </footer>
    </body>
</html>
