public class HandlerTrigger {
    public static void handleBeforeInsert (List<Account> accList) {
    for(Account a : accList) {
    a.Description = 'New description';
        System.debug('HelloWorld');
    }
    }
    
    public static void handleAfterInsert (List<Account> accList) {
    for(Account a : accList) {
    Task aTask = new Task();
    aTask.ownerId = a.ownerId;
    aTask.subject = 'New Account Task';
    aTask.whatId = a.Id;
    aTask.priority = 'Normal';
    Insert aTask;
    }
    }
    }