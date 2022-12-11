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
