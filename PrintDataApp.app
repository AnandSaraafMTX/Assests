<aura:application extends="force:slds">
    <aura:attribute name="recordid" type="String"/>
    <aura:attribute name="fieldSetName" type="String"/>
    <aura:attribute name="sObjectTypeName" type="String"/>
	<aura:attribute name="objName" type="String"/>
    
    <div class="slds-clearfix slds-p-around_medium">
        <div class="slds-float_right">
            <lightning:button aura:id="printButton" class="" label="Print" onclick="{!c.print}"/>
        </div>
    </div>
	
    <!-- Parent -->
    <c:PrintData recordId="{!v.recordid}" 
                 fieldSetName="{!v.fieldSetName}" 
                 sObjectTypeName="{!v.sObjectTypeName}" 
                 objName="{!v.objName}"
                 mode="readonly"/>
    
    <!-- Childs -->
    <c:PrintData recordId="{!v.recordid}" 
                 fieldSetName="contactFieldSet" 
                 sObjectTypeName="Contact"
                 isRelatedList="true"
                 childObjectName="Contact"
                 childRelatedListName="Contacts"
                 referenceFieldName="AccountId"
                 iconName="standard:contact"/>
    
    <c:PrintData recordId="{!v.recordid}" 
                 fieldSetName="fieldsToPrintOpp" 
                 sObjectTypeName="Opportunity"
                 isRelatedList="true"
                 childObjectName="Opportunity"
                 childRelatedListName="Opportunities"
                 referenceFieldName="AccountId"
                 iconName="standard:Opportunity"/>

</aura:application>