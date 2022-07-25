trigger UpdateOrder on Contact (after insert, after update, after delete, after undelete) {
List<Account> ct = new List<Account>();
   
   Set<Id> custord = new Set<Id>();
   
   if(Trigger.isDelete) {
     for(Contact test:Trigger.Old) {
      
        custord.add(test.AccountId);   
    
     }   
   
   }
   else
   if(Trigger.isUpdate) {

     for(Contact test:Trigger.New) {
      
        custord.add(test.AccountId);   
    
     }

     for(Contact test:Trigger.Old) {
      
        custord.add(test.AccountId);   
    
     }   
   
   }
   else
   {
     for(Contact test:Trigger.New) {
      
        custord.add(test.AccountId);   
    
     }
   }
   
   AggregateResult[] groupedResults = [SELECT COUNT(Id), AccountId FROM Contact where AccountId IN :custord GROUP BY AccountId ];
   System.debug(groupedResults);
   for(AggregateResult ar:groupedResults) {
     
     Id custid = (ID)ar.get('AccountId');
     System.debug(custid);
     
     Integer count = (INTEGER)ar.get('expr0');
     System.debug(count);
     Account cust1 = new Account(Id=custid);
     
     cust1.child_count__c = count;
     
     ct.add(cust1);
      
   }
   
   
   update ct;

}