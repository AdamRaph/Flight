function ajax17(){
    var onetime = true;
    $('#confirmticket').submit(function(){
        if(onetime == true){
        $.post('newticket', $('#confirmticket').serialize(), function(data){
            
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

