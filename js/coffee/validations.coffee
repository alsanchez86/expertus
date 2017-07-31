###
    VALIDATIONS
###

###
    Valida las coordenadas introducidas para el plateau

    @param data: string
    @return object
###
validatePlateauCoordinates = (data) ->       
    # validate data type
    unless _.isString data        
        consoleWrite messages.coordinates_error_1, "error"
        return {}
    
    data = data.split " "

    # validate coordinates length
    if _.size(data) isnt 2        
        consoleWrite messages.coordinates_error_2, "error"
        return {}

    # to integer
    x = parseInt data[0]
    y = parseInt data[1]

    # validate coordinates type data
    if _.isNaN(x) or _.isNaN(y)        
        consoleWrite messages.coordinates_error_2, "error"
        return {}    

    # positive number
    if x < 0 or y < 0        
        consoleWrite messages.coordinates_error_2, "error"
        return {}

    x: x, y: y

###
    Valida las coordenadas introducidas para un robot

    @param data: string
    @return object
###
validateRobotCoordinates = (data) ->    
    # validate data type
    unless _.isString data        
        consoleWrite messages.coordinates_error_1, "error"
        return {}
    
    data = data.split " "

    # validate coordinates length
    if _.size(data) isnt 3        
        consoleWrite messages.coordinates_error_2, "error"
        return {}

    # to integer
    x = parseInt data[0]
    y = parseInt data[1]

    # to lowercase
    o = data[2].toLowerCase()

    # validate coordinates type data
    if _.isNaN(x) or _.isNaN(y)        
        consoleWrite messages.coordinates_error_2, "error"
        return {}    

    # positive number
    if x < 0 or y < 0        
        consoleWrite messages.coordinates_error_2, "error"
        return {}        
    
    # orientation validation
    if _.indexOf(orientations, o) == -1            
        consoleWrite messages.robot_error_2, "error"
        return {}    

    x: x, y: y, o: o

###
    Valida la posición del robot:    
    - No puede salir de los límites de la meseta
    - No puede haber más de dos robots en la misma casilla

    @param data: object {x: x, y: y, o: o}
    @return object
###
validateRobotPosition = (data) ->      
    # no está vacio
    unless _.size data
        return {}    

    # validate data type
    if (_.isUndefined data.x) or (_.isUndefined data.y) or (_.isUndefined data.o)                
        return {}

    # 1.- No puede salir de los límites de la meseta
    if data.x < plateau.minx or data.y < plateau.miny or data.x > plateau.maxx or data.y > plateau.maxy        
        consoleWrite messages.robot_error_6, "error"
        return {}

    # 2.- No puede haber más de dos robots en la misma casilla    
    share = _.filter robots, (robot) -> robot.position.x == data.x and robot.position.y == data.y    

    if _.size(share) > maxRobotsCell        
        consoleWrite messages.robot_error_3, "error"
        return {}

    data

###
    Valida la instrucciones pasadas al robot:    
        - Transformar string en array
        - Que todos los valores sean L, R o M

    @param data: string
    @return object
###
validateRobotInstructions = (data) ->    
    # validate data type
    unless _.isString data        
        consoleWrite messages.robot_error_4, "error"
        return []    
    
    # lowercase
    data = data.toLowerCase()

    # split
    data = data.split ""

    # validate coordinates length
    unless _.size data        
        consoleWrite messages.robot_error_4, "error"
        return []    

    # every value == "l" or == "r" or == "m"
    every = _.every data, (instruction) -> instruction == "l" or instruction == "r" or instruction == "m"

    unless every        
        consoleWrite messages.robot_error_4, "error"
        return []
    
    data        