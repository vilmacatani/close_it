import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-pending-requests"
export default class extends Controller {
  static targets = ["decline", "pending", "accepted"]
  connect() {
    console.log("Heeeeeey ")
  }

  answer(e) {
    e.preventDefault()
    console.log(this.declineTarget.action)

    // console.log(this.updateTarget)
    const url = `${this.declineTarget.action}/${e.currentTarget.dataset.id}`
    // fetch(url, {
    //   method: 'PATCH',
    //   headers: {
    //     "Content-Type": "application/json"
    //   },
    //   body: JSON.stringify({})
    // })


  }
}
