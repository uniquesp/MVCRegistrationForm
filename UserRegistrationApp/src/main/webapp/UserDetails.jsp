<%@page import="com.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.model.UserDTO"%>
<%@ page import="com.controller.UserController"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Details</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<form>
		<table>
			<h1>
				User Details
				</h>
				<thead>
					<tr>
						<th>ID</th>
						<th>Username</th>
						<th>Email</th>
						<th>Mobile No</th>
						<th>Birth Date</th>
						<th>Country</th>
						<th>State</th>
						<th>Pincode</th>
						<th>Gender</th>
						<th>Hobby</th>
						<th>Language</th>
						<th>Profile Pic</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>

					<% 
     //      List<UserDTO> userList = request.getAttribute("userList") != null ? 
    		 //(List<UserDTO>) request.getAttribute("userList"): new ArrayList<UserDTO>();
				UserDao userDao = new UserDao();
				UserDTO userDto = new UserDTO();
				List<UserDTO> userList = userDao.getAllUsers(userDto);
                Iterator<UserDTO> iterator = userList.iterator();
                while(iterator.hasNext()) {
                    UserDTO user = iterator.next();
            %>
					<tr>
						<td><%= user.getSerial_no() %></td>
						<td><%= user.getUser_name() %></td>
						<td><%= user.getEmail() %></td>
						<td><%= user.getMobileno() %></td>
						<td><%= user.getBirthdate() %></td>
						<td><%= user.getCountry() %></td>
						<td><%= user.getState() %></td>
						<td><%= user.getPincode() %></td>
						<td><%= user.getGender() %></td>
						<td><%= user.getHobbies() %></td>
						<td><%= user.getLanguage() %></td>
						<td><img
							src="data:image/png;base64,<%= user.getConverted_profile_image() %>"
							alt="ProfilePic" style="width: 50px; height: 50px;"></td>
						<td class="actions"><a
							href="<%= request.getContextPath()%>/EditUserDetails.jsp?userid=<%=user.getUser_id() %>"
							title="Edit User" class="edit-icon"><i class="fas fa-edit"></i></a>
							<a
							href="<%= request.getContextPath()%>/user_controller?method=delete&userid=<%=user.getUser_id()%>"
							title="Delete User" class="delete-icon"><i
								class="fas fa-trash-alt"></i></a></td>
					</tr>
					<% } %>
				</tbody>
		</table>
	</form>
</body>
</html>