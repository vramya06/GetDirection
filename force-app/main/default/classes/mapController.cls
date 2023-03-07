public class mapController {
    public static Map<String, Object> getDirections(String origin, String dest, String mode) {
        // Declare a variable to hold the API key value
        String apiKey = 'AIzaSyDAk2NP2HNtUt91VQ7Y0cc7WTrJ9kNVQOo';
        
        // Query for the Google Maps API key value from the custom setting
        List<GoogleMapsAPIKey__c> keys = [SELECT API_Key__c FROM GoogleMapsAPIKey__c];
        if (keys.size() > 0) {
            apiKey = keys[0].API_Key__c;
        }
        
        // Construct the API endpoint URL with the API key parameter
        String endpointUrl = 'https://maps.googleapis.com/maps/api/directions/json?origin=' 
            + EncodingUtil.urlEncode(origin, 'UTF-8') 
            + '&destination=' 
            + EncodingUtil.urlEncode(dest, 'UTF-8') 
            + '&mode=' 
            + mode 
            + '&key=' 
            + apiKey;
    
        // Create an HTTP request to call the Google Maps API
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(endpointUrl);
    
        // Send the HTTP request and handle the response
        Http http = new Http();
        HttpResponse res = http.send(req);
    
        // Parse the JSON response to extract the distance and travel time
        JSONParser parser = JSON.createParser(res.getBody());
        Double distance = null;
        Integer duration = null;
        while (parser.nextToken() != null) {
            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'distance')) {
                parser.nextToken();
                distance = Double.valueOf(parser.getText());
            } else if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'duration')) {
                parser.nextToken();
                duration = Integer.valueOf(parser.getText());
            }
        }
    
        // Calculate the cost of travel based on the fixed rates per mile stored in the custom metadata type
        Double ratePerMile = 0.0;
        List<Travel_Rate__mdt> rates = [SELECT Mode__c, Rate_Per_Mile__c FROM Travel_Rate__mdt];
        for (Travel_Rate__mdt rate : rates) {
            if (rate.Mode__c == mode) {
                ratePerMile = rate.Rate_Per_Mile__c;
            }
        }
        Double cost = distance * ratePerMile;
    
        // Return the results as a map
        Map<String, Object> result = new Map<String, Object>();
        result.put('distance', distance);
        result.put('duration', duration);
        result.put('cost', cost);
        return result;
    }
}
