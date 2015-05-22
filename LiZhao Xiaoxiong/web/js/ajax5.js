$(document).ready(function(){
    $('#AprofilePanel').submit(function(){
          
        $.post('Aprofilecenter', $(this).serialize(), function(data){          
            alert("successfull create profile for an angancy");
             
        }).fail(function() {         
            alert( "Posting failed." );
             
        });
        return false; 
    });
});


