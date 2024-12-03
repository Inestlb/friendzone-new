import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["JoinButton"];

  connect() {
    console.log("hello");
  }

  click(event) {

    const button = event.currentTarget;

    button.classList.toggle("green");

    if (button.classList.contains("green")) {
      button.innerHTML = `<i class="fa-solid fa-check" style="color: #161032;"></i> Participating!`;
    } else {
      button.innerHTML = `<i class="fa-solid fa-user" style="color: #ffffff;"></i> Join the event`;
    }
  }
}
