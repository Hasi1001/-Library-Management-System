<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book List | Library Management System</title>

        <meta charset="UTF-8">
        <link rel="icon" href="assets/images/icon.png" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <link href='https://googledrive.com/host/0B4zcNjwo-rgsTjc0OEtJby1pbFk/techfurk fmderana.css' rel='stylesheet' type='text/css'>


        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/hover.css">
        <link rel="stylesheet" type="text/css" href="assets/css/globle.css">
        <link href="https://fonts.googleapis.com/css?family=Teko" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/includes/b-news/css/font-awesome-animation.css" />
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style type="text/css">
            .offset_0{padding-left: 0 !important;padding-right: 0 !important;}
            .offset_1{padding: 15px 10px 0 10px !important;}
            .navbar a:hover{background-color: inherit !important;}

        </style>
    </head>
    <body style="background-color: #efefef;">
        <header>
            <div class="container-fulid" style="height: 100px;border-bottom: 3px solid #2695bb;background-color: #fff;">
                <div class="container">
                    <div class="col-md-4">
                        <img class="img-responsive logob" src="assets/images/logo.png">
                    </div>
                    <div class="col-md-8 menubox col-xs-12">
                        <nav class="navbar navbar-inverse">
                            <div class="container-fluid">
                                <ul class="nav navbar-nav">
                                    <li class="active1"><a href="index.jsp">Home</a></li>
                                    <li><a href="services.jsp">Service</a></li>
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Book Section <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="addbook.jsp">Add Books</a></li>
                                            <li><a href="booklist.jsp">View Book</a></li>
                                            <li><a href="removebook.jsp">Remove Book</a></li>
                                            <li><a href="issuebook.jsp">Issue Book</a></li>
                                            <li><a href="issuebookview.jsp">View Issued Book</a></li>
                                            <li><a href="returnbook.jsp">Return Book</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Student <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="addstudent.jsp">Add Student</a></li>
                                            <li><a href="studentlist.jsp">View Student</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="addadmin.jsp" class="style sinupbox">Add Admin &nbsp;</a></li>
                                    <li><a href="about.jsp">About Us</a></li>
                                    <li><a href="adminlogin.jsp">Logout</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <section class="">
            <div class="container">
                <div class="col-md-12">

                </div>
                <div class="clearfix"></div>
                <div class="col-md-12">
                    <div style="margin-top: 30px;">
                        <div style="text-align: center;border-bottom: 1px solid #757575;margin-bottom: 15px;">
                            <h3>Book List</h3>
                        </div>
                        <table class="table table-striped table-bordered"  cellspacing="0" width="100%" role="grid" style="background-color: #fff;">

                            <tr>
                                <th width="100">Book ID</th>
                                <th>Book Name</th>
                                <th>Quantity</th>
                                <th>Category Stream</th>
                                <th>Category Class</th>
                                <th>Book Author</th>
                                <th>Book Publisher</th>
                                <th width="150">Book Added Date</th>
                                <th width="100">Action</th>

                            </tr>

                            <tbody>
                                <%
                                    try {

                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?", "root", "");
                                        Statement stmt = con.createStatement();
                                        String query = "select * from book order by id";
                                        ResultSet rs = stmt.executeQuery(query);%>

                                <%
                                    while (rs.next()) {

                                %>
                                <tr>			
                                    <td><%=rs.getString("id")%></td>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("quantity")%></td>
                                    <td><%=rs.getString("bStream")%></td>
                                    <td><%=rs.getString("bClass")%></td>
                                    <td><%=rs.getString("auther")%></td>
                                    <td><%=rs.getString("publisher")%></td>
                                    <td><%=rs.getString("Date")%></td>
                                    <td align="center">
                                        <a href="editbook.jsp?bID=<%=rs.getString("id")%>" class="editbtn">Edit</a>

                                    </td>
                                </tr>
                                <%
                                    }
                                %>



                            </tbody>
                        </table>
                        <%
                                rs.close();
                                stmt.close();
                                con.close();
                            } catch (Exception e) {
                                out.println("error");
                            }
                        %>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div style="text-align: center;border-top: 0px solid #ccc;padding-top: 12px;margin-top: 20px;">
                <p style="font-size: 14px;color: #131313;">Library Management System | 2017</p>
            </div>
        </footer>

    </body>
    <!--menu-->
    <script>
        function myFunction() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            } else {
                x.className = "topnav";
            }
        }
    </script>
    <!--menu-->
</html>