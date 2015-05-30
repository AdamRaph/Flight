function ajax14(){
    var onetime = true;
    $('#newplane').submit(function(){
        if(onetime == true){
        $.post('newplane', $('#newplane').serialize(), function(data){
            var id = document.getElementById("choosing").value;
            var idser = id + "i";
            document.getElementById(idser).innerHTML = data;
            onetime = false;
            alert("successfull create the route");
             
        }).fail(function() {  
            onetime = false;
            alert( "Posting failed." );
             
        });
        return false;
        }
    });
}

