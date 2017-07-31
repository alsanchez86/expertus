###
    Write message in console

    @param text: string
    @param type: string
    @return void
###
consoleWrite = (text, type) ->
    console.log text

    output  = $('#console')    
    current = "<p class=" + type + "><i class=\"fa fa-info-circle\" aria-hidden=\"true\"></i>&nbsp;" + text + "</p>" + output.html()

    output.html current

    return

###
    Update list robots output

    @param list: object    
    @return void
###
robotList = (list) ->
    list.empty()    
        
    _.each robots, (robot) -> 
        text = "Robot id: " + robot.id + " | Position: [X: " + robot.position.x + ", Y: " + robot.position.y + ", O: " + robot.position.o.toUpperCase() + "]"

        if _.size robot.instructions
            text += " | Instructions: [" + robot.instructions + "]"            

        li = $("<li/>").text text
        li.appendTo list
        return
            
    return

###
    Update list robots output

    @param list: object    
    @return void
###
outputList = (list) ->
    list.empty()    
        
    _.each robots, (robot) -> 
        text = "Robot id: " + robot.id + " | OUTPUT: " + robot.position.x + " " + robot.position.y + " " + robot.position.o.toUpperCase()

        li = $("<li/>").text text
        li.appendTo list
        return
            
    return