trigger RemoveEditAccess on Contact (before update) {
  
    Set<id> ids = new Set<id>();
    for(Contact c:trigger.new)
    {
        ids.add(c.accountId);
    }
    List<Account> a = [select id, name , Active__c from Account where id in:ids ];
    
    For(Account acc : a){
        for(Contact c: trigger.new)
        {
            if(c.accountId==acc.id)
            {
                if(acc.Active__c=='No')
                {
                    Trigger.newMap.get(c.Id).addError('Cannot edit contact with inactive account.');
                }
            }
        }
    }
   
   

}