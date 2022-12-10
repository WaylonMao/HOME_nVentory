<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Category</title>
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
            <li><a class="a_menu" href="inventory_search">Search</a></li>     
            <li><a class="a_menu" href="?action=logout">Logout</a></li>
        </ul>
        <h2>Category Management</h2>
        <h3 class="message">${message}</h3>
        <div>
            <table class="side_table">                
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th></th>
                </tr>
                <c:forEach items="${categories}" var="category">
                    <tr>
                        <td>${category.categoryId}</td>
                        <td>${category.categoryName}</td>
                        <td>
                            <form method="post">
                                <input type="hidden" name="categoryId" value="${category.categoryId}" />
                                <input type="hidden" name="action" value="edit" />
                                <input type="submit" value="Edit" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <c:choose>
            <c:when test="${editCategory==null}">
                <h2>Add Item</h2>
                <div>
                    <table class="side_table">
                        <form method="post">
                            <tr>
                                <td>Category Name:</td>
                                <td><input type="text" name="categoryName" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="hidden" name="action" value="add" />
                                    <input type="submit" value="Add" />
                                </td>
                                <td></td>
                            </tr>
                        </form>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <h2>Edit Category</h2>
                <div>
                    <table class="side_table">
                        <form method="post">
                            <tr>
                                <td>ID:</td>
                                <td>${editCategory.categoryId}</td>
                            </tr>
                            <tr>
                                <td>Category Name:</td>
                                <td><input type="text" name="categoryName" value="${editCategory.categoryName}"/></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="hidden" name="categoryId" value="${editCategory.categoryId}" />
                                    <input type="hidden" name="action" value="update" />
                                    <input type="submit" value="Save" />
                                </td>
                                <td></td>
                            </tr>
                        </form>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </body>
</html>
