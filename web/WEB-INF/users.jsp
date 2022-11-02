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
                <h2>No users found, please add a user.</h2>
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
                        <td>${user.getEmail()}</td>
                        <td>${user.getFirstName()}</td>
                        <td>${user.getLastName()}</td>
                        <td>${user.getRole().getRoleName()}</td>
                        <td><a href="<c:url value='UserServlet?'> <c:param name='action' value='edit'/> <c:param name='email' value='${user.getEmail()}'/></c:url>>">Edit</a></td>
                        <td><a href="<c:url value='UserServlet?'> <c:param name='action' value='delete'/> <c:param name='email' value='${user.getEmail()}'/></c:url>>">Delete</a></td>
                    </tr>
                </c:forEach>
                </table>
            </c:if>
         </form>
        
         <c:if test="${selectedUser eq null}">
             <form method="post" action="UserServlet">
                <h1>Add User</h1>
                Email: <input type="text" name="email"><br>
                First Name: <input type="text" name="fname"><br>
                Last Name: <input type="text" name="lname"><br>
                Password: <input type="password" name="password"><br>
                Role: <select name="roles">
                <c:forEach items="${roles}" var="role">
                    <option value="${role.getRoleId()}">${role.getRoleName()}</option>
                </c:forEach>
            </select><br>
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Add User">
            </form>
         </c:if>
        
        <c:if test="${selectedUser ne null}">
             <form method="post" action="UserServlet">
                <h1>Edit User</h1>
                Email: ${selectedUser.email}<br>
                First Name: <input type="text" name="fname" value="${selectedUser.getFirstName()}"><br>
                Last Name: <input type="text" name="lname" value="${selectedUser.getLastName()}"><br>
                Password: <input type="password" name="password"><br>
                Role: <select name="roles">
                <c:forEach items="${roles}" var="role">
                    <c:if test="${role.getRoleId() eq selectedUser.getRole().getRoleId()}">
                    <option value="${role.getRoleId()}" selected>${role.getRoleName()}</option>
                    </c:if>
                    <c:if test="${role.getRoleId() ne selectedUser.getRole().getRoleId()}">
                    <option value="${role.getRoleId()}">${role.getRoleName()}</option>
                    </c:if>
                </c:forEach>
            </select><br>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="email" value="${selectedUser.getEmail()}">
            <input type="submit" value="Update">
            </form>
         
            <form>
                <input type="hidden" name="action" value="cancel">
                <input type="submit" value="Cancel">
            </form>
        </c:if>
        <p>${message}</p>
    </body>
</html>
