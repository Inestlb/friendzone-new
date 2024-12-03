import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="transition"
export default class extends Controller {
  static targets= ["content"];

  connect() {
    console.log(window.location.pathname === "/users/sign_in");

    if (window.location.pathname === "/users/sign_in") {
      this.contentTarget.classList.add("fade-in");
    }
  }

  fadeOut(event) {
    event.preventDefault();
    const url = event.currentTarget.getAttribute("href");

    this.contentTarget.classList.add("fade-out");

    // this.contentTarget.addEventListener(
    //   "animationend",
    //   () => {
    //   window.location.href = url;
    //   },
    //   { once: true}
    // );
    setTimeout(() => {
      window.location.href = url
    }, "1500")

    }
  }
