$(document).ready(function(){
    $('#createaga').submit(function(){
          
        $.post('profileaga', $(this).serialize(), function(data){          
            alert("successfull create profile for an angancy");
             
        }).fail(function() {         
            alert( "Posting failed." );
             
        });
        return false; 
    });
});


