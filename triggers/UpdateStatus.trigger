trigger UpdateStatus on Booking__c (before insert,before update,before delete)
{
    if(trigger.isInsert && trigger.isBefore)
    {
        for(Booking__c i:trigger.new){
            if(i.Total_Amount__c==0)
            {
                i.Booking_Status__c = 'Pending';
            }
            else if(i.Total_Amount__c <= 5000 && i.Total_Amount__c >0)
            {
                i.Booking_Status__c = 'Approved';
            }
            
        }
    }
    if(trigger.isUpdate && trigger.isBefore)
    {
        for(Booking__c i:trigger.new){
            if(i.Total_Amount__c <= 5000)
            {
                i.Booking_Status__c = 'Approved';
            }
            else if(i.Total_Amount__c > 5000 && i.Booking_Status__c=='Approved'){
                i.Booking_Status__c='Pending';
            }
            
            
        }
    }
    if(trigger.isDelete && trigger.isBefore)
    {
        for(Booking__c i:trigger.new){
            if(i.Total_Amount__c <= 1000)
            {
                i.Booking_Status__c = 'Approved';
            }
            else{
                i.Booking_Status__c='Pending';
            }
        }
    }
    
    
    
}