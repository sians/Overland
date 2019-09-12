
import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  console.log("hello")
  const typed = document.getElementById('404');
  new Typed(typed, {
    strings: ["Sometimes you take the road less travelled..", "We're not sure how you got here, but you should head "],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
