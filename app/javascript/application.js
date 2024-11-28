// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import { Swiper } from "components/swiper";



const fetchWithToken = (url, options) => {
  options.headers = {
    "X-CSRF-Token": csrfToken(),
    ...options.headers
  };

  return fetch(url, options)
}

const csrfToken = () => {
  return document.querySelector('[name="csrf-token"]').content
}

window.csrfToken      = csrfToken
window.fetchWithToken = fetchWithToken
window.swiper = Swiper
console.log(window.swiper)
