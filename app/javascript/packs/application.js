import "bootstrap";
import { initAutocomplete } from "../plugins/init_autocomplete.js";
import "../plugins/flatpickr";

initAutocomplete();

import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }

  var flightPlanCoordinates = markers
  var flightPath = map.drawPolyline({
    path: flightPlanCoordinates,
    geodesic: true,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  flightPath.setMap(map);

  // var marker = new google.maps.Marker({
  //     position: element,
  //     map: map,
  //     draggable: true,
  //     animation: google.maps.Animation.DROP,
  //   });

  // marker.addListener('click', toggleBounce);
  //   function toggleBounce() {
  //     if (marker.getAnimation() !== null) {
  //       marker.setAnimation(null);
  //     } else {
  //       marker.setAnimation(google.maps.Animation.BOUNCE);
  //     }
  //   }

  // marker.addListener('click', function() {
  //   infowindow.open(map, marker);
  // });

}


const pagesJourneyConnnections = document.querySelectorAll(".pages-journey_connections")

if(pagesJourneyConnnections) {
  // const checkRecommendations = document.querySelectorAll(".btn-recommendations")
  // checkRecommendations.forEach((button) => {
  //   button.addEventListener("click", (event) => {
  //     console.log(event.currentTarget);
  //   });
  // });


}




