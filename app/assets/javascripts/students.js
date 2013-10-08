$(document).ready(function(){
        $( "#faculty" ).autocomplete({
                source: "http://0.0.0.0:3000/getInstitutionsNames.json",
                    minLength: 2
                    });
        
    });