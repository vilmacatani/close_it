import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-list"
export default class extends Controller {
  connect() {
    console.log("I am here")
  }
}
