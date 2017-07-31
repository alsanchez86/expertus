###
    APP
###    
$ ->
    $('#add-robot')
        .click (event) ->
            event.preventDefault()

            addRobot()            

    $('#run-app')
        .click (event) ->
            event.preventDefault() 

            generatePlateau()

            unless _.isEmpty plateau
                start()
            else
                consoleWrite messages.no_data

    # bootstrap()


