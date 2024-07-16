let messages = [];

addEventListener("message", function(event){
	if (event.data.toggle == true) {
        messages[event.data.id] = event.data.html;
        $("#data").html(messages.join(""));
        $("#data").show()
    }else{
        messages[event.data.id] = "";
        $("#data").html(messages.join(""));
        if (messages.join("") == "")
            $("#data").hide()
    }
});
