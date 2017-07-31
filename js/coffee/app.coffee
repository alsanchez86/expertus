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

            unless _.isEmpty plateau && _.isEmpty robots
                start()

    # bootstrap()


