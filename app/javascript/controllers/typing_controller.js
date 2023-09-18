import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

// Connects to data-controller="typing"
export default class extends Controller {
  static values = { strings: Array }

  connect() {
    console.log("hello from typing controller")
    new Typed(this.element, {
      strings: this.stringsValue,
      typeSpeed: 50
    });
  }
}
