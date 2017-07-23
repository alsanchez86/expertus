###
    VALIDATIONS
###

###
    Valida las coordenadas introducidas.
    return object
###
validatePlateauCoordinates = (data) ->    
    # validate data type
    if typeof data isnt "string"
        console.log messages.coordinates_error_1
        return {}
    
    splited = data.split(" ");

    # validate coordinates length
    if splited.length isnt 2
        console.log messages.coordinates_error_1
        return {}

    # to integer
    x = parseInt(splited[0]);
    y = parseInt(splited[1]);

    # validate coordinates data
    unless x or y
        console.log messages.coordinates_error_1
        return {}    

    x: x, y: y

###
    Valida las coordenadas introducidas.
    return object
###
validateRobotCoordinates = (data) ->    
    # validate data type
    if typeof data isnt "string"
        console.log messages.coordinates_error_1
        return {}
    
    splited = data.split(" ");

    # validate coordinates length
    if splited.length isnt 3
        console.log messages.coordinates_error_1
        return {}

    # to integer
    x = parseInt(splited[0]);
    y = parseInt(splited[1]);
    o = splited[2];

    # validate coordinates data
    unless x or y
        console.log messages.coordinates_error_1
        return {}    

    # case sensitive!
    if o != "N" and o != "S" and o != "E" and o != "O"
        console.log messages.coordinates_error_2
        return {}    

    x: x, y: y, o: o

###
    Valida la posición del robot
    Tiene en cuenta:
        - No puede salir de los límites de la meseta
        - No puede haber más de dos robots en la misma casilla

    return object
###
validateRobotPosition = (data) ->      
    # no está vacio
    unless _.size(data)        
        return {}

    # 1.- No puede salir de los límites de la meseta
    if data.x < plateau.minx || data.y < plateau.miny
        return {}

    if data.x > plateau.maxx || data.y > plateau.maxy
        return {}

    # 2.- No puede haber más de dos robots en la misma casilla
    # robots que comparten dicha posicion
    share = _.filter robots, (robot) -> robot.x == data.x and robot.y == data.y

    if share.length > 2
        console.log messages.position_error_1
        return {}

    data