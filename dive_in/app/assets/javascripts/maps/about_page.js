var boxChildren = document.getElementById('about').getElementsByTagName('p');


$(document).ready(function(){
  $(boxChildren).hide().each(function(i){
    $(this).delay(4000* i).fadeIn('slow');
  });
});




