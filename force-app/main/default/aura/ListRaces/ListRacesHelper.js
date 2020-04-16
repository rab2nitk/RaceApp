({
	getRaces : function(component) {
        console.log("Calling getRaces");
		var action = component.get("c.getRacesDB");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.races", response.getReturnValue());
            } 
        });
        $A.enqueueAction(action);
	},
     addToRaces : function(component, event) {
        console.log("calling addToRaces");
        var race = event.getParam("race");
        var races = component.get("v.races");
       // races.push(race);   //original version which added race to the end of the array
		races.unshift(race);  //new version that prepends the race to the beginning of the array
        component.set("v.races", races);
    }
    
})