({
	doInit : function(component, event, helper) {
        
        var isRelatedList = component.get("v.isRelatedList");
        if(isRelatedList) {
            var recId = component.get("v.recordId");
            var action = component.get("c.getRelatedRecords");
            action.setParams({
                childObjectName : component.get("v.childObjectName"),
                referenceFieldName : component.get("v.referenceFieldName"),
                referenceFieldValue : recId
            });
            action.setCallback(this, function(response) {
                console.log("In printData related call back");
                var state = response.getState();
                console.log("state::::", state);
                if(state === 'SUCCESS' || state === 'DRAFT') {
                    var result = response.getReturnValue();
                    component.set("v.relatedList", result);
                    console.log("relatedList::::", result);
                    helper.doInit(component, event, helper);
                }
            });
            $A.enqueueAction(action);
            helper.doInit(component, event, helper);
        }
        else {
            helper.doInit(component, event, helper);
        }
               
	},
    
    createNewChild : function(component, event, helper) {
        var childObjName = component.get("v.sObjectTypeName");
        var referenceField = "AccountId"; //component.get("v.referenceFieldName");
        var referenceFieldValue =  component.get("v.recordId");
        var LOOKUP = 'LOOKUP';
        var defValues = JSON.parse('{ '+'"'+referenceField+'"'+': '+'"'+referenceFieldValue+'"'+'}');
        console.log("defValues",defValues);

        if(childObjName) {
            var createRecordEvent = $A.get("e.force:createRecord");
            createRecordEvent.setParams({
                "entityApiName": childObjName,
                
                "defaultFieldValues": defValues,
                "navigationLocation":LOOKUP,
                "panelOnDestroyCallback": function(component, event, helper) {
                    $A.get('e.force:refreshView').fire();
                }
            });
            createRecordEvent.fire();
            //event.preventDefault();
            $A.get('e.force:refreshView').fire();
        }
    },
})