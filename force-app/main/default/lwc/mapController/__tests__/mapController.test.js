// Import the necessary modules for the test
import { createElement } from 'lwc';
import MapComponent from 'c/mapComponent';
import { registerApexTestWireAdapter } from '@salesforce/sfdx-lwc-jest';
import getTravelInfo from '@salesforce/apex/mapController.getTravelInfo';

// Create a mock implementation for the getTravelInfo Apex method
const getTravelInfoAdapter = registerApexTestWireAdapter(getTravelInfo);

// Create a mock HTTP response for the Google Maps API request
const mockHttpResponse = {
    status: 200,
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        "routes": [{
            "legs": [{
                "distance": {
                    "text": "50 mi",
                    "value": 80467
                },
                "duration": {
                    "text": "1 hour 30 mins",
                    "value": 5389
                }
            }]
        }]
    })
};

describe('c-map-component', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
        // Clear mocks to ensure isolation between tests
        jest.clearAllMocks();
    });

    it('displays the travel information correctly', () => {
        // Create the MapComponent element
        const element = createElement('c-map-component', {
            is: MapComponent
        });
        document.body.appendChild(element);

        // Set the input values for the origin and destination addresses
        const originInput = element.shadowRoot.querySelector('input[data-id="origin-input"]');
        originInput.value = '123 Main St, San Francisco, CA';
        const destInput = element.shadowRoot.querySelector('input[data-id="destination-input"]');
        destInput.value = '456 Oak St, San Francisco, CA';

        // Click the "Get Directions" button to call the Apex method and display the travel information
        const button = element.shadowRoot.querySelector('button[data-id="get-directions-button"]');
        button.click();

        // Return the mock HTTP response for the Google Maps API request
        getTravelInfoAdapter.emit(mockHttpResponse);

        // Ensure that the travel information is displayed correctly
        const distanceText = element.shadowRoot.querySelector('.distance-text').textContent;
        expect(distanceText).toBe('Distance: 50 mi');

        const travelTimeText = element.shadowRoot.querySelector('.travel-time-text').textContent;
        expect(travelTimeText).toBe('Travel Time: 1 hour 30 mins');

        const costText = element.shadowRoot.querySelector('.cost-text').textContent;
        expect(costText).toBe('Cost: $50.00');
    });
});
