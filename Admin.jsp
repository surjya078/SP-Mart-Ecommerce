
<!-- Validation for adding restriction to normal user to login in admin page -->
<%@page import="com.mycompany.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerce.helper.FactoryProvider"%>
<%@page import="com.mycompany.ecommerce.dao.CategoryDao"%>
<%@page import="com.mycompany.ecommerce.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login first !!");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not Admin !! Access Denied !!");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@include file="components/common_css_js.jsp"%>

<style type="text/css">
.card {
	border-radius: 15px 50px 30px;
	background-color: #83b7f0;
	border: 2px solid orange;
}

.card:hover {
	background: #8bdae7;
}
</style>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container ">

		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp"%>

		</div>

		<div class="row mt-3">

			<!-- col-1 -->
			<div class="col-md-4">

				<div class="card">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								alt="image not fount" src="img/Users.png">
						</div>

						<h4>2385</h4>
						<h2 class="text-uppercase text-muted">Users</h2>
					</div>

				</div>
			</div>

			<!-- col-2 -->
			<div class="col-md-4">

				<div class="card">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								alt="image not fount" src="img/Categories.png">
						</div>

						<h4>200+</h4>
						<h2 class="text-uppercase text-muted">Catagories</h2>
					</div>

				</div>

			</div>

			<!-- col-3 -->
			<div class="col-md-4">

				<div class="card">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								alt="image not fount" src="img/Products.png">
						</div>

						<h4>48562</h4>
						<h2 class="text-uppercase text-muted">Products</h2>
					</div>

				</div>

			</div>
		</div>

		<!-- second row -->
		<div class="row mt-3">

			<div class="col-md-6">

				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								alt="image not fount" src="img/Add Catagories.png">
						</div>

						<p class="mt-2">Click here to add new Categories</p>
						<h2 class="text-uppercase text-muted">Add Category</h2>
					</div>

				</div>

			</div>

			<div class="col-md-6">

				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">

					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								alt="image not fount" src="img/add-product.png">
						</div>
						<p class="mt-2">Click here to add new Product</p>
						<h2 class="text-uppercase text-muted">Add Product</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Category model -->

	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-warning">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body bg-light">

					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required="required" />
						</div>

						<div class="form-group">
							<textarea style="height: 200px;" class="form-control"
								placeholder="Enter category description" name="catDescription"
								required="required"></textarea>
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button class="btn btn-outline-info" data-dismiss="modal">Close</button>

						</div>

					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- End Of Category Model -->

	<!-- Add Product model -->

	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-info">
					<h5 class="modal-title " id="exampleModalLabel">Fill Product
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body bg-light" >

					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addproduct">

						<div class="form-group">
							<input type="text" class="form-control" name="proTitle"
								placeholder="Enter Product Name" required="required" />
						</div>

						<div class="form-group">
							<textarea style="height: 100px;" class="form-control"
								placeholder="Enter product description" name="proDescription"
								required="required"></textarea>
						</div>



						<div class="form-group">
							<input type="number" class="form-control" name="proPrice"
								placeholder="Enter Product Price" required="required" />
						</div>

						<div class="form-group">
							<input type="number" class="form-control" name="proDiscount"
								placeholder="Enter Product Discount" required="required" />
						</div>

						<div class="form-group">
							<input type="number" class="form-control" name="proQuantity"
								placeholder="Enter Product Quantity" required="required" />
						</div>

						<!-- Product Category validation -->

						<%
						CategoryDao cDao = new CategoryDao(FactoryProvider.geFactory());
						List<Category> list = cDao.getCategories();
						%>

						<div class="form-group">
							<select name="catId" class="form-control" >
								<%
								for (Category c : list) {
								%>
								<option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<label for="pPic">Select Product Image</label> <br> <input
								type="file" id="pPic" name="proImage"
								placeholder="Upload the current product image"
								required="required" />
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button class="btn btn-outline-info" data-dismiss="modal">Close</button>

						</div>

					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- End Of Product Model -->

</body>
</html>