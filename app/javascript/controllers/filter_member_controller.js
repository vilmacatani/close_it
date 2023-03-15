
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

    const cards = document.querySelectorAll(".card-height")
    const details = document.querySelectorAll(".card-left-member")

    cards.forEach(card => {

      const memberId = card.dataset.member;
      const cardMemberDescription = document.querySelector(`.card-height-${memberId}`);

      card.addEventListener('mouseover', () => {
        details.forEach((detailCard) => {
          if (detailCard.dataset.member === card.dataset.member) {
            // console.log(detailCard.class)
            detailCard.classList.remove('d-none')
          }
        });
      });

      card.addEventListener("mouseout", () => {
        details.forEach((detailCard) => {
          if (detailCard.dataset.member === card.dataset.member) {
            // console.log(detailCard.class)
            detailCard.classList.add('d-none')
          }
        });
      });
    });

  }
}
