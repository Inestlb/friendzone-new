import { Controller } from "@hotwired/stimulus"
import { Swiper } from "components/swiper";


export default class extends Controller {
  static targets = ["card", "modal", "modalBody"]

  connect() {
    this.initSwiper()
    this.initModal()

    this.running = true
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

      if (json.match) {
        this.updateUIWithMatch(json);
        this.dispatch("match")
      } else {
      }
    })
    .catch(error => {
    });
  }



  updateUIWithMatch(json) {
    this.modalInstance.show();
    this.modalBodyTarget.innerHTML = `
      <h5 class="text-center besties">🎉    BESTIES MATCHES    🎉</h5>
      <p>${json.message}</p>
      <div class="d-flex justify-content-end mt-3">
        <button class="btn btn-primary me-2 btn" onclick="window.location.href='/matches/${json.match_id}'">Discuss</button>
        <button class="btn btn-secondary btn" data-bs-dismiss="modal" data-action="click->confetti#stopAnimation">Continue to match</button>
      </div>
    `
    document.querySelector(".modal-backdrop").remove()
  }



  responseHandler(data) {
    if (data.content) {
      this.modalBodyTarget.innerHTML = data.content
      this.modalTarget.show()
    }
  }
}
