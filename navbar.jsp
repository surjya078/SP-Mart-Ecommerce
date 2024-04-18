
<%@page import="com.mycompany.ecommerce.entities.User"%>
<%
User user1 = (User) session.getAttribute("current-user");
%>

<html>
<head>
<style type="text/css">
nav {
	background-image: linear-gradient(to right, #051937, #004d7a, #008793, #00bf72, #a8eb12);
}

body {
	background-image: linear-gradient(to right, #91f572, #00e8c4, #00cdff, #00a3ff, #ad66e0);
}
</style>
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-dark ">
		<div class="container">
			<a class="navbar-brand" href="#"><b><i>SP Mart</i></b></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">

					<li class="nav-item active"><a class="nav-link"
						href="index.jsp">Home <span class="sr-only">(current)</span></a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Categories </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li>

				</ul>
				<ul class="navbar-nav ml-auto">

					<%
					if (user1 == null) {
					%>
					<li class="nav-item active"><a class="nav-link"
						href="login.jsp">Login</a></li>

					<li class="nav-item active"><a class="nav-link"
						href="register.jsp">Register</a></li>


					<%
					} else {
					%>

					<li class="nav-item active"><a class="nav-link" href="#!">
							<%
							out.print("Hello ");
							%><%=user1.getUserName()%></a></li>

					<li class="nav-item active"><a class="nav-link"
						name="LogoutServlet" href="LogoutServlet">Logout</a></li>

					<%
					}
					%>


				</ul>
			</div>
		</div>
	</nav>
</body>

</html>

