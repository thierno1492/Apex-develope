public class EmailManager {
  public Static void sendMail( string address, String subject ,string body){
 Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
 string[] toAddresses = new String[]{address};
 mail.setToAddresses(toAddresses);
 mail.setSubject(subject);
 mail.setPlainTextBody(body);


 Messaging.SendEmailResult[] results = Messaging.sendEmail(
    new Messaging.SingleEmailMessage[] {mail}
  );
  inspectResults(results);

  }


  private static Boolean inspectResults(Messaging.SendEmailResult[] results){
  Boolean sendResult = true;

  for (Messaging.SendEmailResult res: results) {
    if (res.isSuccess()) {
        System.debug('Email sent successfully');
    }else {
        sendResult = false;
        System.debug('The following errors occurred: '+ res.getErrors());
    }
  }
  return sendResult;
  }
  
}