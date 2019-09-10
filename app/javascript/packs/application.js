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
}



  // function initMap() {
  // var map = {markers[0].lat, markers[0].lng};
  // var map = new google.maps.Map(document.getElementById('map'), {
  // zoom: 4,
  // center: map
  // });

  // var contentString = '<div id="content">'+
  //           '<div id="siteNotice">'+
  //           '</div>'+
  //           `<h1 id="firstHeading" class="firstHeading">${}</h1>`+
  //           '<div id="bodyContent">'+
  //           '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
  //           'sandstone rock formation in the southern part of the '+
  //           'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
  //           'south west of the nearest large town, Alice Springs; 450&#160;km '+
  //           '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
  //           'features of the Uluru - Kata Tjuta National Park. Uluru is '+
  //           'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
  //           'Aboriginal people of the area. It has many springs, waterholes, '+
  //           'rock caves and ancient paintings. Uluru is listed as a World '+
  //           'Heritage Site.</p>'+
  //           '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
  //           'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
  //           '(last visited June 22, 2009).</p>'+
  //           '</div>'+
  //           '</div>';

  //       var infowindow = new google.maps.InfoWindow({
  //         content: contentString
  //       });

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


// var map, popup, Popup;

//   Popup = createPopupClass();
//   popup = new Popup(
//       new google.maps.LatLng(-33.866, 151.196),
//       document.getElementById('content'));
//   popup.setMap(map);

// const pagesJourneyConnnections = document.querySelectorAll(".pages-journey_connections")

// if(pagesJourneyConnnections) {
  // const checkRecommendations = document.querySelectorAll(".btn-recommendations")
  // checkRecommendations.forEach((button) => {
  //   button.addEventListener("click", (event) => {
  //     console.log(event.currentTarget);
  //   });
  // });


// }

