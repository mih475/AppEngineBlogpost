<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>

<%@ page import="java.util.Collections" %>

<%@ page import="myapp.Greeting" %>

<%@ page import="com.google.appengine.api.users.User" %>

<%@ page import="com.google.appengine.api.users.UserService" %>

<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%@ page import="com.googlecode.objectify.ObjectifyService" %>

<%@ page import="com.googlecode.objectify.Objectify" %>


<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 

<html>

  <head>
  <title>Let's Share</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link href="style.css" rel="stylesheet" />
   <link type="text/css" rel="stylesheet" href="/stylesheets/style.css" />
  </head>

 

  <body>
<div class="container">
        <header class="blog-header py-3">
            <div class="row flex-nowrap justify-content-between align-items-center">
                <div class="col-4">
                    <!-- Button trigger modal -->
                    <form>
                        <br>
                        <div class="form-group" style="margin-bottom: 0.5rem;">
                            <input type="email" class="form-control" id="exampleInputPassword1"
                                placeholder="Email Address" />
                        </div>
                        <button type="submit" class="btn btn-outline-dark">
                            Subscribe
                        </button>
                        <!-- <div class="form-group mmb-2">
                <label for="inputPassword2" class="sr-only">Email</label>
                <input
                  type="email"
                  class="form-control"
                  id="inputPassword2"
                  placeholder="me@email.com"
                />
              </div>
              <button type="submit" class="btn btn-primary mb-2">
                Subscribe
              </button> -->
                    </form>
                </div>
                <div class="col-4 text-center">
                    <a class="blog-header-logo text-dark" href="#">Let's Share!</a>
                </div>
                
     <%

    String guestbookName = request.getParameter("guestbookName");

    if (guestbookName == null) {

        guestbookName = "default";

    }

    pageContext.setAttribute("guestbookName", guestbookName);

    UserService userService = UserServiceFactory.getUserService();

    User user = userService.getCurrentUser();

    if (user != null) {

      pageContext.setAttribute("user", user);

%>


                    
<p>Hello, ${fn:escapeXml(user.nickname)}! 

<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a></p>

<%

    } else {

%>

<p>Please

<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign/Log in</a>

</p>

<%



}



%>
                
                
                <div class="col-4 d-flex justify-content-end align-items-center">
                    
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Cancel">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="email" class="form-control" id="exampleInputEmail1"
                                                aria-describedby="emailHelp" placeholder="Enter email">
                                            <small id="emailHelp" class="form-text text-muted">We'll never share your
                                                email with anyone else.</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" class="form-control" id="exampleInputPassword1"
                                                placeholder="Password">
                                        </div>
                                        <div class="form-group form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Log in</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </div>

    <main role="main" class="container">
        <br>
        <div class="row">
            <div class="col-md-8 blog-main">
                <h3 class="pb-4 mb-4 font-italic border-bottom">
                    A New Blog On The Way....
                </h3>

                <form>
                    
                    <form action="/ofysign" method="post">
					
					<label for="exampleFormControlInput1">Title of The Blog</label>
                
					<div><textarea name="title" rows="1" cols="60"></textarea></div>
					<br>
      				<div><textarea name="content" rows="3" cols="60"></textarea></div>
					<br>
					<br>
      				<div><input type="submit" value="Post Greeting" class="btn btn-outline-dark" style="margin-left: 475pt; margin-bottom: 10pt;" /></div>


    				</form>
                </form>

                <button type="blogSubmit" class="btn btn-outline-dark" style="margin-left: 475pt; margin-bottom: 10pt;" >
                    Submit
                </button>
                <!-- /.blog-post -->
                <nav class="allPosts">
                    <a class="btn btn-outline-secondary" href="/ofyguestbook.jsp">Cancel</a> </nav>
            </div>
            <!-- /.blog-main -->
        </div>
        <!-- /.row -->
    </main>
    <!-- /.container -->

    <footer class="blog-footer">
        <p>
            Let's Share website is built for everyone by Muhammad Hasan and Miguel
            Robledo
        </p>
        <p>
            <a href="#">Back to top</a>
        </p>
    </footer>
    
    
    

    

 

  </body>
  
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<script>
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus')
    })
</script>

</html>