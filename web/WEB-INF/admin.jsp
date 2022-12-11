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
        <h1>HOME nVentory</h1>
        <h3>Menu</h3>
        <ul>
            <li><a class="a_menu" href="inventory">Inventory</a></li>
            <li><a class="a_menu" href="profile">Profile</a></li>
            <li><a class="a_menu" href="inventory_search">Search</a></li>
            <li><a class="a_menu" href="category">Category</a></li>
            <li><a class="a_menu" href="?action=logout">Logout</a></li>
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
                                <th>Email</th>
                                <th>Active</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Edit</th>
                                <th>Change Password</th>
                                <th>Delete</th>
                            </tr>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td>${user.email}</td>
                                <td><c:if test="${user.active==true}">Actived</c:if></td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.email}</td>
                                <td>${user.role.roleName}</td>
                                <td>
                                    <form method="post">
                                        <input type="hidden" name="email" value="${user.email}"/>
                                        <input type="hidden" name="action" value="edit"/>
                                        <input type="submit" value="Edit"/>
                                    </form>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${passUser == null||passUser.email!=user.email}">
                                            <form  method="post">
                                                <input type="hidden" name="email" value="${user.email}"/>
                                                <input type="hidden" name="action" value="changePassword"/>
                                                <input type="submit" value="Change Password"/>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <form style="display:inline;" method="post">
                                                <input type="hidden" name="email" value="${user.email}"/>
                                                <input type="hidden" name="action" value="confirmPassword"/>
                                                <input type="text" name="newPassword"/>
                                                <input class="a_green" type="submit" value="✓"/>
                                            </form>
                                            <form style="display:inline;" method="post">
                                                <input type="hidden" name="action" value="cancelPassword"/>
                                                <input class="a_red" type="submit" value="✗"/>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <form method="post">
                                        <input type="hidden" name="email" value="${user.email}"/>
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
                                    <td><input type="text" name="email" placeholder="email"/></td>
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
                                    <td><input type="text" name="password" placeholder="Password"/></td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="role">
                                        <c:forEach items="${roles}" var="role">
                                            <option value="${role.roleId}">
                                                ${role.roleName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
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
                                    <td>Email:</td>
                                    <td>${editUser.email}</td>
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
                                    <td>First Name:</td>
                                    <td><input type="text" name="firstName" value="${editUser.firstName}"/></td>
                                </tr>
                                <tr>
                                    <td>Last Name:</td>
                                    <td><input type="text" name="lastName" value="${editUser.lastName}"/></td>
                                </tr>
                                <tr>
                                    <td>Role:</td>
                                    <td>
                                        <select name="role">
                                            <c:forEach items="${roles}" var="role">
                                                <c:choose>
                                                    <c:when test="${editUser.role.roleId == role.roleId}">
                                                        <option value="${role.roleId}" selected="selected">
                                                            ${role.roleName}
                                                        </option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${role.roleId}">
                                                            ${role.roleName}
                                                        </option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="hidden" name="email" value="${editUser.email}"/>
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
