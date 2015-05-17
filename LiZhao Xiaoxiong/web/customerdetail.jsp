<%-- 
    Document   : customerdetail
    Created on : 12-May-2015, 13:44:44
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <div class="page-header">
        <h1>Personal details</h1>
    </div>
    
    <form class="form-group" method="post" action="" onSubmit="return checkform()">
        <div id="page1" class="col-md-12 col-xs-8">
            <label for="title" class="form-group">Title</label>
        <select id="title" name="title" class="form-group">
            <option>Ms</option>
            <option>Dr</option>
            <option>Rev</option>
            <option>Honorable</option>
            <option>Mrs</option>
        </select>
        <label for="lname" class="form-group">First name</label>
        <input id="lname" class="form-group" type="text" required>
        <label for="fname" class="form-group">Last name</label>
        <input id="fname" class="form-group" type="text" required><br>
        <div class="col-md-4 col-xs-2">
            <label class="radio control-label">Gender</label>
            <div class="radio form-group inline">
                <label><input type="radio" name="gender[]" required>Male</label>
            </div>
            <div class="radio form-group inline">
                <label><input type="radio" name="gender[]" required>Famale</label>
            </div>
        </div>
        
        <div class="col-xs-4 col-md-8">
            <fieldset class="form-group">
                <legend>DOB</legend>
                <div class="col-md-2 col-xs-1">
                    <label for="year" class="form-group"><input id="year" class="form-group" type="text" required>Year</label>
                </div>
                
                 <div class="col-md-2 col-xs-1">
                    <label for="month" class="form-group"><input id="month" class="form-group" type="text" required> Month</label>
                </div>
                
                 <div class="col-md-2 col-xs-1">
                    <label for="day" class="form-group"><input id="day" class="form-group" type="text" required>Day</label>
                </div>

            </fieldset>
        </div>
        
        <label for="ph">phone
        <div id="ph" class="col-md-6 col-xs-3">
            <div class="col-md-1 col-xs-1"> 
                <input class="form-group" name="di" type="text" required>
            </div>
            <div class="col-md-5 col-xs-2">
                <input class="form-group"  type="text" required>
            </div>           
        </div></label>
        
        
            <div class="col-md-6 col-xs-3">
                <label for="email">Email<input id="email" name="email" class="form-group"  type="email" required></label>
            </div>
        
        
        <div class="col-md-12 col-xs-8 ">            
            <div class="col-md-2 col-xs-1">
            <label for="sadd" class="form-group"><input id="sadd" class="form-group" type="text" required>Street Address</label>
        </div>
                   
        <div class="col-md-2 col-xs-1">
            <label for="state" class="form-group"><input id="state" class="form-group" type="text" >State</label>
        </div>
        
        <div class="col-md-2 col-xs-1">            
            <label for="city" class="form-group"><input id="city" class="form-group" type="text" required>City</label>
        </div>
        
        <div class="col-md-2 col-xs-1">          
            <label for="cou" class="form-group"><input id="cou" class="form-group" type="text" required><br>Country</label>
        </div>
        </div>
        
        <div class="col-md-12 col-xs-10">            
          <label class="radio control-label">Passport holder</label>
          <div class="radio form-group inline">
                <label><input type="radio" name="passport[]" required>No</label>
          </div>
          <div class="radio form-group inline">
                <label><input type="radio" name="passport[]" required>Yes</label>
          </div>                 
        </div>
        </div>
        <input type="submit" class="form-group" value="update personal">     
    </form>



