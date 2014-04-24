function slowText(){
  var boxChildren = document.getElementById('about').getElementsByTagName('p');
  $(boxChildren).hide().each(function(i){
    $(this).delay(2000* i).fadeIn('slow');
  });
};





