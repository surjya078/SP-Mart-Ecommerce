
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
    
     <%@include file="components/navbar.jsp" %>
    
        <div class="container-fluid">
            <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <div class="card border-info ">
                <%@include file="components/message.jsp" %>
                    <div class="card-body px-5">

                        <div class="container text-center">
                            <img src="img/register.jpg" style="max-width: 150px;" class="img-fluid" alt="image not found">
                        </div>

                        <h3 class="text-center my-3">Sign Up Here...</h3>
                        <form action="RegisterServlet" method="post">
                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter your username" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>

                            <div class="form-group">
                                <label for="email">User Email</label>
                                <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter your email" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>

                            <div class="form-group">
                                <label for="password">User Password</label>
                                <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter your password" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>

                            <div class="form-group">
                                <label for="phone">User Phone no</label>
                                <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter your phone no" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>

                            <div class="form-group">
                                <label for="phone">User Address</label>
                                <textarea name="user_address" style="height: 200px;" class="form-control" placeholder="Enter your Address"></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button class="btn btn-outline-warning" type="reset">Reset</button>
                            </div>
                        </form>


                    </div>
                </div>
            </div>
        </div>

        </div>
    </body>
</html>
