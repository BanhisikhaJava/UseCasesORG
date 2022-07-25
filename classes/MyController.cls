public with sharing class MyController {
    
    @AuraEnabled
    public static List<AccountContactWrapper> showAccountsForAccordion()
    {
        List<Account> accList = [select Id,Name,Industry,AnnualRevenue,(select firstname,Name,lastname,phone from contacts)
                                 FROM
                                 Account];
        List<AccountContactWrapper> accWrapper = new List<AccountContactWrapper>();
        for(Account a: accList)
        {AccountContactWrapper AccountWrap = new AccountContactWrapper();
         
         AccountWrap.accName=a.Name;
         AccountWrap.accIndustry=a.Industry;
         AccountWrap.accAnnualRevenue=a.AnnualRevenue;
         AccountWrap.conList=a.contacts;
         accWrapper.add(AccountWrap);
        }
        return accWrapper;
    }
}