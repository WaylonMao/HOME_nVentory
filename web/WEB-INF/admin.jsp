<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
    <style>
        <%@include file="/WEB-INF/style.css"%>
    </style>
</head>
<body>
<h1>Home Inventory</h1>
<h3>Menu</h3>
<ul>
    <li><a href="inventory">Inventory</a></li>
    <li><a href="admin">Admin</a></li>
    <li><a href="?action=logout">Logout</a></li>
</ul>
<div class="message">
    <c:if test="${message !=null}"><h2>${message}</h2></c:if>
</div>
<table class="main_table">
    <tr>
        <th>Manage Users</th>
    </tr>
    <tr>
        <td>
            <table class="side_table">
                <tr>
                    <th>Username</th>
                    <th>Active</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Admin</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td><c:if test="${user.active==true}">Actived</c:if></td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.email}</td>
                        <td><c:if test="${user.isAdmin==true}">Admin</c:if></td>
                        <td>
                            <form method="post">
                                <input type="hidden" name="username" value="${user.username}"/>
                                <input type="hidden" name="action" value="edit"/>
                                <input type="submit" value="Edit"/>
                            </form>
                        </td>
                        <td>
                            <form method="post">
                                <input type="hidden" name="username" value="${user.username}"/>
                                <input type="hidden" name="action" value="delete"/>
                                <input type="submit" value="Delete"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
</table>
<table class="main_table">
    <tr>
        <th>Add User</th>
        <th><c:if test="${editUser!=null}">Edit User</c:if></th>
    </tr>
    <tr>
        <td>
            <table class="side_table">
                <form method="post">
                    <tr>
                        <td><input type="text" name="username" placeholder="username"/></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="active" value="1" checked/>Active</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="firstName" placeholder="First Name"/></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="lastName" placeholder="Last Name"/></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="email" placeholder="Email"/></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="password" placeholder="Password"/></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="isAdmin" value="1" checked/>Admin</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="action" value="add"/>
                            <input type="submit" value="Add"/>
                        </td>
                    </tr>
                </form>
            </table>
        </td>
        <td>
            <c:if test="${editUser!=null}">
                <table class="side_table">
                    <form method="post">
                        <tr>
                            <td>Username:</td>
                            <td>${editUser.username}</td>
                        </tr>
                        <tr>
                            <td>Active:</td>
                            <td>
                                <c:choose>
                                    <c:when test="${editUser.active == true}">
                                        <input type="checkbox" name="active" value="1" checked/>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" name="active" value="1"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="email" value="${editUser.email}"/></td>
                        </tr>
                        <tr>
                            <td>First Name:</td>
                            <td><input type="text" name="firstName" value="${editUser.firstName}"/></td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td><input type="text" name="lastName" value="${editUser.lastName}"/></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="text" name="password" value="${editUser.password}"/></td>
                        </tr>
                        <tr>
                            <td>Admin:</td>
                            <td>
                                <c:choose>
                                    <c:when test="${editUser.isAdmin == true}">
                                        <input type="checkbox" name="isAdmin" value="1" checked/>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="checkbox" name="isAdmin" value="1"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="hidden" name="username" value="${editUser.username}"/>
                                <input type="hidden" name="action" value="update"/>
                                <input type="submit" value="Save"/>
                            </td>
                            <td>
                                <form method="post">
                                    <input type="hidden" name="action" value="cancel"/>
                                    <input type="submit" value="Cancel"/>
                                </form>
                            </td>
                        </tr>
                    </form>
                </table>
            </c:if>
        </td>
    </tr>
</table>

</body>
</html>
