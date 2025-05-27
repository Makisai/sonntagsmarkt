import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {
  static targets = [ "form", "input" ]

    connect() {
    this.formTarget.addEventListener("turbo:submit-end", () => {
      this.inputTarget.focus()
    })
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 200)
  }
}
