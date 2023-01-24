public with sharing class BulkContact {
    public  Static void BulkContactList() {
// Create a list of contacts
List<Contact> conList = new List<Contact> {
    new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
        new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
        new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
        new Contact(FirstName='Kim',LastName='Shain',Department='Education')};
// Bulk insert all contacts with one DML call
insert conList;
// List to hold the new contacts to update
List<Contact> listToUpdate = new List<Contact>();
// Iterate through the list and add a title only
//   if the department is Finance
for(Contact con : conList) {
    if (con.Department == 'Finance') {
        con.Title = 'Financial analyst';
        // Add updated contact sObject to the list.
        listToUpdate.add(con);
    }
}
// Bulk update all contacts with one DML call
update listToUpdate;
    }


    public Static void ContactUpsert(){
/*         // Insert the Josh contact
Contact josh = new Contact(FirstName='Josh',LastName='Kaplan',Department='Finance');       
insert josh;
// Josh's record has been inserted
//   so the variable josh has now an ID
//   which will be used to match the records by upsert
josh.Description = 'Josh\'s record has been updated by the upsert operation.';
// Create the Kathy contact, but don't persist it in the database
Contact kathy = new Contact(FirstName='Kathy',LastName='Brown',Department='Technology');
// List to hold the new contacts to upsert
List<Contact> contacts = new List<Contact> { josh, kathy };
// Call upsert
upsert contacts; */
// Result: Josh is updated and Kathy is created.



// 1. Upsert using an idLookup field
// Create a second sObject variable.
// This variable doesn’t have any ID set.

// Upsert the contact by using the idLookup field for matching.

// Verify that the contact has been updated

                   try {
                    Contact jane = new Contact(FirstName='Jane',
                         LastName='Smith',
                         Email='jane.smith@example.com',
                         Description='Contact of the day');
                         System.assert(jane != null);
                         if (jane != null) {
                        System.debug('error');
                         }else{

                          insert jane;
                         }
                    
                        Contact jane2 = new Contact(FirstName='Jane',
                         LastName='Smith',  
                         Email='jane.smith@example.com',
                         Description='Prefers to be contacted by email.');
                         upsert jane2 Contact.fields.Email;
                         System.assertEquals('Prefers to be contacted by email.',
                         [SELECT Description FROM Contact WHERE Id=:jane.Id].Description);
                   } catch (DmlException e) {
                    System.debug('A DML exception has occurred: ' +
                    e.getMessage());
                   }
    }


    public Static void insertUseDmlException(){
        try {
            // This causes an exception because 
            //   the required Name field is not provided.
            Account acct = new Account();
            // Insert the account 
            insert acct;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' +
                        e.getMessage());
        }
    }
}