public class AccountControllerPOC {

    @AuraEnabled
    public static List<Account> getAccountData(){
        return [SELECT Id,Name,AnnualRevenue,Industry,Phone FROM Account];
    }
    @AuraEnabled
    public static List < AccountWrapper > getAccountDataMax(){
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
       List < AccountWrapper > listAcctWrapper = new List < AccountWrapper >();
        
        for ( Account acc : [ SELECT Id, Name, Industry,AnnualRevenue,Phone, Type, Active__c FROM Account] ) {
            AccountWrapper AccountWrap = new AccountWrapper();
//            if(acc.AnnualRevenue>5000000)
//            AccountWrap.accType='Platinum';
            AccountWrap.accName = acc.Name;
            AccountWrap.isActive = acc.AnnualRevenue == Max ? true : false;
            AccountWrap.accIndustry = acc.Industry;
            AccountWrap.annualRevenue=acc.AnnualRevenue;
            AccountWrap.Phone=acc.Phone;
            AccountWrap.accType = acc.Type;
            AccountWrap.accActive = acc.Active__c;
            AccountWrap.accId = acc.Id;
            listAcctWrapper.add(AccountWrap);
        }
        return listAcctWrapper;
        
    }
    @AuraEnabled
    public static List<Account> delAccount(Id accountRec){
         delete [Select Id From Account Where Id=:accountRec];
        return [SELECT Id,Name,AnnualRevenue,Industry,Phone FROM Account];
    } 
 @AuraEnabled
    public static boolean updateAccounts(List<Account> editedAccountList){
        try{
            update editedAccountList;
            return true;
        } catch(Exception e){
            return false;
        }
    }
}