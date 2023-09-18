import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["form", "list"];

  connect() {
    console.log("hello from insert-in-list controller");
    console.log(this.formTarget);
    console.log(this.listTarget);
  }

  adder(event) {
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { Accept: "application/json" },
      body: new FormData(this.formTarget),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
      });
  }
}
