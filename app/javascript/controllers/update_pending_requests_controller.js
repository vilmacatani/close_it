import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-pending-requests"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log("Heeeeeey ")
  }

  answer(e) {
    e.preventDefault()
    const url = `${this.formTarget.action}`
    fetch(url, {
      method: 'PATCH',
      headers: {
        "Accept": "text/plain"
      },
      body: new FormData(this.formTarget)
    })
    .then((response) => response.text())
    .then((data) => { this.formTarget.outerHTML = data });
  }
}
