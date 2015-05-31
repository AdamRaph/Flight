function ajax20(){
    var onetime = true;
    $('#payticket').submit(function(){
        if(onetime == true){
        $.post('Paybooking', $('#payticket').serialize(), function(data){
            var tkid = document.getElementById("paytkid").value;
            var tknum = tkid + "p";
            
            document.getElementById(tknum).innerHTML = data
            
            onetime = false;
            alert("successfull delete schedule");
             
        }).fail(function() {  
            onetime = false;
            alert( "Posting failed." );  
        });
        return false;
        }
    });
}


