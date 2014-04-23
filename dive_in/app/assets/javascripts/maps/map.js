var mapObject;
var data;
var markers;

function makeMap(){
  $.get('/home.json', function(response){
  $('#world-map').vectorMap({
    backgroundColor: '#0B486B',
    zoomOnScroll: false,
    markerStyle: {
      initial: {
        fill: 'yellow',
        r: 8
      },
      hover: {
        'fill-opacity': 0.5
      },
    },
    regionStyle: {
      initial: {
        fill: '#79BD9A'
      },
      hover: {
        'fill-opacity': 0.5
      }
     },

    onRegionClick: function(event, code){
     mapZoom(event, code);
     addMarkers();
    },

    onMarkerClick: function(event, code){
      divesiteClick(code);
    }

  });

   mapObject = $('#world-map').vectorMap('get', 'mapObject');
   markers = response.markers;

  $(".jvectormap-zoomout").on('click', function(){
    mapObject.removeAllMarkers();
    mapObject.reset();
  });


  });
}

function mapZoom(event, code){
  mapObject.setFocus(code, 0.2, 0.2);
}

function addMarkers(){
  mapObject.addMarkers(markers, []);
}

function divesiteClick(code){
   window.location = 'divesites/' + markers[code].id;
}
