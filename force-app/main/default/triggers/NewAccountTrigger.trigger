trigger NewAccountTrigger on Account (After insert) {

list<contact> contactList = new List<contact>();
for(Account acc:trigger.new)
{
 contact contacts = new contact();
 contacts.lastname = acc.name;
 contacts.AccountId = acc.Id;
 contacts.title ='contact created using NewAccountTrigger';
 contactlist.add(contacts);
 }
 insert contactList;

}