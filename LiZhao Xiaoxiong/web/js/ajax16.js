function ajax14(){
    var onetime = true;
    $('#delschform').submit(function(){
        if(onetime == true){
        $.post('delschedule', $('#delschform').serialize(), function(data){
            
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


