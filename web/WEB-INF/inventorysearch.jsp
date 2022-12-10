<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory Search</title>
        <style>
            <%@include file="/WEB-INF/style.css"%>
        </style>
    </head>
    <body>
        <h1>HOME nVentory</h1>
        <h3>Menu</h3>
        <ul>
            <li><a class="a_menu" href="admin">Admin</a></li>
            <li><a class="a_menu" href="inventory">Inventory</a></li>
            <li><a class="a_menu" href="profile">Profile</a></li>
            <li><a class="a_menu" href="category">Category</a></li>
            <li><a class="a_menu" href="?action=logout">Logout</a></li>
        </ul>
        <h2>Search Item</h2>
        <form method="post">
            <table class="main_table">
                <tr>
                    <td><input type="text" name="keyword" /></td>
                    <td><input type="hidden" name="action" value="search"/><input type="submit" value="Search" /></td>
                </tr>
            </table>
        </form>
        <c:if test="${items!=null}">
            <table class="side_table">
                <tr>
                    <th>Item</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Owner</th>
                    <th>Owner's Email</th>
                </tr>
                <c:forEach items="${items}" var="item">
                    <tr>                        
                        <td>${item.itemName}</td>
                        <td>${item.category.categoryName}</td>
                        <td>${item.price}</td>
                        <td>${item.owner.firstName} ${item.owner.firstName}</td>
                        <td>${item.owner.email}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
