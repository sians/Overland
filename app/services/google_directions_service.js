
const fetchGoogleDirections = (origin, destination) => {
  const baseUrl = "https://maps.googleapis.com/maps/api/directions/json?";
  const apiKey = "AIzaSyAx4tUYlKCtVdaIPqdcMKcF0ZmjysUty3k";

  const searchString = `origin=${origin}&destination=${destination}&mode=transit&key=${apiKey}`;

  const url = baseUrl + searchString;
  const headers = {
    'headers':
      {
        'mode': 'cors',
        'Content-Type': "application/json",
        'Access-Control-Allow-Origin':"http://localhost:3000"
      }
    }
  fetch(url, headers)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    });
};

console.log(fetchGoogleDirections("Brooklyn", "Queens"));
