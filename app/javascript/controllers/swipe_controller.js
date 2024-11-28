import { Controller } from "@hotwired/stimulus"
import { Swiper } from "components/swiper";


export default class extends Controller {
  static targets = ["card", "modal", "modalBody"]

  connect() {
    this.initSwiper()
    this.initModal()
  }

  initSwiper() {
    new Swiper({
      cards: this.cardTargets,
      likedCallback: this.swipeRight.bind(this),
      dislikedCallback: this.swipeLeft.bind(this)
    })
  }

  initModal() {
    this.modalInstance = new bootstrap.Modal(this.modalTarget);
  }

  hideModal() {
    this.modal.hide()
  }

  swipeLeft(id, current){
	  const url     = `/likes`
    const options = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
				"liked": id,
        "liker": current,
				"is_liked": false
			})
    }
    fetchWithToken(url, options)
  }

  swipeRight(id, current){
    const url     = `/likes`
    const options = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
				"liked": id,
				"liker": current,
        "is_liked": true
			})
    }

    // fetchWithToken(url, options)
    // .then(response => response.json())
    // .then(this.responseHandler.bind(this))

    fetchWithToken(url, options)
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return response.json();
    })
    .then(json => {
      console.log("Response JSON:", json);

      if (json.match) {
        this.updateUIWithMatch(json);
      } else {
        console.log("No match yet.");
      }
    })
    .catch(error => {
      console.error("Fetch error:", error);
    });
  }

  updateUIWithMatch(json) {
    console.log(this.modalTarget);
    console.log(this.modalBodyTarget);
    this.modalInstance.show();
    this.modalBodyTarget.innerHTML = `
      <h5 class="modal-title text-center">🎉 Match Réussi ! 🎉</h5>
      <p>${json.message}</p>
      <div class="d-flex justify-content-end mt-3">
        <button class="btn btn-primary me-2" onclick="window.location.href='/messages'">Discuter</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Continuer à matcher</button>
      </div>
    `
    console.log(this.modalBodyTarget);
  }



  responseHandler(data) {
    if (data.content) {
      console.log("data")
      this.modalBodyTarget.innerHTML = data.content
      this.modalTarget.show()
    }
  }
}
