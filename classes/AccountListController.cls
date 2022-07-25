public class AccountListController {
@AuraEnabled
    public static List < AccountWrapper > fetchAccts() {
        List < AccountWrapper > listAcctWrapper = new List < AccountWrapper >();
        List<Account> acc1 = [SELECT Id,Name,AnnualRevenue,Industry,Phone FROM Account];
        Decimal Max=0;
        Boolean b = false;
        Id ids;
        For(Integer i =0; i<acc1.size(); i++)
        {
            if(acc1[i].AnnualRevenue>Max)
            {
                Max=acc1[i].AnnualRevenue;
                ids=acc1[i].id;
                b=true;
            }
        }
        for ( Account acc : [ SELECT Id, Name, Industry,AnnualRevenue,Type, Active__c FROM Account] ) {
            AccountWrapper AccountWrap = new AccountWrapper();
            AccountWrap.accName = acc.Name;
            AccountWrap.isActive = acc.AnnualRevenue == Max ? true : false;
            AccountWrap.accIndustry = acc.Industry;
            AccountWrap.accType = acc.Type;
            AccountWrap.accActive = acc.Active__c;
            AccountWrap.accId = acc.Id;

            listAcctWrapper.add(AccountWrap);
        }
        return listAcctWrapper;
    }
}