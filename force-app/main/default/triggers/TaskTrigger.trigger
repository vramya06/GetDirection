trigger TaskTrigger on Account (after insert) {
for(Account a : Trigger.New) {
Task aTask = new Task();
aTask.ownerId = a.ownerId;
aTask.subject = '  New Account Task';
aTask.whatId = a.Id;
aTask.priority = 'Normal';
Insert aTask;
} }