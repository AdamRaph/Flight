<%-- 
    Document   : creditcard
    Created on : 17-May-2015, 15:20:25
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form class="form-group" method="post" action="" onSubmit="return checkform()">
    <div id="page2" class="col-md-12 col-xs-8">
            <fieldset class="form-group">
                <legend>Credit Card Information</legend>
                <div class="col-md-4 col-xs-2">
                    <label for="cretype">Credite card Type
                    <select id="cretype" name="cretype" class="form-group">
                        <option>jcb</option>
                        <option>americanexpress</option>
                        <option>bankcard</option>
                        <option>maestro</option>
                        <option>visa-electron</option>
                        <option>diners-club-carte-blanche</option>
                        <option>switch</option>
                        <option>solo</option>laser
                        <option>china-unionpay</option>
                        <option>laser</option>
                    </select></label>
                </div>
                <div class="col-md-5 col-xs-2">
                    <label for="ccn">Credit card No.<input id="ccn" class="form-group"  type="text" required></label>
                </div>
            </fieldset>
        </div>
    <input type="submit" class="form-group" value="update credite card info"> 
</form>

        
