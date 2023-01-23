public with sharing class OlderAccountsUtility {
    public static void updateOlderAccounts() {
     /*    // Get the 5 oldest accounts
        Account[] oldAccounts = [SELECT Id, Description FROM Account ORDER BY CreatedDate ASC LIMIT 5];
        System.debug('sby older '+ oldAccounts); 
        // loop through them and update the Description field
        for (Account acct : oldAccounts) {
            acct.Description = 'Heritage New Account';
        }
        // save the change you made
        update oldAccounts;
        System.debug('sby new '+ oldAccounts);
      } */
      Integer num = 10;
      Account[] accs;
     accs = [SELECT  Id FROM Account WHERE Name LIKE '%test%'];
     if (accs != null) {
        
         Delete accs;
     }

     accs = new Account[num];
     System.debug('sby account int'+ accs);
     for (Integer i = 0; i < Num ;i++) {
        accs[i] = new Account(name='test  ' + i);
     }
     System.debug('sby Account insert ' + accs);
     insert accs;



     Contact [] c = new Contact[0];

    for (Account acc : accs) {
       c.add(new Contact(LastName=acc.Name + ' 1',AccountId = acc.Id)) ;
       c.add(new Contact(LastName=acc.Name + ' 2',AccountId = acc.Id)) ;
       System.debug('sby account debug 1' + acc);
          
     System.debug('sby account debug 1' + accs);
    }
    insert c;
 




}


}