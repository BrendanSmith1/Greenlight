import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["button", "row"]

  connect() {
  }

  show(event) {
    // console.log(this.buttonTarget.innerHTML)
    this.rowTarget.classList.toggle("hidden")
    if (this.buttonTarget.innerHTML = "Show Updates") {
      this.buttonTarget.innerHTML = "Hide"
    } else {
      this.buttonTarget.innerHTML = "Show Updates"
    }
    console.log(event)
  }

  log(event) {
    console.log(event)
  }
}
