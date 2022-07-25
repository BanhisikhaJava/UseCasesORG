public class AccountContactWrapper {
    @AuraEnabled
    public String accName;
    @AuraEnabled
    public String accIndustry;
    @AuraEnabled
    public Decimal accAnnualRevenue;
    @AuraEnabled
    public List<Contact> conList;
}