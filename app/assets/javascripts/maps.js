var map;
var infowindow;
var pos;

function initMap() {
  var myCoords = {lat: 0, lng:0};

  var customMapType = new google.maps.StyledMapType([
    {
      stylers: [
        {hue: '#890000'},
        {visibility: 'simplified'},
        {gamma: 0.5},
        {weight: 0.5}
      ]
    },
    {
      elementType: 'labels',
      stylers: [{visibility: 'off'}]
    },
    {
      featureType: 'water',
      stylers: [{color: '#3367D6'}]
    }
  ], {
    name: 'Custom Style'
  });
  var customMapTypeId = 'custom_style';

  map = new google.maps.Map(document.getElementById('map'), {
    center: myCoords,
    zoom:1,
    mapTypeControlOptions:{
    mapTypeIds: [google.maps.MapTypeId.ROADMAP, customMapTypeId]
    }
  });
    map.mapTypes.set(customMapTypeId, customMapType);
  map.setMapTypeId(customMapTypeId);


  infoWindow = new google.maps.InfoWindow({map: map});

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
    pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    };

      infoWindow.setPosition(pos);
      infoWindow.setContent('Your location.');
      map.setCenter(pos);
      map.setZoom(12);
      infowindow = new google.maps.InfoWindow();

      var service = new google.maps.places.PlacesService(map);

      service.nearbySearch({
        location: pos,
        radius: 5000,
        name: "game store"
      }, callback);

    }, function() {
    handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
      // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }

  function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
      'Error: The Geolocation service failed.' :
      'Error: Your browser doesn\'t support geolocation.');
  }
}

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}


function createMarker(place) {
  var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location,
    icon: image
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
}
