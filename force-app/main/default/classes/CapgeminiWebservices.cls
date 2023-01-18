@RestResource(urlMapping='/Account/*')
global with sharing class CapgeminiWebservices {
    @HttpGet
    global static List<Account> getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
     String AccountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1); 

    List <Account> result =   [SELECT Name, (SELECT Contact.LastName, Contact.Phone 
     FROM Contacts) 
     FROM Account WHERE Id = : AccountId];
     return result;
    }



    
  
    @HttpPost
    global static ID createContact(String FirstName, String LastName ){
    // Crear una lista de contactos
  List<Account> capAccount = [SELECT Id FROM Account WHERE Name='Capgemini Asturias'];
        Contact thisContact = new Contact(
            LastName =LastName ,
            FirstName =FirstName ,
            AccountId = capAccount.get(0).Id);
   // Insertar contactos en la base de datos
     insert thisContact;
        return thisContact.Id;
    }   

    @HttpDelete
    global static String deleteContact() {
      RestRequest request = RestContext.request;
      String contactId = request.requestURI.substring(
        request.requestURI.lastIndexOf('/')+1);
      // Recuperar la cuenta específica
List<Contact> contacto = [SELECT Name FROM Contact WHERE Id = :contactId Limit 1];
// Borrar el contacto
if (contacto.isEmpty()) {
 return  'error';
}else{

  delete contacto ;
  return 'success';
}

}

@HttpPut
global static ID upsertContact(String FirstName, String LastName,String Id){
  Contact thisContacto = new Contact(
    Id = Id,
    FirstName=FirstName,
    LastName=LastName
    );
upsert thisContacto;
// Return the case ID.
return thisContacto.Id;
}


@HttpPatch
    global static ID updateContactFields() {
        RestRequest request = RestContext.request;
        String ContactId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Contact thisContact = [SELECT Id FROM Contact WHERE Id = :ContactId];
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        System.debug('params map' + params);
        // Iterate through each parameter field and value
        for(String fieldName : params.keySet()) {
            // Set the field and value on the Contact sObject
            thisContact.put(fieldName, params.get(fieldName));
        }
        update thisContact;
        return thisContact.Id;
    }    

}