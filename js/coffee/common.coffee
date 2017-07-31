consoleWrite = (text) ->
    console.log text

    output  = $('#console')    
    current = output.html() + "<p>" + text + "</p>"

    output.html current