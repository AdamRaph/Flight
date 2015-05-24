function adminusecase(option){
    switch(option){
        case 0:
            $('#sec1').hide();
            $('#home,#sec0').show();
            $('#m1').removeClass('list-group-item-info');
            break;
        case 1:
            $('#home,#sec0').hide();
            $('#sec1').show();
            $('#m1').addClass('list-group-item-info');
            break;
    }
}

function smusecase(option){
    switch(option){
        case 0:
            $('#sec1,#sec2').hide();
            $('#home,#sec0').show();
            $('#m1,#m2').removeClass('list-group-item-info');
            break;
        case 1:
            $('#home,#sec0,#sec2').hide();
            $('#sec1').show();
            $('#m1').addClass('list-group-item-info');
            $('#m2').removeClass('list-group-item-info');
            getinventorylist1();
            break;
        case 2:
            $('#home,#sec0,#sec1').hide();
            $('#sec2').show();
            $('#m2').addClass('list-group-item-info');
            $('#m1').removeClass('list-group-item-info');    
            getinventorylist2();
            break;
        
    }
}

function getinventorylist1(){
    $.get('GetIvlist',
                function(response){
                    $('#listallin').html(response);
                }
            ).fail(function(){
                alert( "Getting failed." );
            });
}

function getinventorylist2(){
    $.get('GetIvlistII',
                function(response){
                    $('#listallinII').html(response);
                }
            ).fail(function(){
                alert( "Getting failed." );
            });
}

function fmusecase(option){
    switch(option){
        case 0:
            $('#sec1,#sec2,#sec3').hide();
            $('#home,#sec0').show();
            $('#m1,#m2,#m3').removeClass('list-group-item-info');
            break;
        case 1:
            $('#home,#sec0,#sec2,#sec3').hide();
            $('#sec1').show();
            $('#m1').addClass('list-group-item-info');
            $('#m2,#m3').removeClass('list-group-item-info');
            break;
        case 2:
            $('#home,#sec0,#sec1,#sec3').hide();
            $('#sec2').show();
            $('#m2').addClass('list-group-item-info');
            $('#m1,#m3').removeClass('list-group-item-info');
            
            $.get('profileaga',
                function(response){
                    $('#sec2').html(response);
                }
            ).fail(function(){
                alert( "Getting failed." );
            });
            break;
        case 3:
            $('#home,#sec0,#sec1,#sec2').hide();
            $('#sec3').show();
            $('#m3').addClass('list-group-item-info');
            $('#m1,#m2').removeClass('list-group-item-info');
            
            $.get('profilecus',
                function(response){
                    $('#sec3').html(response);
                }
            ).fail(function(){
                alert( "Getting failed." );
            });
            break;
    }
}

function confirmremove(itemID){
    document.getElementById("ditem").value = itemID;
}

function changeItem(itemID){
    var costid = itemID + "c";
    var availid = itemID + "a";
    
    document.getElementById("chitem").value = itemID;
    document.getElementById("ccost").value = document.getElementById(costid).innerHTML;
    var selectval = document.getElementById(availid).innerHTML;
    $("#cavail option[value='" + selectval  + "']").attr("selected","selected");
}

function changeAprofile(AgID){
    var onetime = true;
    if(onetime == true){
        $.get('Aprofilecenter', {
            AgentID : AgID
           }, function(response) {
                $('#AprofilePanel').html(response);
        }).fail(function(){
            alert( "Getting failed." );
        });
        onetime = false;
    }
}

function changeCprofile(cuID){
    var onetime = true;
    if(onetime == true){
        $.get('Cusprofilecenter', {
            CusID : cuID
           }, function(response) {
                $('#CprofilePanel').html(response);
        }).fail(function(){
            alert( "Getting failed." );
        });
        onetime = false;
    }
}

