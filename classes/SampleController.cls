public class SampleController {


    @AuraEnabled
    public static List<Account> getAccountData(Integer pageSize, Integer pageNumber, Integer Year){
        Integer offset = (pageNumber - 1) * pageSize;
       // Integer yr = Integer.valueOf(Year);
        if(Year == null || string.valueOf(Year)=='')
        {
            return [SELECT Id,Name,AnnualRevenue,Industry,Phone FROM Account LIMIT :pageSize OFFSET :offset];
        
        }
        else
        {
            String query = 'SELECT Id,Name,AnnualRevenue,Industry,Phone FROM Account WHERE CALENDAR_YEAR(CreatedDate) ='+Year+' LIMIT :pageSize OFFSET :offset'; 
        List<Account> acc = Database.query(query);
       return acc;
        }
    }
    
    @AuraEnabled
    public static void delAccount(Account accountRec){
        delete accountRec;
    } 


}