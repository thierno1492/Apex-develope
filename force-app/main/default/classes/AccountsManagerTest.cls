@isTest
private class AccountsManagerTest {
    @isTest
     Static void testGetAccountById() {
  
        RestRequest request = new RestRequest();
        Id recordId = '0017R00002utk7mQAA';
        request.requestUri = 'https://curious-otter-nwkqe1-dev-ed.lightning.force.com/services/apexrest/Accounts/'+recordId;

        request.httpMethod = 'GET';
        RestContext.request = request;
        
        List<Account> thisAccount = CapgeminiWebservices.getAccount();
        // Verify results
    }

    @isTest 
    static void testCreateContact() {
        // Call the method to test
        Account newAccount = new Account(name='Capgemini Asturias');
        insert newAccount;
        ID thiscontactId = CapgeminiWebservices.createContact(
            'New', 'Ferocious chipmunk');
        // Verify results
    /*     System.debug('thisContactoId : ' +thiscontactId); */
        System.assert(thiscontactId != null);
        List<Contact> thisContactsList  = [SELECT Id ,LastName FROM Contact WHERE Id = :thiscontactId];
        System.assert(thisContactsList.isEmpty() == false);
        System.assertEquals(thisContactsList.get(0).LastName, 'Ferocious chipmunk');
    }
@isTest 
static void testDeleteContact(){
    Id recordId = createTestRecord();
    RestRequest request = new RestRequest();
    request.requestUri = 'https://curious-otter-nwkqe1-dev-ed.lightning.force.com/services/apexrest/Accounts/'+recordId;
    request.httpMethod = 'DELETE';
    RestContext.request = request;
    CapgeminiWebservices.deleteContact();
    List<Contact> ContactList = [SELECT Id FROM Contact WHERE Id =:recordId];
    Boolean  varList = ContactList.size() == 0;
    CapgeminiWebservices.deleteContact();
    System.debug('delete test'+varList );
}



@isTest 
static void testUpsertContact() {
    // 1. Insert new record
    Id contactId1 = CapgeminiWebservices.upsertContact(
        'Thierno','Diallo',null
    );
    System.assert(contactId1 != null);
    Contact c1 = [SELECT Id,LastName FROM Contact WHERE Id = : contactId1];
    // Verify new record was created
    System.assertEquals(c1.LastName,'Diallo');
   
    // 2. Update status of existing record to Working
Id contactId2 =  CapgeminiWebservices.upsertContact(
    'Thierno' ,'jack',contactId1
);
    // Verify record was updated
    System.assert(contactId2 != null);

    Contact c2 = [SELECT Id,LastName FROM Contact WHERE Id = : contactId2];
    System.assertEquals(c2.LastName,'jack');
   
}  


@isTest static void testUpdateContactFields() {
    Id recordId = createTestRecord();
    RestRequest request = new RestRequest();
    request.requestUri =
        'https://curious-otter-nwkqe1-dev-ed.lightning.force.com/services/apexrest/Accounts/'
        + recordId;
    request.httpMethod = 'PATCH';
    request.addHeader('Content-Type', 'application/json');
    request.requestBody = Blob.valueOf('{"LastName": "Diallo"}');
    RestContext.request = request;
    // Update status of existing record to Working
    ID thisContactId = CapgeminiWebservices.updateContactFields();
    // Verify record was updated
    System.assert(thisContactId != null);
    Contact thisContact = [SELECT Id,LastName FROM Contact WHERE Id=:thisContactId];
    System.assert(thisContact != null);
    System.assertEquals(thisContact.LastName, 'Diallo');
}  


// Helper method
static Id createTestRecord() {
    // Create test record
    Contact contactTest = new Contact(
        LastName='Test record',
        FirstName='New'
       );
    insert contactTest;
    return contactTest.Id;
}    

}