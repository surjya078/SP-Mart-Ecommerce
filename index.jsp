
<%@page import="com.mycompany.ecommerce.helper.Helper"%>
<%@page import="com.mycompany.ecommerce.entities.Category"%>
<%@page import="com.mycompany.ecommerce.dao.CategoryDao"%>
<%@page import="com.mycompany.ecommerce.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerce.dao.ProductDao"%>
<%@page import="com.mycompany.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>

<%@include file="components/common_css_js.jsp"%>

<style type="text/css">
.list-group-item.active {
	background-color: #004d7a;
	border-color: #a8eb12;
	border-radius: 10px;
}

.card-deck .card {
	
}
</style>

</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="row mt-3 mx-2">

		<%
		ProductDao dao = new ProductDao(FactoryProvider.geFactory());
		List<Product> plist = dao.getAllProducts();

		CategoryDao cdao = new CategoryDao(FactoryProvider.geFactory());
		List<Category> clist = cdao.getCategories();
		%>

		<!-- show categories -->
		<div class="col-md-2">

			<div class="list-group mt-4">
				<a href="#"
					class="list-group-item list-group-item-action active text-center border border-2"
					aria-current="true"> All Products </a>

				<%
				for (Category category : clist) {
				%>


				<a href="#" class="list-group-item list-group-item-action rounded"><%=category.getCategoryTitle()%></a>

				<%
				}
				%>

			</div>

		</div>

		<!-- show products -->
		<div class="col-md-8">
			<!-- row -->
			<div class="row mt-4">

				<div class="col-md-12">

					<div class="card-columns">

						<!-- traversing products -->
						<%
						for (Product p : plist) {
						%>

						<div class="card">
							<div class="container text-center">
								<img src="img/products/<%=p.getpPhoto()%>"
									style="max-height: 200px; max-width: 100%; width: auto;"
									class="card-img-top m-2 " alt="image not found">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=p.getpName()%></h5>
								<p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
							</div>

							<div class="card-footer">
								<button type="submit"
									class="btn btn-primary btn-outline-success">Add to
									Cart</button>
								<button class="btn btn-outline-primary">
									&#x20B9;
									<%=p.getpPrice()%></button>

							</div>

						</div>

						<%
						}
						%>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>
