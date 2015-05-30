function ajax11(){
    var onetime = true;
    $('#delair').submit(function(){
        if(onetime == true){
        $.post('deleteAir', $('#delair').serialize(), function(data){
            var rowid = document.getElementById("dairportid").value;
            var thisrow = document.getElementById(rowid);
            document.getElementById("planelist").removeChild(thisrow);
            onetime = false;
            alert("successfull delete airport");
             
        }).fail(function() {  
            onetime = false;
            alert( "Posting failed." );
             
        });
        return false;
        }
    });
}

