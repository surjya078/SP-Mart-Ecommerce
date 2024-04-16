<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<%@include file="components/common_css_js.jsp"%>
<title>User Login Form</title>
</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">

					<div class="card-header bg-info text-center">
						<h3>Login Here...</h3>
					</div>

					<div class="card-body">
					
					<%@include file="components/message.jsp" %>
						<form action="LoginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">User
									Name</label> <input name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input name="password" type="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<a href="register.jsp" class="text-center d-block mb-2"> <u> if not registered click here. </u></a>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary btn-outline-success">Submit</button>
								<button type="reset" class="btn btn-primary btn-outline-warning">Reset</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>