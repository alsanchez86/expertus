messages = 
    default: "Error."
    plateau_error_1: "Error generating the plateau. Please, check the coordinates."    

###
    Valida las coordenadas introducidas.
    return array
###
validatePlateau = (data) ->        
    # split string by space
    splited = data.split(" ");

    # validate coordinates length
    if splited.length isnt 2
        console.log messages.plateau_error_1
        return []

    # to integer
    x = parseInt(splited[0]);
    y = parseInt(splited[1]);

    # validate coordinates data type
    unless x or y
        console.log messages.plateau_error_1
        return []             
    return [x, y]

generatePlateau = (data) ->   
    plateau     = []
    coordinates = validatePlateau(data)

    if not coordinates.length        
        return

    

    return

###
    Ejecución de funciones.
    Estas funciones serán llamadas desde el HTML a través de JQuery a través del atributo id
###

generatePlateau("2 5");
