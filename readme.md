## Steps

1. Configure field sets for the object record that you want to print including related objects. Because we are only interested in displaying/printing the important fields.
2. Create a "Custom button" with display type = "detail page button"  and Content Source = "URL" then, in the editor paste the below URL replacing App name, Fieldset name and object name with yours.

`/c/YourAppName.app?recordid={!Account.Id}&fieldSetName=FieldsSetName&sObjectTypeName=Account&objName={!Account.Name}`

Add the button to your page layout and make necessary changes in the App above and you are good to go.

### Preview
![print-preview](/Assets/Images/Print-preview.png)
