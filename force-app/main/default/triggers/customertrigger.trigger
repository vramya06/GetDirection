trigger customertrigger on APEX_Customer__c (before update ) {

list<APEX_Invoice__c> InvoiceList = new list<APEX_Invoice__c>();
for(APEX_customer__c customerobj:trigger.new)
{
  if(customerobj.APEX_Status__c =='Active' && (trigger.oldmap.get(customerobj.id).APEX_Status__c !='Active'))
  {
   APEX_Invoice__c invoice =new APEX_Invoice__c();
   invoice.APEX_status__c ='pending';
   invoice.APEX_customer__c = customerobj.id;
   invoice.APEX_Description__c ='record is created after updating trigger';
   InvoiceList.add(invoice );
  }
}
insert InvoiceList ;

}