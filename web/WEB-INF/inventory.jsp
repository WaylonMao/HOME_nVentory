<%-- Document : inventory Created on : 19-Oct-2022, 10:29:53 PM Author : WL --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Inventory</title>
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
        <h3 class="message">${message}</h3>
        <div>
            <table class="side_table">
                <c:if test="${deleteItem!=null}">
                    <tr>
                        <th></th>
                        <th>Delete?</th>
                        <th><form method="post"><input type="hidden" name="itemId" value="${deleteItem.itemId}" />
                                <input type="hidden" name="action" value="remove" />
                                <input type="submit" value="Yes" /></form></th>
                        <th><form method="post">
                                <input type="hidden" name="action" value="cancel" />
                                <input type="submit" value="Cancel" /></form></th>
                    </tr>
                </c:if>
                <tr>
                    <th>Category</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th></th>
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
                                <input type="hidden" name="action" value="edit" />
                                <input type="submit" value="Edit" />
                            </form>
                        </td>
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
        <c:choose>
            <c:when test="${editItem==null}">
                <h2>Add Item</h2>
                <div>
                    <table class="side_table">
                        <form method="post">
                            <tr>
                                <td>Category:</td>
                                <td>
                                    <select name="addCategory">
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
                                <td><input type="text" name="addItemName" /></td>
                            </tr>
                            <tr>
                                <td>Price:</td>
                                <td><input type="text" name="addPrice" /></td>
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
                <h2>Edit Item</h2>
                <div>
                    <table class="side_table">
                        <tr><form method="post">
                            <td>Category:</td>
                            <td>
                                <select name="category">
                                    <c:forEach items="${categories}" var="category">
                                        <c:choose>
                                            <c:when test="${editItem.category.categoryId == category.categoryId}">
                                                <option value="${category.categoryId}" selected="selected">
                                                    ${category.categoryName}
                                                </option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${category.categoryId}">
                                                    ${category.categoryName}
                                                </option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td><input type="text" name="itemName" value="${editItem.itemName}"/></td>
                            </tr>
                            <tr>
                                <td>Price:</td>
                                <td><input type="text" name="price" value="${editItem.price}"/></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="hidden" name="itemId" value="${editItem.itemId}" />
                                    <input type="hidden" name="action" value="update" />
                                    <input type="submit" value="Save" />
                                </td></form>
                        <td><form method="post"><input type="hidden" name="action" value="cancel" />
                                <input type="submit" value="Cancel" /></form></td>
                        </tr>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </body>
</html>
