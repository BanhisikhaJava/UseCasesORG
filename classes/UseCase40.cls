public class UseCase40 {
    public UseCase40(){
        List<Employee__c> employees = new List<Employee__c>();
        employees=[Select Name,email__c,Department_Name__r.Department_Name__c from Employee__c];
        System.debug('Employee list: '+employees);
        for(Employee__c e: employees)
        {
            System.debug('Department '+e.Department_Name__c);
        }
        List<Employee__c> employees1 = new List<Employee__c>();
        employees1=[Select Name,email__c,Department_Name__r.Status__c from Employee__c];
        System.debug('Employee list: '+employees1);
    }

}