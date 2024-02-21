<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.model.UserDTO"%>
<%@page import="com.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>UpdateDetails</title>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
</head>
<body>
	<%
	UserDao userDao = new UserDao();
	UserDTO userDto = new UserDTO();
	int id = request.getParameter("userid") != null ? Integer.parseInt(request.getParameter("userid")) : 0;
	userDto.setUser_id(id);
	List<UserDTO> userList = userDao.getAllUsers(userDto);
	Iterator<UserDTO> iterator = userList.iterator();
	while (iterator.hasNext()) {
		UserDTO user = iterator.next();
	%>
	<div class="container">
		<div class="row justify-content-center registration-container">
			<div class="col-md-8">
				<div class="form-container">
					<form id="myform" method="post"
						action="<%=request.getContextPath()%>/user_controller"
						enctype="multipart/form-data">
						<input type="hidden" value="update" name="method" />
						<h1>Update Details</h1>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="name">Name</label> <input type="text"
									class="form-control" id="name" placeholder="Enter your name"
									name="user_name" oninput="validateName()"
									value="<%=user.getUser_name()%>" required>
							</div>
							<div class="form-group col-md-6">
								<label for="email">Email</label> <input type="email"
									name="user_mail" class="form-control" id="email"
									placeholder="Enter your email" value="<%=user.getEmail()%>"
									oninput="validateEmail()" readonly="readonly"
									required="required">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="mobile">Mobile No</label> <input type="number"
									class="form-control" id="mobile" name="mobile_no"
									placeholder="Enter your mobile number"
									oninput="validateMobileNumber()" value=<%=user.getMobileno()%>
									required>
							</div>
							<div class="form-group col-md-6">
								<label for="birthdate">Birthdate</label> <input type="date"
									class="form-control" id="birthdate" name="bdate"
									value="<%=user.getBirthdate()%>" required>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="country">Country</label> <select
									class="form-control country" id="country" name="country"
									onchange="loadStates()" required>
									<option selected>Select Country</option>
									<option value="IN">India</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label for="state">State</label> <select
									class="form-control state" id="state" name="state"
									onchange="loadCities()" required>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label for="City">City</label> <select
									class="form-control city city" id="City" name="city" required>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="District">District</label> <input type="text"
									class="form-control" id="district" name="district"
									value="<%=user.getDistrict()%>"
									placeholder="Enter your district" required>
							</div>
							<div class="form-group col-md-4">
								<label for="pincode">Pincode</label> <input type="number"
									value="<%=user.getPincode()%>" class="form-control"
									id="pincode" name="pincode" placeholder="Enter your pincode"
									required>
							</div>
							<div class="form-group col-md-4">
								<label for="area">Area</label> <input type="text"
									value="<%=user.getArea()%>" class="form-control" id="area"
									name="area" placeholder="Enter your area" required>
							</div>
						</div>

						<div class="form-group">
							<label style="margin-right: 50px;">Gender</label>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="male" value="Male"
									<%=(user.getGender().equals("Male")) ? "checked" : ""%>>
								<label class="form-check-label" for="male"
									style="margin-right: 50px;">Male</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="female" value="Female"
									<%=(user.getGender().equals("Female")) ? "checked" : ""%>>
								<label class="form-check-label" for="female"
									style="margin-right: 50px;">Female</label>
							</div>
						</div>

						<div class="form-group">
							<label style="margin-right: 50px;">Languages</label>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="English"
									name="language" value="English"
									<%=(user.getLanguage().contains("English")) ? "checked" : ""%>>
								<label class="form-check-label" for="English"
									style="margin-right: 15px;">English</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="Hindi"
									name="language" value="Hindi"
									<%=(user.getLanguage().contains("Hindi")) ? "checked" : ""%>>
								<label class="form-check-label" for="Hindi"
									style="margin-right: 15px;">Hindi</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="Marathi"
									name="language" value="Marathi"
									<%=(user.getLanguage().contains("Marathi")) ? "checked" : ""%>>
								<label class="form-check-label" for="Marathi"
									style="margin-right: 15px;">Marathi</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="Spanish"
									name="language" value="Spanish"
									<%=(user.getLanguage().contains("Spanish")) ? "checked" : ""%>>
								<label class="form-check-label" for="Spanish"
									style="margin-right: 15px;">Spanish</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="French"
									name="language" value="French"
									<%=(user.getLanguage().contains("French")) ? "checked" : ""%>>
								<label class="form-check-label" for="French"
									style="margin-right: 15px;">French</label>
							</div>
						</div>


						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="hobbies">Hobbies</label> <select
									class="form-control" id="hobbies" name="hobbies">
									<option value="Painting"
										<%=(user.getHobbies().equals("Painting")) ? "selected" : ""%>>Painting</option>
									<option value="Coding"
										<%=(user.getHobbies().equals("Coding")) ? "selected" : ""%>>Coding</option>
									<option value="Singing"
										<%=(user.getHobbies().equals("Singing")) ? "selected" : ""%>>Singing</option>
									<option value="Dancing"
										<%=(user.getHobbies().equals("Dancing")) ? "selected" : ""%>>Dancing</option>
									<option value="Photography"
										<%=(user.getHobbies().equals("Photography")) ? "selected" : ""%>>Photography</option>
									<option value="Other"
										<%=(user.getHobbies().equals("Other")) ? "selected" : ""%>>Other</option>
								</select>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="profile_pic">Profile Picture</label> <input
										type="file" class="form-control-file" id="profile_pic"
										name="profile_pic" onchange="previewFile()">
								</div>
							</div>


							<div class="form-row">
								<div class="form-group">
									<div class="image-container">
										<img
											src="data:image/png;base64,<%=user.getConverted_profile_image()%>"
											alt="Profile Picture"
											style="max-width: 50%; height: 30%; margin-top: 20px;"
											id="previewImage">
									</div>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="password">Password</label>
								<div class="input-group">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="Enter your password"
										value="<%=user.getPassword()%>" required>
									<div class="input-group-append">
										<span class="input-group-text"> <a href="#"><i
												class="far fa-eye" id="togglePassword"></i></a>
										</span>
									</div>
								</div>

							</div>
							<div class="form-group col-md-6">
								<label for="confirmPassword">Confirm Password</label>
								<div class="input-group">
									<input type="password" class="form-control"
										id="confirmPassword" name="confirm_password"
										value="<%=user.getPassword()%>" placeholder="confirmPassword"
										required>
									<div class="input-group-append">
										<span class="input-group-text"> <a href="#"><i
												class="far fa-eye" id="toggleConfirmPassword"></i></a>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<button type="submit" class="btn btn-primary btn-block"
									onclick="validatePassword()">Update</button>
							</div>
							<div class="form-group col-md-6">
								<button type="submit" class="btn btn-primary btn-block"
									onclick="validatePassword()">
									<a href="<%=request.getContextPath()%>/UserDetails.jsp"
										style="color: white;">Back </a>
								</button>
							</div>
						</div>
						<input type="hidden" name="action" value="updateuser" /> <input
							type="hidden" name=userid value="<%=user.getUser_id()%>" />
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
    function previewFile() {
        var preview = document.getElementById('previewImage');
        var fileInput = document.getElementById('profile_pic');
        var file = fileInput.files[0];

        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        };

        if (file) {
            reader.readAsDataURL(file);
        } else {
            // If no new file is selected, but there is an existing image, set the preview to the existing image
            preview.src = "data:image/png;base64,<%=user.getConverted_profile_image()%>";
        }
    }
</script>





	<%
	}
	%>
	<script src="resources/js/script.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
