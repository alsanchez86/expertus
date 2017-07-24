###
    FUNCTIONS
###

###
    Almacena los límites de la meseta.
    return void
###
generatePlateau = (data) ->
    data = validatePlateauCoordinates data

    unless _.size data
        console.log messages.plateau_error_1
        return

    plateau.maxx = data.x
    plateau.maxy = data.y
    return

###
    Deploy Robot
    Si los datos no son correctos, se despliega un robot inactivo (active: false)
###
deployRobot = (data) ->
    robot   = x: 0, y: 0, o: "", id: 0, active: false, instructions: []
    data    = validateRobotCoordinates data
    data    = validateRobotPosition data
    
    if _.size data
        robot.x         = data.x
        robot.y         = data.y
        robot.o         = data.o
        robot.active    = true      
    else
        console.log messages.deploy_error_1

    robot.id = _.size(robots) + 1
    robots.push robot
    return

###
    Add instructions to single robot 
    param robot: object
    param data: string or array   
###
addInstructionsRobot = (robot, data) ->
    if typeof data is "string"
        data = validateRobotInstructions data

    if _.size data
        robot.instructions = data

    return

###
    Add instructions to last deployed robot
    param data: string
###
addInstructionsLastAddedRobot = (data) ->     
    data = validateRobotInstructions data

    # obtener último robot activo añadido
    last = _.chain robots
            .filter (robot) -> robot.active
            .last()
            .value()

    # añadir instrucciones al robot
    if last
        addInstructionsRobot last, data

    return

getNewRobotPosition = (data) ->
    # devolver la nueva posición en función de la orientación del robot y actual posición del mismo    
    # x: x, y: y: o

    


    return {}

startRobot = (robot) ->     
    # recorrer el conjunto de instrucciones 
    # hay que ir validando cada posición que va a tomar el robot. validateRobotPosition()    
    _.each robot.instructions, () ->
        cell = getNewRobotPosition x: robot.instructions.x, y: robot.instructions.y, o: robot.instructions.o
        cell = validateRobotPosition(cell)

        if _.size cell
            robot.instructions = cell
            console.log messages.robot_move_2 + cell
        else
            console.log messages.robot_move_3 + cell  

        return

    return

startProgram = () ->    
    # start to move active robots sequentially
    _.chain robots
        .filter (robot) -> robot.active
        .each   (robot) -> startRobot robot

    return