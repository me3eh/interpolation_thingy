import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js";

//data-controller="switch-between-amount"
export default class extends Controller {
    static targets = ["input", "first", "second"]
    connect() { }

    async rerender(){
        const params = {
            amount: this.inputTarget.value,
            first: this.firstTarget.value,
            second: this.secondTarget.value,

        };
        this.urlPing = `/cold_rainbow/reload`;
        console.log(this.urlPing)
        console.log(this.urlPing)
        const response = await post(this.urlPing, {
            body: params,
            contentType: 'application/json',
            responseKind: 'turbo-stream'
        });
        if (response.ok) {
            console.log('all good', response);
        }
    }

    async rerender_without_contrast(){
        const params = {
            amount: this.inputTarget.value,
            first: this.firstTarget.value,
            second: this.secondTarget.value,

        };
        this.urlPing = `/cold_rainbow/reload_without_contrast`;
        console.log(this.urlPing)
        console.log(this.urlPing)
        const response = await post(this.urlPing, {
            body: params,
            contentType: 'application/json',
            responseKind: 'turbo-stream'
        });
        if (response.ok) {
            console.log('all good', response);
        }
    }
}
