public class FieldSet {
    
    @AuraEnabled
    public static List<String> getFieldSet(String fieldSetName, String sObjectName) {
        List<String> fsList = new List<String>();
        Schema.FieldSet fieldSet;
        Schema.SObjectType myObjectType = Schema.getGlobalDescribe().get(sObjectName);
        Schema.DescribeSObjectResult describe = myObjectType.getDescribe();
        
        //Contains all fieldSets in that object
        Map<String, Schema.FieldSet> FsMap = describe.fieldSets.getMap();
        
        if(FsMap.containsKey(fieldSetName)) {

            //Contains fieldSet specified by name fieldSetName
            fieldSet = describe.fieldSets.getMap().get(fieldSetName);
            
            for(Schema.FieldSetMember fsm : fieldSet.getFields()) {
                fsList.add(String.valueOf(fsm.getSObjectField()));
            }
        }
        
        if(fsList != null && fsList.size() > 0)
            return fsList;
        else
            return null;
    }
}