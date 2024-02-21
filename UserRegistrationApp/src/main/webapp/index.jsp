<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>UserRegistration</title>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="row justify-content-center registration-container">
			<div class="col-md-8">
				<div class="form-container">
					<form id="myform" method="post"
						action="<%=request.getContextPath()%>/user_controller"
						enctype="multipart/form-data">
						<input type="hidden" value="registration" name="method" />
						<h1>Registration Form</h1>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="name">Name</label> <input type="text"
									class="form-control" id="name" placeholder="Enter your name"
									name="user_name" oninput="validateName()" required>
							</div>
							<div class="form-group col-md-6">
								<label for="email">Email</label> <input type="email"
									name="user_mail" class="form-control" id="email"
									oninput="validateEmail()" placeholder="Enter your email"
									required>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="mobile">Mobile No</label> <input type="number"
									class="form-control" id="mobile" name="mobile_no"
									placeholder="Enter your mobile number"
									oninput="validateMobileNumber()" required>
							</div>
							<div class="form-group col-md-6">
								<label for="birthdate">Birthdate</label> <input type="date"
									class="form-control" id="birthdate" name="bdate" required>
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
									placeholder="Enter your district" required>
							</div>
							<div class="form-group col-md-4">
								<label for="pincode">Pincode</label> <input type="number"
									class="form-control" id="pincode" name="pincode"
									placeholder="Enter your pincode" required>
							</div>
							<div class="form-group col-md-4">
								<label for="area">Area</label> <input type="text"
									class="form-control" id="area" name="area"
									placeholder="Enter your area" required>
							</div>
						</div>

						<div class="form-group">
							<label style="margin-right: 50px;">Gender</label>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="male" value="Male"> <label class="form-check-label"
									for="male" style="margin-right: 50px;">Male</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="female" value="Female"> <label
									class="form-check-label" for="female"
									style="margin-right: 50px;">Female</label>
							</div>
						</div>
						<div class="form-group">
							<label style="margin-right: 50px;">Languages</label>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="English"
									name="language" value="English"> <label
									class="form-check-label" for="English"
									style="margin-right: 15px;">English</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="Hindi"
									name="language" value="Hindi"> <label
									class="form-check-label" for="Hindi"
									style="margin-right: 15px;">Hindi</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="Marathi"
									name="language" value="Marathi"> <label
									class="form-check-label" for="Marathi"
									style="margin-right: 15px;">Marathi</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="Spanish"
									name="language" value="Spanish"> <label
									class="form-check-label" for="Spanish"
									style="margin-right: 15px;">Spanish</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="French"
									name="language" value="French"> <label
									class="form-check-label" for="French"
									style="margin-right: 15px;">French</label>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="hobbies">Hobbies</label> <select
									class="form-control" id="hobbies" name="hobbies">
									<option value="Painting">Painting</option>
									<option value="Coding">Coding</option>
									<option value="Singing">Singing</option>
									<option value="Dancing">Dancing</option>
									<option value="Photography">Photography</option>
									<option value="Other">Other</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="profile_pic">Profile Picture</label> <input
									type="file" class="form-control-file" id="profile_pic"
									name="profile_pic">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="password">Password</label>
								<div class="input-group">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="Enter your password" required>
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
										placeholder="confirmPassword" required>
									<div class="input-group-append">
										<span class="input-group-text"> <a href="#"><i
												class="far fa-eye" id="toggleConfirmPassword"></i></a>
										</span>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" name="action" value="registeruser" />
						<button type="submit" class="btn btn-primary btn-block"
							onclick="validatePassword()">Register</button>
						<div class="old-user">
							Alredy Have Account?<a
								href="<%= request.getContextPath()%>/Login.jsp"><u>Login
									Here</u></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/script.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
