import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="animations"
export default class extends Controller {
  static targets = ["animation"]
  connect() {

    setTimeout(() => {
    this.animationTarget.classList.add("d-none")
    }, 4180);
  }
}
