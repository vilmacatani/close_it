import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-list"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log("Connected")
  }

  update() {
    console.log()
  }
}
