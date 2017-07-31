###
    APP
###    

$ ->
    ###
        Listener create plateau button click
    ###
    $('#create-plateau')
        .click (event) ->
            event.preventDefault()
            
            plateauSize     = $('#plateau-size')
            plateauSizeVal  = plateauSize.val()
            dimensions      = $('#plateau-dimensions')   
            plateauReady    = $('#plateau-ready')   
            plateauOutput   = $('#plateau-output')

            unless _.isEmpty plateauSizeVal
                createPlateau plateauSizeVal   

                unless _.size plateau            
                    consoleWrite messages.end, ""            
                else                   
                    # disable button
                    $(this).addClass "disabled"
                    plateauSize.addClass "disabled"

                    # show plateau output
                    dimensions.text((plateau.maxx + 1) + " x " + (plateau.maxy + 1))
                    plateauOutput.show()

                    # show robots
                    plateauReady.show()                    

            return

    ###
        Listener add robot button click
    ###
    $('#add-robot')
        .click (event) ->
            event.preventDefault()

            coordinates     = $('#robot-coordinates')
            instructions    = $('#robot-instructions')   
            coordinatesVal  = coordinates.val()
            instructionsVal = instructions.val()
            startContent    = $('#start-content')
            robotsOutput    = $('#robots-output')
            list            = $('#robots-list')

            unless _.isEmpty(coordinatesVal) && _.isEmpty(instructionsVal)
                deployRobot coordinatesVal
                addInstructionsLastAddedRobot instructionsVal

                # robots
                if _.size robots
                    # update robots list
                    robotList list                              
                
                    # show robots output
                    robotsOutput.show()

                    # show start
                    startContent.show()

            # reset form
            coordinates.val ""
            instructions.val ""

            return             

    ###
        Listener start button click
    ###
    $('#run-app')
        .click (event) ->
            event.preventDefault() 

            addRobot        = $('#add-robot') 
            outputOutput    = $('#output-output') 
            list            = $('#output-list')           

            unless _.isEmpty plateau                
                # disable buttons
                $(this).addClass "disabled"
                addRobot.addClass "disabled"

                # start
                start()

                # update output list  
                outputList list                

                # show output
                outputOutput.show()

            else
                consoleWrite messages.no_data, "error"

            return  
