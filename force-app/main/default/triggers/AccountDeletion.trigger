trigger AccountDeletion on Account (before delete) {
  for (Account acc : [SELECT Id FROM Account WHERE Id IN  (SELECT AccountId FROM Opportunity)   AND Id IN :Trigger.old]) {
    Trigger.oldMap.get(acc.Id).addError('No se puede elimar una cuenta relacionada con una opportunidad');
  }


/*   for (Opportunity opp : [ SELECT AccountId FROM Opportunity  WHERE AccountId IN :Trigger.old]) {
    Trigger.oldMap.get(opp.Id).addError('No se puede elimar una cuenta relacionada con una opportunidad');
  } */
 
}

