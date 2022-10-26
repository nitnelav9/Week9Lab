<%-- 
    Document   : users
    Created on : 20-Oct-2022, 12:49:20 PM
    Author     : valentinmorales
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <h1>Manage Users</h1>
        
        <form>
           
            <c:if test="${empty users}">
                <h2>No data found, please add users.</h2>
            </c:if>
            <c:if test="${not empty users}">
                <table border="1px solid black;">
                    <tr>
                        <th>Email</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Role</th>
                        <th></th>
                        <th></th>
                    </tr>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.role.role_name}</td>
                        <td><a href="<c:url value='UserServlet?'> <c:param name='action' value='edit'/> <c:param name='email' value='${user.email}'/></c:url>>">Edit</a></td>
                        <td><a href="<c:url value='UserServlet?'> <c:param name='action' value='delete'/> <c:param name='email' value='${user.email}'/></c:url>>">Delete</a></td>
                    </tr>
                </c:forEach>
                </table>
            </c:if>
         </form>
        
         <c:if test="${selectedUser eq null}">
             <form method="post">
                <h1>Add User</h1>
                Email: <input type="text" name="email"><br>
                First Name: <input type="text" name="fname"><br>
                Last Name: <input type="text" name="lname"><br>
                Password: <input type="password" name="password"><br>
                Role: <select name="roles">
                <c:forEach items="${roles}" var="role">
                    <option value="${role.role_id}">${role.role_name}</option>
                </c:forEach>
            </select><br>
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Add User">
            </form>
         </c:if>
        
        <c:if test="${selectedUser ne null}">
             <form>
                <h1>Edit User</h1>
                Email: ${selectedUser.email}<br>
                First Name: <input type="text" name="fname" value="${selectedUser.firstName}"><br>
                Last Name: <input type="text" name="lname" value="${selectedUser.lastName}"><br>
                Password: <input type="password" name="password" value="${selectedUser.password}"><br>
                Role: <select name="roles">
                <c:forEach items="${roles}" var="role">
                    <c:if test="{role.role_id eq selectedUser.role.role_id}">
                    <option value="${role.role_id}" selected>${role.role_name}</option>
                    </c:if>
                    <c:if test="{role.role_id ne selectedUser.role.role_id}">
                    <option value="${role.role_id}">${role.role_name}</option>
                    </c:if>
                </c:forEach>
            </select><br>
            <input type="submit" name="action" value="Update">
            <input type="submit" name="action" value="Cancel">
            </form>
         </c:if>
    </body>
</html>
