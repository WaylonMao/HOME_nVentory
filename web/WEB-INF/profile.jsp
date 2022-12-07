<%-- 
    Document   : profile
    Created on : 6-Dec-2022, 9:14:45 PM
    Author     : WL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <style>
            <%@include file="/WEB-INF/style.css"%>
        </style>
    </head>
    <body>
        <h1>HOME nVentory</h1>
        <h3>Menu</h3>
        <ul>
            <li><a href="inventory">Back</a></li>    
        </ul>
        <h2>Profile for ${user.firstName} ${user.lastName}</h2>
        <div>
            <form method="post">
                <table class="side_table">
                    <tr>
                        <th>Email:</th>
                        <td>${user.email}</td>
                    </tr>
                    <tr>
                        <th>First Name:</th>
                        <td><input type="text" name="firstName" value="${user.firstName}" /></td>
                    </tr>
                    <tr>
                        <th>Last Name:</th>
                        <td><input type="text" name="lastName" value="${user.lastName}" /></td>
                    </tr>

                    <c:choose>
                        <c:when test="${changePassword == true}">
                            <tr>
                                <th>Password:</th>
                                <td><input type="password" name="password1" value="" /></td>
                            </tr>
                            <tr>
                                <th>Confirm Password:</th>
                                <td><input type="password" name="password2" value="" /></td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <th></th>
                                <td><a href="?changePassword=true">Change Password</a></td>                                
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    <tr>
                        <th><input type="hidden" name="action" value="update"/>
                            <input type="submit" value="Confirm"/></th>
                        <td></td>
                    </tr>
                </table>
            </form>
            <form method="post">
                <table class="main_table">
                    <tr>
                        <th>Deactivate Your Account</th>
                    </tr>
                    <tr>
                        <th><input type="hidden" name="action" value="deactivate"/>
                            <input type="submit" value="Deactive"/></th>
                    </tr>
                </table>
            </form>
            <form method="post">
                <table class="main_table">
                    <tr>
                        <th>${message}</th>
                    </tr>
                    <tr>
                        <td><c:if test="${deactivate}"><input type="hidden" name="action" value="doDeactivate"/><input type="submit" value="Comfirm"/></c:if></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>