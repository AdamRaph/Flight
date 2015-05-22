<%-- 
    Document   : createbooking
    Created on : 18-May-2015, 21:49:01
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form class="customerop form-horizontal" method="post">                   
                    <label for="dep">department airport:</label>
                    <select class="form-control" id="dep">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                    </select>
                    <label for="des">designation airport:</label>
                    <select class="form-control" id="des">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                    </select>
                    
                    <div class="radio">
                        <label><input type="radio" name="optradio">Flight 1</label>
                    </div>
                    <div class="radio">
                        <label><input type="radio" name="optradio">Flight 2</label>
                    </div>
                    <div class="radio disabled">
                        <label><input type="radio" name="optradio" disabled>Flight 3</label>
                    </div>
                    
                    <label><input type="date" class="form-control">choose date</label>
                    <button class="btn btn-lg btn-primary btn-block " type="submit">book flight</button>
</form>
