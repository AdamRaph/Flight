$(document).ready(function(){
    $('#customerprofile').submit(function(){
          
        $.post('Cusprofilecenter', $(this).serialize(), function(data){          
            alert("successfull create profile for an angancy");
             
        }).fail(function() {         
            alert( "Posting failed." );
             
        });
        return false; 
    });
});


