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
    if typeof data isnt "string"
        console.log messages.coordinates_error_1
        return {}
    
    splited = data.split " "

    # validate coordinates length
    if splited.length isnt 2
        console.log messages.coordinates_error_1
        return {}

    # to integer
    x = parseInt splited[0]
    y = parseInt splited[1]

    # validate coordinates data
    unless x or y
        console.log messages.coordinates_error_1
        return {}    

    x: x, y: y

###
    Valida las coordenadas introducidas para robot

    param string
    return object
###
validateRobotCoordinates = (data) ->    
    # validate data type
    if typeof data isnt "string"
        console.log messages.coordinates_error_1
        return {}
    
    splited = data.split " "

    # validate coordinates length
    if splited.length isnt 3
        console.log messages.coordinates_error_1
        return {}

    # to integer
    x = parseInt splited[0]
    y = parseInt splited[1]

    # to lowercase
    o = splited[2].toString().toLowerCase()

    # validate coordinates data
    unless x or y
        console.log messages.coordinates_error_1
        return {}    
    
    # no case sensitive
    if o != "n" and o != "s" and o != "e" and o != "o"
        console.log messages.coordinates_error_2
        return {}    

    x: x, y: y, o: o

###
    Valida la posición del robot
    Tiene en cuenta:
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
    if typeof data.x is "undefined" or typeof data.y is "undefined" or typeof data.o is "undefined"
        console.log messages.deploy_error_1
        return {}

    # 1.- No puede salir de los límites de la meseta
    if data.x < plateau.minx or data.y < plateau.miny or data.x > plateau.maxx or data.y > plateau.maxy
        return {}

    # 2.- No puede haber más de dos robots en la misma casilla    
    share = _.filter robots, (robot) -> robot.x == data.x and robot.y == data.y

    if share.length > maxRobotsCell
        console.log messages.position_error_1
        return {}

    data