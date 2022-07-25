public with sharing class booking {
    @AuraEnabled(cacheable=true)
    public static List<Booking__c> BookingSummary(){
        List<Booking__c> services= [Select Name,Booking_Status__c,Shipping_Address__c,Total_Amount__c from Booking__c ];
     return services;
    }
}