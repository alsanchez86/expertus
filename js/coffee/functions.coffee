###
    FUNCTIONS
###

###
    Almacena los límites de la meseta.
    return void
###
generatePlateau = (data) ->
    coordinates = validatePlateauCoordinates(data)    

    unless _.size(coordinates)
        console.log messages.plateau_error_1
        return

    plateau.maxx = coordinates.x
    plateau.maxy = coordinates.y
    return

###
    Deploy Robot
    Si los datos no son correctos, se despliega un robot inactivo (status: false)
###
deployRobot = (data) ->
    robot       = {x: 0, y: 0, o: "", status: false}
    coordinates = validateRobotCoordinates(data)   
    coordinates = validateRobotPosition(coordinates)
    
    if _.size(coordinates)               
        robot.x         = coordinates.x
        robot.y         = coordinates.y
        robot.o         = coordinates.o
        robot.status    = true      
    else
        console.log messages.deploy_error_1

    robots.push(robot);
    return

moveRobot = (data) ->
    return