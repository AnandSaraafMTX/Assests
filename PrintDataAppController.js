({
    
    print : function(component, event, helper) {
        var printButton = component.find('printButton');
        
        $A.util.toggleClass(printButton, 'slds-hide');
        event.preventDefault();
        window.print();
        $A.util.toggleClass(printButton, 'slds-hide');
	}
})