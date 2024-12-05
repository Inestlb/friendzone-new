import { Controller } from "@hotwired/stimulus"

// doc librarie [https://github.com/catdad/canvas-confetti]

// Connects to data-controller="confetti"
export default class extends Controller {
  static values = { duration: Number }
  connect() {
    this.duration = this.durationValue
    // this.sendConfetti()
  }

  sendConfetti() {
    // initialisation des variables qui serviront de conditions pour arrêter automatiquement l'animation
    const end = Date.now() + this.duration;

    // création du canvas dans lequel on va faire apparaitre les confetti
    const myCanvas = document.createElement('canvas');
    this.element.appendChild(myCanvas);

    // css pour le placement du canva sur la page
    Object.assign(myCanvas.style, {
      position: 'fixed',
      top: '0',
      left: '0',
      width: '100%',
      height: '100%',
      // pouvoir toujours intéragir avec le reste de la page (cliquer sur ou en dehors de la modale)
      pointerEvents: 'none',
      zIndex: '9999'
    });

    // resize du canvas pour qu'il prenne toujours toute la page
    myCanvas.width = window.innerWidth;
    myCanvas.height = window.innerHeight;

    // creation de l'objet confetti, récupère la promise pour pouvoir interagir dessus ensuite
    this.myConfetti = confetti.create(myCanvas);

    // array pour stocker les animations qui sont lancées
    this.animationFrames = [];

    const frame = () => {
      // lance confetti a un endroit random
      this.myConfetti({
        particleCount: 10,
        startVelocity: 20,
        spread: 400,
        origin: {
          x: Math.random(),
          y: Math.random()
        }
      });

      // condition pour voir si l'on relance une animation => équivalent du setInterval
      if (Date.now() < end) {
        // lance une animation conserve son id dans l'array
        const frameId = requestAnimationFrame(frame);
        this.animationFrames.push(frameId);
      }
    };

    // appel de la function pour la première fois
    frame()
  }

  stopAnimation() {
    // on arrête l'animation
    this.myConfetti.reset();

    // on arrête toute les animation en cours
    this.animationFrames.forEach((frameId) => cancelAnimationFrame(frameId));
    // réinitialise pour la prochaine fois
    this.animationFrames = [];
  }
}
