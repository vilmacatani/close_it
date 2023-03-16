import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="team-show"
export default class extends Controller {
  connect() {
    console.log("connected")
    const profileCards = document.querySelectorAll(".profile-card")

    profileCards.forEach(card => {

      const memberId = card.dataset.id;
      const infoId = document.querySelector(`.info-card-${memberId}`);
      console.log(infoId)

      card.addEventListener('mouseover', () => {
        infoId.classList.remove('d-none');
      });

      card.addEventListener("mouseout", () => {
        infoId.classList.add('d-none');
      });

    });

  }
}
