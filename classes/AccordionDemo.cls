public class AccordionDemo {
 @AuraEnabled
    public static List<Account> getAccounts(){
    
        List<Account> listOfAccounts = [SELECT Id, Name, AccountNumber, AnnualRevenue, Description, Phone, Website From Account LIMIT 50];
        
        return listOfAccounts;
    }
}