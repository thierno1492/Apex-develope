public class Contactdatabase {
    public Static void ContactdatabaseException() {
// Create a list of contacts
List<Contact> conList = new List<Contact> {
    new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
    new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
    new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
    new Contact(LastName='Diallo',FirstName='Caroline')};
// Bulk insert all contacts with one DML call
Database.SaveResult[] srList = Database.insert(conList, false);
// Iterate through each returned result
for (Database.SaveResult sr : srList) {
if (sr.isSuccess()) {
    // Operation was successful, so get the ID of the record that was processed
    System.debug('Successfully inserted contact. Contact ID: ' + sr.getId());
} else {
    // Operation failed, so get all errors
    for(Database.Error err : sr.getErrors()) {
        System.debug('The following error has occurred.');
        System.debug(err.getStatusCode() + ': ' + err.getMessage());
        System.debug('Contact fields that affected this error: ' + err.getFields());
 }
}
}
    }
    public static void CreateContact(){
       
        try {
            Account acc = new Account(Name='Factoria');
            Account[] listAcc = new List<Account>();
if (acc.Name != 'Factoria') {
    insert acc;
}else{
    System.debug('el nombre de la cuenta existe ya');
}

           
           /*  if (Contain(acc.Name == 'capgemini')    ) {
           System.debug('el nombre de la cuenta ya existe' + acc[SELECT Name FROM Account WHERE Name= 'Capgemini'] );
            }else{
               
            } */
          
            Id id = acc.Id;

            Contact thierno = new Contact( );
           thierno.LastName =  'Diallo';
           thierno.FirstName = 'sadialiou';
           thierno.AccountId = id;
           
           Database.upsert(thierno, false);
          
            System.debug('la cuenta fue insertada bien  '+acc.Id);
            System.debug('el contacto fue insertada bien  ' + thierno.Id);
        } catch (Exception e) {
            System.debug('Ha ocurrido un error'+e.getMessage());
            
        }
    }


    public static void updateCampoRelacionado(){
        // Query for the contact, which has been associated with an account.
Contact queriedContact = [SELECT Account.Name 
FROM Contact 
WHERE FirstName = 'sadialiou' AND LastName='Diallo'
LIMIT 1];
System.debug('get contact ' + queriedContact);
// Update the contact's phone number
queriedContact.Phone = '(415)555-1213';
queriedContact.Account.Name ='Capgemini Gijon';
// Update the related account industry
queriedContact.Account.Industry = 'Technology';
// Make two separate calls 
// 1. This call is to update the contact's phone.
update queriedContact;
System.debug('Contact phone update ' +queriedContact.Id);
// 2. This call is to update the related account's Industry field.
update queriedContact.Account; 
System.debug('account name update ' + queriedContact.Account);
    }
}