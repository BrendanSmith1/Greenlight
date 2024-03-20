import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["button", "row"]

  connect() {
  }

  show() {
    this.buttonTarget.innerText = 'Close';
    this.rowTarget.outerHTML = ""
  }
}
