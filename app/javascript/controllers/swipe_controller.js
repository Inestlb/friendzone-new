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
    this.modal = bootstrap.Modal.getInstance(this.modalTarget);
  }

  hideModal() {
    this.modal.hide()
  }

  swipeLeft(id){
	  const url     = `/matches`
    const options = {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
				"id": id,
				"liked": false
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
				"liker": current
			})
    }

    fetchWithToken(url, options)
    .then(response => response.json())
    .then(this.responseHandler.bind(this))
  }

  responseHandler(data) {
    if (data.content) {
      console.log("data")
      this.modalBodyTarget.innerHTML = data.content
      this.modal.show()
    }
  }
}
