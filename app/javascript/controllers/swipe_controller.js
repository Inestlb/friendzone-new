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
      console.log("Response JSON:", json);

      if (json.match) {
        this.updateUIWithMatch(json);
        this.send_confetti()
      } else {
        console.log("No match yet.");
      }
    })
    .catch(error => {
      console.error("Fetch error:", error);
    });
  }



  updateUIWithMatch(json) {
    // console.log(this.modalTarget);
    console.log("hello");

    console.log(this.cardTarget.dataset.id);

    this.modalInstance.show();
    this.modalBodyTarget.innerHTML = `
      <h5 class="text-center">🎉 Match Réussi ! 🎉</h5>
      <p>${json.message}</p>
      <div class="d-flex justify-content-end mt-3">
        <button class="btn btn-primary me-2" onclick="window.location.href='/matches/${json.match_id}'">Discuter</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Continuer à matcher</button>
      </div>
    `
    console.log(this.modalBodyTarget);
    document.querySelector(".modal-backdrop").remove()
  }



  responseHandler(data) {
    if (data.content) {
      console.log("data")
      this.modalBodyTarget.innerHTML = data.content
      this.modalTarget.show()
    }
  }

  send_confetti() {
    let random = Math.random,
      cos = Math.cos,
      sin = Math.sin,
      PI = Math.PI,
      PI2 = PI * 2;

    let confetti = [];
    let running = true; // Animation control flag

    let particles = 10,
      spread = 40,
      sizeMin = 3,
      sizeMax = 12 - sizeMin,
      eccentricity = 10,
      deviation = 100,
      dxThetaMin = -0.1,
      dxThetaMax = -dxThetaMin - dxThetaMin,
      dyMin = 0.13,
      dyMax = 0.18,
      dThetaMin = 0.4,
      dThetaMax = 0.7 - dThetaMin;

    const colorThemes = [
      () => color(200 * random() | 0, 200 * random() | 0, 200 * random() | 0),
      () => {
        const black = 200 * random() | 0;
        return color(200, black, black);
      },
      () => {
        const black = 200 * random() | 0;
        return color(black, 200, black);
      },
      () => color(200 * random() | 0, 200, 200),
    ];

    function color(r, g, b) {
      return `rgb(${r},${g},${b})`;
    }

    // Create the overarching container
    const container = document.createElement('div');
    container.style.position = 'fixed';
    container.style.top = '0';
    container.style.left = '0';
    container.style.width = '100%';
    container.style.height = '0';
    container.style.overflow = 'visible';
    container.style.zIndex = '9999';

    // Confetto constructor
    function Confetto(theme) {
      this.frame = 0;
      this.outer = document.createElement('div');
      this.inner = document.createElement('div');
      this.outer.appendChild(this.inner);

      const outerStyle = this.outer.style,
        innerStyle = this.inner.style;
      outerStyle.position = 'absolute';
      outerStyle.width = `${sizeMin + sizeMax * random()}px`;
      outerStyle.height = `${sizeMin + sizeMax * random()}px`;
      innerStyle.width = '100%';
      innerStyle.height = '100%';
      innerStyle.backgroundColor = theme();

      this.x = window.innerWidth * random();
      this.y = -deviation;
      this.dx = sin(dxThetaMin + dxThetaMax * random());
      this.dy = dyMin + dyMax * random();
      outerStyle.left = `${this.x}px`;
      outerStyle.top = `${this.y}px`;

      this.update = (height, delta) => {
        this.x += this.dx * delta;
        this.y += this.dy * delta;
        outerStyle.left = `${this.x}px`;
        outerStyle.top = `${this.y}px`;
        return this.y > height + deviation; // Remove confetto if it falls out of view
      };
    }

    function addConfetto(theme) {
      const confetto = new Confetto(theme);
      confetti.push(confetto);
      container.appendChild(confetto.outer);
    }

    function startAnimation() {
      document.body.appendChild(container);

      let theme = colorThemes[0];
      let prev;

      function loop(timestamp) {
        if (!running) {
          // Stop the animation and clean up
          confetti.forEach((confetto) => {
            container.removeChild(confetto.outer);
          });
          confetti = [];
          document.body.removeChild(container);
          return;
        }

        const delta = prev ? timestamp - prev : 0;
        prev = timestamp;

        for (let i = confetti.length - 1; i >= 0; i--) {
          if (confetti[i].update(window.innerHeight, delta)) {
            container.removeChild(confetti[i].outer);
            confetti.splice(i, 1);
          }
        }

        if (confetti.length < particles) {
          addConfetto(theme);
        }

        requestAnimationFrame(loop);
      }

      requestAnimationFrame(loop);
    }

    // Stop the animation after 2 seconds
    setTimeout(() => {
      running = false;
    }, 8000);

    startAnimation();
  }

}
