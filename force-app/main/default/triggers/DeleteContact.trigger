trigger DeleteContact on Contact (before insert) {
    for (Contact cc : Trigger.old) {
        Trigger.oldMap.get(cc.Id);
        EmailManager.sendMail(cc.Email,'delete','tu contacto fue borrado');
    }
}