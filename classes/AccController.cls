public class AccController {
    //first git change push
  
@AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT
               Id, Name, Phone, Rating
               FROM Account LIMIT 200];
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
    @AuraEnabled
    public static Account getTypeFromAccount(string recordId)
    {
        Account acc = [select Name, Type from Account Where Id = :recordId limit 1];
        return acc;
    }
}