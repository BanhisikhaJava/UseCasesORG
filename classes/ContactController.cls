public with sharing class ContactController {
@AuraEnabled
    public static Id saveContact(String name,String fname,String names,String phone, Integer annualRevenue)

    {
        Account ac = new Account();
        ac.Name=names;
        ac.Phone=phone;
        ac.AnnualRevenue=annualRevenue;
        insert ac;
        Contact con = new Contact();
        con.FirstName=fname;
        con.LastName=name;
        con.AccountId=ac.Id;
        insert con;
        return con.Id;
    }
   
}