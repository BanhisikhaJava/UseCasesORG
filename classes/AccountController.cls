public with sharing class AccountController {
    @AuraEnabled
 public static Id saveAccount(String name)

    {
        Account acc = new Account();
        acc.Name = name;
        
        insert acc;
        return acc.Id;
    }
    @AuraEnabled
    public static Id saveContact(String name)

    {
        Contact con = new Contact();
        con.LastName=name;
        
        insert con;
        return con.Id;
    }
    
}