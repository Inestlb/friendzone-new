import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static targets = ["ShareButton"];

  connect() {
    console.log("hello");
  }

  click(event) {
    const button = event.currentTarget;
    console.log("click");
    button.classList.add("modal");
  }
}
