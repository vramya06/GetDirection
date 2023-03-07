@isTest
public class TriggerHandlerTest {
    @isTest static void myTest()
    {
        
        Account myAcc = new Account(name ='Test Account');
        Test.startTest();
        insert myAcc;
        Test.stopTest();
        Account insertedAcc =[select Id , name, Description from Account Where id= :myAcc.Id];
        Task insertedTask =[ select id ,subject from Task Where Whatid= :myAcc.id];
        system.assertEquals('Test Account', insertedAcc.name);
        system.assertEquals('New DEscription from Trigger', insertedAcc.Description);
        system.assertEquals('New Account Task', insertedTask.subject);
            
            
            }
    
}