function cususecase(option){
    switch(option){
        case 0:
            $('#sec1,#sec2,#sec3,#sec4,#sec5,#sec6,#sec7').hide();
            $('#m1,#m2,#m3,#m4,#m5,#m6,#m7').removeClass('list-group-item-info');
            $('#home,#sec0').show();
            break;
        case 1:
            $('#home,#sec0,#sec2,#sec3,#sec4,#sec5,#sec6,#sec7').hide();
            $('#m1').addClass('list-group-item-info');
            $('#m2,#m3,#m4,#m5,#m6,#m7').removeClass('list-group-item-info');
            $('#sec1').show();
            break;
        case 2:
            $('#home,#sec0,#sec1,#sec3,#sec4,#sec5,#sec6,#sec7').hide();
            $('#m2').addClass('list-group-item-info');
            $('#m1,#m3,#m4,#m5,#m6,#m7').removeClass('list-group-item-info');
            $('#sec2').show();
            break;
        case 3:
            $('#home,#sec0,#sec1,#sec2,#sec4,#sec5,#sec6,#sec7').hide();
            $('#m3').addClass('list-group-item-info');
            $('#m1,#m2,#m4,#m5,#m6,#m7').removeClass('list-group-item-info');
            $('#sec3').show();
            break;
        case 4:
            $('#home,#sec0,#sec1,#sec2,#sec3,#sec5,#sec6,#sec7').hide();
            $('#m4').addClass('list-group-item-info');
            $('#m1,#m2,#m3,#m5,#m6,#m7').removeClass('list-group-item-info');
            $('#sec4').show();
            break;
        case 5:
            $('#home,#sec0,#sec1,#sec2,#sec3,#sec4,#sec6,#sec7').hide();
            $('#m5').addClass('list-group-item-info');
            $('#m1,#m2,#m3,#m4,#m6,#m7').removeClass('list-group-item-info');
            $('#sec5').show();
            break;
        case 6:
            $('#home,#sec0,#sec1,#sec2,#sec3,#sec4,#sec5,#sec7').hide();
            $('#m6').addClass('list-group-item-info');
            $('#m1,#m2,#m3,#m4,#m5,#m7').removeClass('list-group-item-info');
            $('#sec6').show();
            break;
        case 7:
            $('#home,#sec0,#sec1,#sec2,#sec3,#sec4,#sec5,#sec6').hide();
            $('#m7').addClass('list-group-item-info');
            $('#m1,#m2,#m3,#m4,#m5,#m6').removeClass('list-group-item-info');
            $('#sec7').show();
            break;
    }
}

function checkform(){
     
    var p1 = document.getElementById('inputPassword').value;
    var p2 = document.getElementById('inputConfirmPassword').value;
        
        if(p1 != p2){
            document.getElementById('info').innerHTML = "<span class='label label-warning'><b>make sure two password are same<b></span>";
            return false;
        }
        else{
            return true;
        }
}

function checkcard(){
    var type = document.getElementById('cretype').value;
    var num = document.getElementById('ccn').value;
    var warning = document.getElementById('info');
    
    if(type == "jcb" && num.length != 16){
        warning.innerHTML = "<span class='label label-warning'><b>there should be 16 digits<b></span>";
    }
    else if(type == "americanexpress" && num.length != 15){
        warning.innerHTML = "<span class='label label-warning'><b>there should be 15 digits<b></span>";
    }
    else if(type == "bankcard" && num.length != 16){
        warning.innerHTML = "<span class='label label-warning'><b>there should be 16 digits<b></span>";
    }
    else if(type == "maestro" && num.length != 18){
        warning.innerHTML = "<span class='label label-warning'><b>there should be 18 digits<b></span>";
        return false;
    }
    else if(type == "visa-electron" && num.length != 16){
        warning.innerHTML = "<span class='label label-warning'><b>there should be 16 digits<b></span>";
    }
    else if(type == "diners-club-carte-blanche" && num.length != 14){
        warning.innerHTML = "<span class='label label-warning'><b>there should be 14 digits<b></span>";
    }
    else if(type == "switch" && num.length != 19){
        warning.innerHTML = "<span class='label label-warning'><b>there should be 19 digits<b></span>";
    }
    else if(type == "solo" && num.length != 19){
        warning.innerHTML = "<span class='label label-warning'><b>there should be 19 digits<b></span>";
    }
    else if(type == "china-unionpay" && num.length != 16){
        warning.innerHTML = "<span class='label label-warning'><b>there should be 16 digits<b></span>";
    }
    else if(type == "laser" && num.length != 19){
        warning.innerHTML = "<span class='label label-warning'><b>there should be 19 digits<b></span>";
    }  
}
