<%-- Document : inventory Created on : 19-Oct-2022, 10:29:53 PM Author : WL --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Home Inventory</title>
        <style>
            <%@include file="/WEB-INF/style.css"%>
        </style>
    </head>
    <body>
        <h1>HOME nVentory</h1>
        <h3>Menu</h3>
        <ul>
            <li><a href="profile">Profile</a></li>
            <c:if test="${user.role.roleId==1}"><li><a href="admin">Admin</a></li></c:if>      
                <li><a href="?action=logout">Logout</a></li>
            </ul>
            <h2>Inventory for ${user.firstName} ${user.lastName}</h2>
        <div>
            <table class="side_table">
                <tr>
                    <th>Category</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th></th>
                </tr>
                <c:forEach items="${items}" var="item">
                    <tr>
                        <td>${item.category.categoryName}</td>
                        <td>${item.itemName}</td>
                        <td>${item.price}</td>
                        <td>
                            <form method="post">
                                <input type="hidden" name="itemId" value="${item.itemId}" />
                                <input type="hidden" name="action" value="delete" />
                                <input type="submit" value="Delete" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <h2>Add Item</h2>
        <div>
            <table class="side_table">
                <form method="post">
                    <tr>
                        <td>Category:</td>
                        <td>
                            <select name="category">
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.categoryId}">
                                        ${category.categoryName}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="itemName" /></td>
                    </tr>
                    <tr>
                        <td>Price:</td>
                        <td><input type="text" name="price" /></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="action" value="add" /><input
                                type="submit"
                                value="Save"
                                />
                        </td>
                        <td></td>
                    </tr>
                </form>
            </table>
        </div>
        <p>${message}</p>
    </body>
</html>
