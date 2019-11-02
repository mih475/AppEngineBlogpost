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
  <title>Home</title>
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

        <div class="jumbotron p-3 p-md-5 text-white rounded bg-dark"
            style="background-image:url(share.jpg); background-size: 100%; background-position: bottom; opacity: 1">
            <div class="col-md-6 px-0">
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            </div>
        </div>

        <div class="row mb-2">
            
            <div class="col-md-4" style="margin-left: 120pt;">
                <div style="margin-left: 80pt; margin-top: 50pt;">
                    <a type="submit" class="btn btn-outline-dark" href="/postingBlog.jsp"
                        style="font-size: larger;">Share
                        Something!</a>
                </div>
                
            </div>
        </div>

    </div>

    
                    
                    
 




                    





 <main role="main" class="container">
        <div class="row">
            <div class="col-md-8 blog-main">
                <h3 class="pb-4 mb-4 font-italic border-bottom">
                    Recent Posts
                </h3>
                
<%

	ObjectifyService.register(Greeting.class);

	List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();   

	Collections.sort(greetings); 

    // Run an ancestor query to ensure we see the most up-to-date

    // view of the Greetings belonging to the selected Guestbook.

    if (greetings.isEmpty()) {

        %>

        <p>Website '${fn:escapeXml(guestbookName)}' has no messages.</p>

        <%

    } else {

        %>

        <p>Messages on Website '${fn:escapeXml(guestbookName)}'.</p>

        <%

        for (Greeting greeting : greetings) {

            pageContext.setAttribute("greeting_content",

                                     greeting.getContent());

            if (greeting.getUser() == null) {

                %>

                <p>An anonymous person wrote:</p>

                <%

            } else {

                pageContext.setAttribute("greeting_user",

                                         greeting.getUser());

                %>

                <p><b>${fn:escapeXml(greeting_user.nickname)}</b> wrote:</p>

                <%

            }

            %>

            <blockquote>${fn:escapeXml(greeting_content)}</blockquote>

            <%

        }

    }

%>
                <div class="blog-post">
                    <h2 class="blog-post-title">Sample blog post</h2>
                    <p class="blog-post-meta">
                        January 1, 2014 by <a href="#">Mark</a>
                    </p>

                    <p>
                        This blog post shows a few different types of content that’s
                        supported and styled with Bootstrap. Basic typography, images, and
                        code are all supported.
                    </p>
                </div>
                <!-- /.blog-post -->

                <div class="blog-post">
                    <h2 class="blog-post-title">Another blog post</h2>
                    <p class="blog-post-meta">
                        December 23, 2013 by <a href="#">Jacob</a>
                    </p>

                    <p>
                        Cum sociis natoque penatibus et magnis
                        <a href="#">dis parturient montes</a>, nascetur ridiculus mus.
                        Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis
                        vestibulum. Sed posuere consectetur est at lobortis. Cras mattis
                        consectetur purus sit amet fermentum.
                    </p>
                </div>
                <!-- /.blog-post -->

                <div class="blog-post">
                    <h2 class="blog-post-title">New feature</h2>
                    <p class="blog-post-meta">
                        December 14, 2013 by <a href="#">Chris</a>
                    </p>

                    <p></p>
                </div>
                <!-- /.blog-post -->
                <nav class="allPosts">
                    <a class="btn btn-outline-secondary" href="/ofyguestbook.jsp">See All Posts</a>
                </nav>
            </div>



 

                    
            <!-- /.blog-main -->

            <aside class="col-md-4 blog-sidebar">
                <div class="p-4 mb-3 bg-light rounded">
                    <h4 class="font-italic">About</h4>
                    <p class="mb-0">
                        Miguel and Muhammad created this website. Miguel is a Senior in
                        Electrical and Engineering at the University of Texas at Austin.
                        His initial interest in computers and technology had originated in
                        High School during sophomore year. Muhammad is a Senior in
                        Electrical and Computer Engineering at the University of Texas at
                        Austin. He is focusing on software development and minoring in
                        business. He wants to help or consult with people solving their
                        problems.
                    </p>
                </div>

                <div class="p-4">
                    <h4 class="font-italic">Elsewhere</h4>
                    <ol class="list-unstyled">
                        <li><a href="https://medium.com/">Medium</a></li>
                    </ol>
                </div>
            </aside>
            <!-- /.blog-sidebar -->
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