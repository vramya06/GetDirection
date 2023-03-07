public class AccountHandler {
    
    Public static Account insertNewAccount(String AccountName){
        Account newAccount = new Account();
        newAccount.Name = accountName;
        try {
            insert newAccount;
            return newAccount;
        } catch (DmlException e) {
            return null;
        }
    }
        

}