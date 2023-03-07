trigger customernewtrigger on APEX_Customer__c (before update)
{
   list<apex_customer__c> customerlist = new list<apex_customer__c>();
   for(apex_customer__c objcust:trigger.new)
   {
       system.debug(objcust);
       if(objcust.Apex_Active__c==true)
       {
         objcust.apex_description__c ='updated';
         system.debug(objcust);
       }
       
   }
}