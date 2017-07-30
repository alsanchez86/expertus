###
    VALIDATIONS
###

###
    Valida las coordenadas introducidas para el plateau

    param string
    return object
###
validatePlateauCoordinates = (data) ->       
    # validate data type
    unless _.isString data
        console.log messages.coordinates_error_1
        return {}
    
    data = data.split " "

    # validate coordinates length
    if _.size data isnt 2
        console.log messages.coordinates_error_2
        return {}

    # to integer
    x = parseInt data[0]
    y = parseInt data[1]

    # validate coordinates type data
    if _.isNaN(x) or _.isNaN(y)
        console.log messages.coordinates_error_2
        return {}    

    # positive number
    if x < 0 or y < 0
        console.log messages.coordinates_error_2
        return {}

    x: x, y: y

###
    Valida las coordenadas introducidas para un robot

    param string
    return object
###
validateRobotCoordinates = (data) ->    
    # validate data type
    unless _.isString data
        console.log messages.coordinates_error_1
        return {}
    
    data = data.split " "

    # validate coordinates length
    if _.size data isnt 3
        console.log messages.coordinates_error_2
        return {}

    # to integer
    x = parseInt data[0]
    y = parseInt data[1]

    # to lowercase
    o = data[2].toLowerCase()

    # validate coordinates type data
    if _.isNaN(x) or _.isNaN(y)
        console.log messages.coordinates_error_2
        return {}    

    # positive number
    if x < 0 or y < 0
        console.log messages.coordinates_error_2
        return {}        
    
    # orientation validation
    if _.indexOf(orientations, o) == -1    
        console.log messages.robot_error_2
        return {}    

    x: x, y: y, o: o

###
    Valida la posición del robot:    
    - No puede salir de los límites de la meseta
    - No puede haber más de dos robots en la misma casilla

    param object {x: x, y: y, o: o}
    return object
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
        console.log messages.robot_error_6
        return {}

    # 2.- No puede haber más de dos robots en la misma casilla    
    share = _.filter robots, (robot) -> robot.x == data.x and robot.y == data.y

    if _.size share > maxRobotsCell
        console.log messages.robot_error_3
        return {}

    data

###
    Valida la instrucciones pasadas al robot:    
    - Transformar string en array
    - Que todos los valores sean L, R o M

    param string
    return object
###
validateRobotInstructions = (data) ->    
    # validate data type
    unless _.isString data
        console.log messages.robot_error_4
        return []    
    
    # lowercase
    data = data.toLowerCase()

    # split
    data = data.split ""

    # validate coordinates length
    unless _.size data
        console.log messages.robot_error_4
        return []    

    # every value == "l" or == "r" or == "m"
    every = _.every data, (instruction) -> instruction == "l" or instruction == "r" or instruction == "m"

    unless every
        console.log messages.robot_error_4
        return []
    
    data        