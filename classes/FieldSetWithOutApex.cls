public class FieldSetWithOutApex {
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
}