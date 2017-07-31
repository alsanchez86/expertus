consoleWrite = (text, type) ->
    console.log text

    output  = $('#console')    
    current = output.html() + "<p class=" + type + ">" + text + "</p>"

    output.html current