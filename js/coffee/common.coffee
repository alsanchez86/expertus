consoleWrite = (text, type) ->
    console.log text

    output  = $('#console')    
    current = output.html() + "<p class=" + type + ">" + text + "</p>"

    output.html current

    return

outputList = (list) ->
    list.empty()

    _.chain robots
        .filter (robot) -> robot.active
        .each   (robot) -> 
            text = "Robot id: " + robot.id + " -> Position: [X: " + robot.position.x + ", Y: " + robot.position.y + ", O: " + robot.position.o + "]"
            li = $("<li/>").text text
            li.appendTo list
            return
            
    return