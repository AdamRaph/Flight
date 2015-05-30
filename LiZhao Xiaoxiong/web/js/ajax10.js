function ajax10(){
    var onetime = true;
    $('#newair').submit(function(){
        if(onetime == true){
        $.post('newAir', $('#newair').serialize(), function(data){
            var planelist = document.getElementById("planelist"),
                name = document.getElementById("airname"),
                city = document.getElementById("aircity"),
                country = document.getElementById("aircou"),
                itia = document.getElementById("airITIA"),          
                row = table.insertRow(),
                cell1 = row.insertCell(0),
                cell2 = row.insertCell(1),
                cell3 = row.insertCell(2),
                cell4 = row.insertCell(3),
                cell5 = row.insertCell(4);
                
                cell1.innerHTML = "<button onclick = 'confirmremoveair(" + data +")' type='button' class='btn btn-warning ' data-toggle='modal' data-target='#confirmreit' >remove</button>"
                cell2.innerHTML = name;
                cell3.innerHTML = city;
                cell4.innerHTML = country,
                cell5.innerHTML = itia;
            
            onetime = false;
            alert("successfull create airplane");
             
        }).fail(function() {  
            onetime = false;
            alert( "Posting failed." );
             
        });
        return false;
        }
    });
}


