public class AnimalsCallouts {
  // public static Integer currentPage = 1; 
    @AuraEnabled(cacheable=true)
    public static Map<String, Object> makeGetCallout() {
       
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        /* String url = 'https://rickandmortyapi.com/api/character?page='+currentPage; */
       
        //System.debug('response currentPage' + currentPage);
        request.setEndpoint('https://rickandmortyapi.com/api/character?page=1');

        request.setMethod('GET');
        HttpResponse response = http.send(request);
                
     /*    System.debug('response body' + response.getBody()); */
        
     /*    System.debug('response body' + response.getBody()); */
       /*  return response.getBody(); */
        
        // If the request is successful, parse the JSON response.
        Map<String, Object> results = new  Map<String, Object>(); 
         if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> characters = (List<Object>) results.get('results');
            System.debug('Received the following animals:');
            for(Object character: characters) {
           /*      System.debug('info'+ character); */
               
            }
        } 
        return results; 
    }
  


    @AuraEnabled(cacheable=true)
    public static Map<String, Object> nexCallout(Integer currentPage) {
       
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        /* String url = 'https://rickandmortyapi.com/api/character?page='+currentPage; */
       
        System.debug('response currentPage' + currentPage);
        request.setEndpoint('https://rickandmortyapi.com/api/character?page='+currentPage);
        
       
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        Map<String, Object> results = new  Map<String, Object>(); 
         if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> characters = (List<Object>) results.get('results');
            System.debug('Received the following animals:');
            for(Object character: characters) {
           /*      System.debug('info'+ character); */
               
            }
        } 
        return results; 
    }
  

   /*  @AuraEnabled(Cacheable = true)
    public static Map<String, Object> getAccountData(String textkey) {

      Http http = new Http();
      HttpRequest request = new HttpRequest();
      request.setEndpoint('https://rickandmortyapi.com/api/character?page=1');

      request.setMethod('GET');
      HttpResponse response = http.send(request);


      String findStr = '*'+searchKey+'*';
      List<List<sObject>> searchResult;
  
      if(String.isBlank(kategorieValue)) || kategorieValue == 'Alle'){
          searchResult = [FIND :findStr IN ALL FIELDS 
              RETURNING Mediathek__c (Id, Name, Bezeichnung__c, Typ__c, Zielgruppe__c, Umfang__c, Bezeichnung_Link__c, Bezeichnung_Search__c)];
      } else {
          searchResult = [FIND :findStr IN ALL FIELDS 
              RETURNING Mediathek__c (Id, Name, Bezeichnung__c, Typ__c, Zielgruppe__c, Umfang__c, Bezeichnung_Link__c, Bezeichnung_Search__c
              WHERE Typ__c=:KategorieValue)];
      }
  
      return searchResult;


        
    }
 */




  }




