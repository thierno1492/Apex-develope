trigger AddRelatedRecord on Account(after insert, after update) {
  List<Opportunity> oppList = new List<Opportunity>();
    // Get the related opportunities for the accounts in this trigger
    Map<Id,Account> accountWithOpp = new Map<Id,Account>(
  [SELECT Id ,(SELECT Id FROM opportunities) FROM Account WHERE Id In:Trigger.new]);
    // Add an opportunity for each account if it doesn't already have one.
    // Iterate through each account.


    for (Account a : Trigger.new) {
        System.debug(  'sby accountWithOpp.get(a.Id).opportunities.size() ' + accountWithOpp.get(a.Id).opportunities.size());
    
        if (accountWithOpp.get(a.Id).opportunities.size() == 0) {
            oppList.add(new opportunity(
                Name=a.Id +'opportunity',
                StageName='Prospecting',
                CloseDate=System.Today().addMonths(1),
                 AccountId=a.Id));
        }
    }
    if (oppList.size() > 0) {
        insert oppList;
    }
   
        // Check if the account already has a related opportunity.
       
            // If it doesn't, add a default opportunity
           
        }           
  
