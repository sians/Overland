// app/javascript/plugins/init_autocomplete.js
import places from 'places.js';

const initAutocomplete = () => {
  const addressInput1 = document.getElementById('start_city');
  const addressInput2 = document.getElementById('end_city');
  if (addressInput1) {
    places({ container: addressInput1 });
  };
  if (addressInput2) {
    places({ container: addressInput2 });
  }
};

export { initAutocomplete };


