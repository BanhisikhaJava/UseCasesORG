public class assignPerson {
    @InvocableMethod
    public static void getserviceperson(){
        
        Service_Person__c ids;
        Integer count=0;
        List<Service_Person__c> c =[Select Id,Services_Provide__r.Name,Name from Service_Person__c where Status__c='Active'];
        
        //   Booking__c book =[select Id from Booking__c where Service_person_assigned__c='Not Assigned' Limit 1];   
        Mobile_Model_Detail__c mobile =[Select Id,Services_Provide__r.Name from Mobile_Model_Detail__c where Status__c='Not Assigned' limit 1];   
        
        for(Service_Person__c person:c){
            if(mobile.Services_Provide__r.Name==person.Services_Provide__r.Name) {
                
                mobile.Service_Person__c=person.Id;
                mobile.Status__c='Assigned';
                
                person.Status__c='Not active';
                system.debug(mobile);
                system.debug(person);
                break;
            }//break;
        }    
        update mobile;
        update c; 
        
        
        
        
    }
}