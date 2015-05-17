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
    
}
