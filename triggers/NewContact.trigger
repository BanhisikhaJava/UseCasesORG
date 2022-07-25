trigger NewContact on Contact (before insert) {
    
    /* List<Contact> c=trigger.new;
Set<Id> accounacds = new Set<Id>();
for(Contact con:c)
{
accounacds.add(con.accounacd);  
}
List<Account> acc = [select id, job__c from Account where id in :accounacds ];
List<Contact> cont =[select id, job_Name__c from Contact where accounacd in:accounacds];
//Integer size = cont.size();
Map<Id,Contact> mapConAcc = new Map<Id,Contact>();
for(Account a:acc)
{
if(cont.size()>0){
Contact listcon =[select id, lastName,Job_Name__c,size__c from contact where accounacd=:a.id order By createdDate desc limit 1];
mapConAcc.put(a.id,listcon);
}
}

For(Account a1:acc)
{
for(Contact c: trigger.new){
if(a1.id==c.accounacd)
{
if(cont.size()>0){
Contact lico = new Contact();
lico=mapConAcc.get(a1.id);
System.debug(lico);
Decimal size1 = lico.size__c+1;

c.size__c=size1;
String s = String.valueOf(c.size__c);
c.Job_Name__c=a1.Job__c+s;
}
else
{
Decimal size1 = 1;
c.size__c=size1;
String s = String.valueOf(c.size__c);
c.Job_Name__c=a1.Job__c+s;
}   
}
}
}*/
    List<Contact> c1=trigger.new;
    Account acc = new Account();
    Set<Id> accountids = new Set<Id>();
    integer flag=0;
    for(Contact con:c1)
    {
        accountids.add(con.accountid);  
    }
    
    Contact con = new Contact();
    Map<Account,List<Contact>> conAccMap = new Map<Account,List<Contact>>(); 
    List<Account> AccList = [Select id ,Job__c,(SELECT LastName,id,size__c,job_Name__c FROM Contacts)  FROM Account where id In :accountids];
    for(Account ac : AccList){
        conAccMap.put(ac,ac.Contacts);  
    }
    
    
    System.debug(conAccMap);
    
    
    
    
    for(Account ids:conAccMap.keySet())
    {
        List<Contact> conList = conAccMap.get(ids);
        if(conList.size()>0)
        {
            acc=ids;
            con=conList[conList.size()-1];
            System.debug(con);
            flag=1;
        }
        else
        {
            acc=ids;
        }
        
        
    }
    for(Contact c: c1){
        
        if(flag==1){
            
            Decimal size1 = con.size__c+1;
            c.size__c=size1;
            String s = String.valueOf(c.size__c);
            c.Job_Name__c=acc.Job__c+s;
        }
        else
        {
            
            Decimal size1 = 1;
            c.size__c=size1;
            String s = String.valueOf(c.size__c);
            String str =acc.Job__c+s;
            c.Job_Name__c=str;
        }   
    }
    
}