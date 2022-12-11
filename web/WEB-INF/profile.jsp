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
