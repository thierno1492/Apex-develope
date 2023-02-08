@isTest
private class TestAccountDeletion {
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        // Test data setup
        // Create an account with an opportunity, and then try to delete it
       Account acc = new Account(Name='accWithOpp');
       insert acc;
       Opportunity opp = new Opportunity(
        Name=acc.Name + ' Opportunity',
        StageName='Prospecting',
        CloseDate = system.Today().AddMonths(1),
        AccountId=acc.Id
       );
       insert opp;
     
        // Perform test
     Test.StartTest();
     Database.DeleteResult result = Database.delete(acc,false);
     Test.StopTest();
     System.assert(!result.isSuccess());
     System.assert(result.getErrors().size() > 0);
     system.assertEquals('No se puede elimar una cuenta relacionada con una opportunidad',result.getErrors()[0].getMessage());
     
        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
       
    }
}