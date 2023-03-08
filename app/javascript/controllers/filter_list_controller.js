import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-list"
export default class extends Controller {
  static targets = ["list", "form", "funding", "industry", "country"]

  connect() {
    console.log("Connected")
    console.log(this.formTarget)
  }

  filter(e) {
    // e.preventDefault()

    function encodeQuery(data) {
      let query = data.url + '?'
      for (let d in data.params)
         query += encodeURIComponent(d) + '='
              + encodeURIComponent(data.params[d])
              .replace(/\(/g, '%28')
              .replace(/\)/g, '%29')
              .replace(/\%20/g, '+')
              + '&';
      return query.slice(0, -1)
    }

    const data = {
      url : this.formTarget.action,
      params : {
          'industry' : this.industryTarget.value,
          'country' : this.countryTarget.value,
          'funding' : this.fundingTarget.value
      }
    }

    const fullUrl = encodeQuery(data)
    fetch(fullUrl, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data
    })
  }


}
