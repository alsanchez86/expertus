###
    FUNCTIONS
###

###
    Almacena los límites de la meseta.
    return void
###
generatePlateau = (data) ->
    coordinates = validatePlateauCoordinates data

    unless _.size coordinates
        console.log messages.plateau_error_1
        return

    plateau.maxx = coordinates.x
    plateau.maxy = coordinates.y
    return

###
    Deploy Robot
    Si los datos no son correctos, se despliega un robot inactivo (active: false)
###
deployRobot = (data) ->
    robot       = x: 0, y: 0, o: "", id: 0, active: false, instructions: []
    coordinates = validateRobotCoordinates data
    coordinates = validateRobotPosition coordinates
    
    if _.size coordinates
        robot.x         = coordinates.x
        robot.y         = coordinates.y
        robot.o         = coordinates.o
        robot.active    = true      
    else
        console.log messages.deploy_error_1

    robot.id = robots.length + 1
    robots.push robot
    return

addInstructionsRobot = (robot, data) ->
    return

addInstructionsLastAddedRobot = (data) ->
    # each de robots
    _.each robots, (robot) -> addInstructionsRobot robot, data
    return

startRobot = (robot) -> 
    return

startProgram = () ->
    # each de robots con condicion dentro (status = true)
    _.each robots, (robot) -> startRobot robot    
    return