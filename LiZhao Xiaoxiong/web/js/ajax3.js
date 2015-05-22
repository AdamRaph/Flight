$(document).ready(function(){
    $('#creroles').submit(function(){
          
        $.post('CreateManager', $(this).serialize(), function(data){
           
            alert("successfull create roles in this enterprise");
             
        }).fail(function() {         
            alert( "Posting failed." );
             
        });
        return false; 
    });
});


