({
	getinput : function(component, event) {
        var fullname =cmp.find("name").get("v.value");
        var outname = cmp.find("output");
        outname.set("v.value",fullname);
		
	}
})