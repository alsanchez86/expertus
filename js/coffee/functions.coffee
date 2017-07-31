###
    FUNCTIONS
###

###
    Setea los límites de la meseta.

    @param data: string
    @return void
###
createPlateau = (data) ->           
    consoleWrite messages.creating_plateau, "success"

    data = validatePlateauCoordinates data

    unless _.size data        
        consoleWrite messages.plateau_error_1, "error"
        return

    plateau.minx = 0
    plateau.miny = 0
    plateau.maxx = data.x
    plateau.maxy = data.y
    return

###
    Deploy Robot
    Si los datos no son correctos, se despliega un robot inactivo (active: false)

    @param data: string
    @return void
###
deployRobot = (data) ->
    id = _.size(robots) + 1
    
    consoleWrite messages.deploying_robot + id, "success"

    robot   = position: {x: 0, y: 0, o: ""}, id: 0, active: false, instructions: []
    data    = validateRobotCoordinates data
    data    = validateRobotPosition data
    
    if _.size data
        robot.position.x    = data.x
        robot.position.y    = data.y
        robot.position.o    = data.o
        robot.active        = true      
    else        
        consoleWrite messages.robot_error_1 + id, "error"

    robot.id = id
    robots.push robot
    return

###
    Add instructions to single robot 

    @param robot: object
    @param data: string or array   
    @return void
###
addInstructionsRobot = (robot, data) ->    
    data = validateRobotInstructions data

    if _.size data
        robot.instructions = data

    return

###
    Add instructions to last deployed robot

    @param data: string
    @return void
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

###
    Turn robot by orientation

    @param instruction: string
    @param orientation: string
    @return void
###
turnRobot = (instruction, orientation) ->
    turns[instruction][orientation]

###
    Move single robot

    @param robot: object
    @return void
###
moveRobot = (robot) ->
    moveX = moves.x[robot.position.o]
    moveY = moves.y[robot.position.o]

    x = robot.position.x + moveX
    y = robot.position.y + moveY

    x: x, y: y

### 
    Devuelve la nueva posición en función de la orientación del robot y actual posición del mismo    

    @param robot: object
    @param instruction: string
    @return object
###
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

### 
    Recorrer el conjunto de instrucciones validando cada posición que va a ocupar el robot

    @param robot: object    
    @return void
###
startRobot = (robot) ->           
    consoleWrite messages.robot_move_1 + robot.id, ""

    _.each robot.instructions, (instruction) ->
        position    = getNewRobotPosition robot, instruction        
        position    = validateRobotPosition position        

        if _.size position                          
            consoleWrite messages.robot_move_2 + "[x: " + position.x +  "], [y: "  + position.y + "]" + ", [o: " + position.o + "]", ""

            # set new robot position          
            robot.position = position              
        return

    return

### 
    Start to move active robots sequentially
###
start = () ->        
    _.chain robots
        .filter (robot) -> robot.active
        .each   (robot) -> 
            startRobot robot
            return

    return   
