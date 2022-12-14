import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["email"]

    copy() {
        let email = this.emailTarget.textContent
        navigator.clipboard.writeText(email)
        document.getElementsByClassName("notice")[0].innerHTML= 'copied ' + email
    }
}