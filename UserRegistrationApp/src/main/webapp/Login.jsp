<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Userlogin</title>
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
		<div class="row justify-content-center login-container">
			<div class="col-md-6">
				<div class="form-container">
					<form id="myform" method="post"
						action="<%= request.getContextPath()%>/user_controller">
						<input type="hidden" value="login" name="method" />
						<h1>Login Form</h1>
						<div class="form-group">
							<label for="username">Email</label> <input type="email"
								class="form-control" id="username" name="user_mail"
								placeholder="Enter your mail" oninput="validateEmail()" required>
						</div>
						<div class="form-group">
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
						<div class="form-group text-left">
							<a href="#" style="color: white;">Forgot Password?</a>
						</div>
						<button type="submit" class="btn btn-primary btn-block">Login</button>
						<div class="old-user">
							Don't Have Account?<a
								href="<%= request.getContextPath()%>/index.jsp"><u>Register
									Here</u></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/script.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>

</body>
</html>