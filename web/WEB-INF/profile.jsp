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
        <title>Profile</title>
        <style>
            <%@include file="/WEB-INF/style.css"%>
        </style>
    </head>
    <body>
        <h1>HOME nVentory</h1>
        <c:if test="${disable==null}">
            <h3>Menu</h3>
            <ul>
                <c:if test="${user.role.roleId==1}">
                    <li><a class="a_menu" href="admin">Admin</a></li>
                    <li><a class="a_menu" href="inventory_search">Search</a></li>
                    <li><a class="a_menu" href="category">Category</a></li>
                    </c:if>
                <li><a class="a_menu" href="inventory">Inventory</a></li>
                <li><a class="a_menu" href="?action=logout">Logout</a></li>
            </ul>
            <h2>Profile for ${user.firstName} ${user.lastName}</h2>
        </c:if>
        <div><c:if test="${disable==null}">

                <table class="side_table">
                    <tr>
                        <th>Email:</th>
                        <td>${user.email}</td>
                    </tr>
                    <tr>
                        <th>First Name:</th>
                    <form method="post"><td><input type="text" name="firstName" value="${user.firstName}" /></td>
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
                                    <td><a class="a_green" href="?changePassword=true">Change Password</a></td>                                
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        <tr>
                            <th><input type="hidden" name="action" value="update"/>
                                <input type="submit" value="Confirm"/></th></form>
                    <td><form method="post"><input type="hidden" name="action" value="cancel"/>
                            <input type="submit" value="Cancel"/></form></td>
                    </tr>
                </table>


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
            </c:if>
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
            <c:if test="${disable==true}">
                <h3><a class="a_menu" href="/HOME_nVentory">Home Page</a></h3>
            </c:if>                    
        </div>
    </body>
</html>
