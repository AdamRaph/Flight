<%-- 
    Document   : customer
    Created on : 11-May-2015, 16:53:58
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"/>

<div class="container">
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
            <ul class="nav navbar-nav navbar-right">
                <li><a class="navbar-brand" href="#" onclick="cususecase(0)"><span class="glyphicon glyphicon-home"> HOME</span></a> </li>
                <li><a href="#menu-toggle" class="btn btn-info" id="menu-toggle"><span class="glyphicon glyphicon-pushpin"></span></a></li>
            </ul>                      
        </div>             
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">             
            <li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
    </nav>


    <div id="wrapper" class="">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav ">
                <br>
                <li  data-toggle="collapse" data-target="#booking" class="collapsed active">
                  <a href="#">Booking<span class="glyphicon glyphicon-menu-right"></span></a>
                </li>
                <ul class="collapse" id="booking">
                    <li id="m2">
                        <a href="#" onclick="cususecase(2)">Create booking</a>
                    </li>                    
                    <li id="m5">
                        <a href="#" onclick="cususecase(5)">Cancel flight booking</a>
                    </li>
                    <li id="m1">
                        <a href="#" onclick="cususecase(1)">Change seat</a>
                    </li>                
                </ul>
                
                <li  data-toggle="collapse" data-target="#flight" class="collapsed active">
                  <a href="#">Flight<span class="glyphicon glyphicon-menu-right"></span></a>
                </li>
                <ul class="collapse" id="flight">
                    <li id="m3">
                        <a href="#" onclick="cususecase(3)">Pay for flight</a>
                    </li>
                </ul>
                
                <li  data-toggle="collapse" data-target="#details" class="collapsed active">
                  <a href="#">Details<span class="glyphicon glyphicon-menu-right"></span></a>
                </li>
                <ul class="collapse" id="details">
                    <li id="m6">
                        <a href="#" onclick="cususecase(6)">update details<span class="glyphicon glyphicon-user"></span></a>
                    </li>
                    <li id="m7">
                        <a href="#" onclick="cususecase(7)">update creditcard info<span class="glyphicon glyphicon-credit-card"></span></a>
                    </li>
                </ul>  
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper" id="home">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-header">
                           <h1>welcome to our airline</h1>
                        </div>                                           
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

        <div class="col-xs-12 col4">
            <div id="sec0" >
                <div class="page-header">
                            <h1><%
                            HttpSession hs=request.getSession(true);  
                            String user = (String)hs.getAttribute("username");                         
            
                            out.println("Hello customer" + user);
                            %></h1>
                        </div> 
                    
                    <img src="images/customer.jpg" class="img-responsive" >
            </div>
            <div id="sec1" style="display: none;">
                <form class="customerop form-horizontal" method="post">
                    <label for="fn">fight number</label>
                    <input id="fn" type="text" class="form-control" placeholder="flight number">  
                    <button class="btn btn-lg btn-primary btn-block " type="submit">Choose Seat</button>
                </form>
                <form class="customerop form-horizontal" method="post">
                    <table class="table table-striped"><!--these should be jsp script return empty seat number-->
                        <tr>                    
                            <td>#1</td>
                             <td><div class="radio">
                                <input type="radio" name="optradio">
                            </div></td>
                        </tr>
                        <tr>                       
                            <td>#2</td>
                            <td><div class="radio disabled">
                                <input type="radio" name="optradio" disabled>
                            </div></td>
                        </tr>
                        <tr>                        
                            <td>#3</td>
                            <td><div class="radio">
                                <input type="radio" name="optradio">
                            </div></td>
                        </tr>
                    </table>
                    <button class="btn btn-lg btn-primary btn-block " type="submit">Change Seat</button>
                </form>
            </div>
            <div id="sec2"  style="display: none;">
               <!--jsp:include page="createbooking.jsp"/-->
                <!--jsp:include page="listscheduleforcus.jsp"/>/-->
            </div>
            <div id="sec3" style="display: none;">
                <h4>Group A Sub 3</h4>
            </div>           
            <div id="sec5" style="display: none;">
                <h4>Group A Sub 5</h4>
            </div>
            <div id="sec6" style="display: none;">     
                <jsp:include page="customerdetail.jsp"/>              
            </div>
            
            <div id="sec7" style="display: none;">
                <jsp:include page="creditcard.jsp"/>    
            </div>
        </section>
        </div>
        </div>
</div>
   
<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
</script>

<jsp:include page="footer.jsp"/>
