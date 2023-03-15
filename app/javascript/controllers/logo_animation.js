import { Controller } from "@hotwired/stimulus"

const animation = bodymovin.loadAnimation({
  container: document.getElementById('animation-log-in'),
  rederer: 'svg',
  autoplay: true,
  path: 'data.json'
})
