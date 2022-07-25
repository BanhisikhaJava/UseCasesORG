public with sharing class services {
    @AuraEnabled(cacheable=true)
    public static List<Services_Provide__c> getServices(){
        List<Services_Provide__c> services =[Select Name, Amount_Calculate__c from Services_Provide__c];
        return services;
    }
   
}