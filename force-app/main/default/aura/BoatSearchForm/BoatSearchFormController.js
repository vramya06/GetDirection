({
     doInit: function(component) 
    {
       console.log('inside do init ');
    }, 
     createBoat: function (component) 
     {
            console.log('inside controller');
            var createRecordEvent = $A.get('e.force:createRecord');
            if (createRecordEvent) {
                var typeName = component.find('typeSelect').get('v.value');
                var typeMap = component.get('v.searchOptionToIdMap');
                var typeId = null;
                if (typeName && typeMap && typeMap[typeName]) 
                {
                    typeId = typeMap[typeName];
                }
                createRecordEvent.setParams({
                    'entityApiName': 'Boat__c',
                    'defaultFieldValues': {
                        'BoatType__c': typeId
                    }
                });
                createRecordEvent.fire();
            }
       }
})