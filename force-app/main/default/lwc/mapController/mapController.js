import { LightningElement ,wire, track } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
//import getDirections from '@salesforce/apex/mapController.getDirections';

export default class MapComponent extends LightningElement {
    originAddress = '';
    destinationAddress = '';
    @track origin;
    @track destination;
    @track mode;
    @track distance;
    @track duration;
    @track cost;
    googleInitialized = false;

    connectedCallback() {
        if (!this.googleInitialized) {
            loadScript(this, 'https://maps.googleapis.com/maps/api/js?key=AIzaSyCtw7rbvu3I4V1N6fnz06XgeJZ6WijPv8U&libraries=places')
                .then(() => {
                    this.googleInitialized = true;
                    const originInputField = this.template.querySelector('[data-id="originInput"]');
                    const destinationInputField = this.template.querySelector('[data-id="destinationInput"]');
                    const originAutocomplete = new google.maps.places.Autocomplete(originInputField);
                    const destinationAutocomplete = new google.maps.places.Autocomplete(destinationInputField);
                })
                .catch(error => {
                    console.error(error);
                });
        }
    }

    handleOriginChange(event) {
        this.originAddress = event.target.value;
    }
    
    handleDestinationChange(event) {
        this.destinationAddress = event.target.value;
    }

    handleModeChange(event) {
        this.mode = event.target.value;
    }

    handleGetDirections() {
        getDirections({ origin: this.originAddress, destination: this.destinationAddress, mode: this.mode })
            .then(result => {
                this.distance = result.distance;
                this.duration = result.duration;
                this.cost = result.cost;
            })
            .catch(error => {
                console.error(error);
            });
    }
}
