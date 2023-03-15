import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cards-show"
export default class extends Controller {
  connect() {

    const cards = document.querySelectorAll(".card-height")
    const details = document.querySelectorAll(".card-left-details")

    cards.forEach(card => {

      const startupId = card.dataset.startup;
      const cardLeftDetails = document.querySelector(`.card-height-${startupId}`);

      card.addEventListener('mouseover', () => {
        details.forEach((detailCard) => {
          if (detailCard.dataset.startup === card.dataset.startup) {
            // console.log(detailCard.class)
            detailCard.classList.remove('d-none')
          }
        });
      });

      card.addEventListener("mouseout", () => {
        details.forEach((detailCard) => {
          if (detailCard.dataset.startup === card.dataset.startup) {
            // console.log(detailCard.class)
            detailCard.classList.add('d-none')
          }
        });
      });
    });

  }
}
