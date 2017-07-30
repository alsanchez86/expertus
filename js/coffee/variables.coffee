###
    VARIABLES
###
messages = 
    default:                "Error."
    coordinates_error_1:    "Coordinate error."
    coordinates_error_2:    "Robot orientation error."
    coordinates_check:      "Please, check the following coordinates: "
    plateau_error_1:        "Error generating the plateau. Please, check the coordinates."
    deploy_error_1:         "Error deploying the robot."    
    position_error_1:       "Error. There are two robots in that position."
    instructions_error_1:   "Error. Instructions are not valid."
    robot_move_1:           "Starting robot with id: "
    robot_move_2:           "Moving robot to: "
    robot_move_3:           "Error moving robot to: "

maxRobotsCell   = 2
plateau         = minx: 0, miny: 0, maxx: 0, maxy: 0
turns           = l: {n: "o", o: "s", s: "e", e: "n"}, r: {n: "e", o: "n", s: "o", e: "s"}
moves           = x: {n: 0, o: -1, s: 0, e: +1}, y: {n: +1, o: 0, s: -1, e: 0}
robots          = []                  
