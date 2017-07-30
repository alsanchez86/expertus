###
    FUNCTIONS
###

###
    Almacena los límites de la meseta.
    return void
###
createPlateau = (data) ->       
    console.log messages.creating_plateau

    data = validatePlateauCoordinates data

    unless _.size data
        console.log messages.plateau_error_1
        return

    plateau.minx = 0
    plateau.miny = 0
    plateau.maxx = data.x
    plateau.maxy = data.y
    return

###
    Deploy Robot
    Si los datos no son correctos, se despliega un robot inactivo (active: false)
###
deployRobot = (data) ->
    id      = _.size(robots) + 1

    console.log messages.deploying_robot + id

    robot   = position: {x: 0, y: 0, o: ""}, id: 0, active: false, instructions: []
    data    = validateRobotCoordinates data
    data    = validateRobotPosition data
    
    if _.size data
        robot.position.x    = data.x
        robot.position.y    = data.y
        robot.position.o    = data.o
        robot.active        = true      
    else
        console.log messages.robot_error_1 + id

    robot.id = id
    robots.push robot
    return

###
    Add instructions to single robot 
    param robot: object
    param data: string or array   
###
addInstructionsRobot = (robot, data) ->    
    data = validateRobotInstructions data

    if _.size data
        robot.instructions = data

    return

###
    Add instructions to last deployed robot
    param data: string
###
addInstructionsLastAddedRobot = (data) ->         
    # obtener último robot activo añadido
    last = _.chain robots
            .filter (robot) -> robot.active
            .last()
            .value()

    # añadir instrucciones al robot
    if last
        addInstructionsRobot last, data

    return

turnRobot = (instruction, orientation) ->
    turns[instruction][orientation]

moveRobot = (robot) ->
    moveX = moves.x[robot.position.o]
    moveY = moves.y[robot.position.o]

    x = robot.position.x + moveX
    y = robot.position.y + moveY

    x: x, y: y

# devolver la nueva posición en función de la orientación del robot y actual posición del mismo    
getNewRobotPosition = (robot, instruction) ->    
    x = robot.position.x
    y = robot.position.y
    o = robot.position.o

    if instruction == "l" or instruction == "r"
        o = turnRobot instruction, robot.position.o

    if instruction == "m"
        position = moveRobot robot
        return x: position.x, y: position.y, o: o  
    
    x: x, y: y, o: o  

# recorrer el conjunto de instrucciones 
# hay que ir validando cada posición que va a tomar el robot. validateRobotPosition()    
startRobot = (robot) ->       
    console.log messages.robot_move_1 + robot.id

    _.each robot.instructions, (instruction) ->
        position    = getNewRobotPosition robot, instruction        
        position    = validateRobotPosition position
        message     = "[x: " + position.x +  "], [y: "  + position.y + "]" + ", [o: " + position.o + "]"

        if _.size position              
            console.log messages.robot_move_2 + message

            # set new robot position          
            robot.position = position            
        else
            console.log messages.robot_error_5 + message
    
        return

    return

# start to move active robots sequentially
start = () ->        
    _.chain robots
        .filter (robot) -> robot.active
        .each   (robot) -> startRobot robot
    
    # cuando termine el each de robots, mostrar por consola la posición de cada uno

    
    return

# APP
bootstrap = () -> 
    createPlateau "5 5"

    unless _.size plateau
        console.log messages.end
        return

    ## Robot 1
    deployRobot "1 2 X"
    addInstructionsLastAddedRobot "LMLMLMLMM"

    ## Robot 2
    deployRobot "3 3 E"
    addInstructionsLastAddedRobot "MMRMMRMRRM"

    # start
    start()