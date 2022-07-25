public class LightningComponentSortingPagnation {
 @AuraEnabled
    public static List<Account> fetchAccountData(Integer Year){
       if(Year == null || string.valueOf(Year)=='')
        {
            return [SELECT Id, Name, Type, Website, CreatedDate, Phone FROM Account];
        
        }
        else
        {
            String query = 'SELECT Id, Name, Type, Website, CreatedDate, Phone FROM Account WHERE CALENDAR_YEAR(CreatedDate) ='+Year; 
        List<Account> acc = Database.query(query);
       return acc;
        }
    }
}