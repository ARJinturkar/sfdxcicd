import { LightningElement } from 'lwc';

export default class Lwcmodalone extends LightningElement {
    modalContainer
    
    isLoaded = false;
  
    renderedCallback() {
        if(this.isLoaded) return;
        const STYLE = document.createElement("style");
        STYLE.innerText = `.uiModal--medium .modal-container {
    width: 40%; !important
    max-width: 540px;
    min-width: 480px;
    max-width: 100%;
    min-width:100%;
}`;
this.template.querySelector('.hello').appendChild(STYLE);
this.isLoaded=true;
console.log('inside rendered call back');
}
    }
  