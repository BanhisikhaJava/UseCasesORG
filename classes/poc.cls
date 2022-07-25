public class poc {
    @AuraEnabled(Cacheable=true)
    public static String getFieldsFromFieldSet(String objectName, String fieldSetName)
    {
        System.debug(objectName);
        Schema.DescribeSObjectResult sObjectDescribe = 
            Schema.getGlobalDescribe().get(ObjectName).getDescribe();
        System.debug(sObjectDescribe);
        Schema.FieldSet fieldSet = sObjectDescribe.FieldSets.getMap().get(fieldSetName);
        System.debug(fieldSet);
        System.debug('fields => '+fieldSet.getFields());
        System.debug('Json-Serialize '+JSON.serialize(fieldSet.getFields()));
        return JSON.serialize(fieldSet.getFields()); 
    }
    @AuraEnabled
    public static Id saveAccContact(Map<String,String> fields, Map<String,String> fieldsContact)   
    {
        Account acc = new Account();
        for(String s: fields.keyset())
        {
            if(s=='AnnualRevenue')
            {
                Decimal annualRev = Decimal.valueOf(fields.get(s));
                acc.put(s,annualRev);
            }
            else
                acc.put(s,fields.get(s));
        }
        insert acc;
        Contact con = new Contact();
        for(String s: fieldsContact.keyset())
        {
            con.put(s,fieldsContact.get(s));
        }
        con.accountId=acc.id;
        insert con;
        return con.id;
    }
}