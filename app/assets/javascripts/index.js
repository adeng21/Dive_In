$(function(){
  $('#category-all a').mouseover(changeImage);
});

function changeImage(event){
  $target = $(event.target);
  $imageUrl = $target.attr('data-image');
  url = '/categories' + $imageUrl.slice($imageUrl.lastIndexOf('/'));
  $('#category').css('background-image', 'url("assets'+ url + '")');
}
