###
    Write message in console

    @param text: string
    @param type: string
    @return void
###
consoleWrite = (text, type) ->
    console.log text

    output  = $('#console')    
    current = output.html() + "<p class=" + type + ">" + text + "</p>"

    output.html current

    return

###
    Update list robots output

    @param list: object    
    @return void
###
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