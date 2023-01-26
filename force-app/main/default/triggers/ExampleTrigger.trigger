trigger ExampleTrigger on Contact (before  insert, before  delete) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.new.size();
        // Call a utility method from another class
      
        for (Contact cc : Trigger.new){
           /*  cc.Email = Email; */
            EmailManager.sendMail( cc.Email, 'Email enviado',   recordCount +  ' contact(s) were inserted.');
        }
    }
    else if (Trigger.isDelete) {
        for (Contact cc : Trigger.old) {
            Trigger.oldMap.get(cc.Id);
            EmailManager.sendMail(cc.Email,'delete','tu contacto fue borrado');
        }
    }
}