trigger updateHiddenAmount on Mobile_Model_Detail__c (before insert) {
if(trigger.isInsert && trigger.isBefore)
     for(Mobile_Model_Detail__c i:trigger.new)
 {
 	
     i.Hidden_Amount__c =i.Amount__c;
 }
}