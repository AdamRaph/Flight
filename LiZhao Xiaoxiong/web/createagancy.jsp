<%-- 
    Document   : createagancy
    Created on : 22-May-2015, 12:54:44
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form class="form-control" id="createaga">
    <label for="traname">Travel Agancy</label>
    <input class="form-control" type="text" name="traname" id="traname" required>
    
    <label for="aph">phone
        <div id="aph" class="col-md-6 col-xs-3">
            <div class="col-md-1 col-xs-1"> 
                <input class="form-group" name="dis" type="text" required>
            </div>
            <div class="col-md-5 col-xs-2">
                <input class="form-group" name="phnum"  type="text" required>
            </div>           
        </div></label>
    
    <label for="aemail">Email</label>
    <input id="aemail" class="form-control" type="email" name="aemail" required>
    
    <input type="submit" class="form-control" value="Create Agancy">
</form>
<script type="text/javascript" src="js/ajax4.js"></script>
