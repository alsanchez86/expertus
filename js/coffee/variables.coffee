###
    VARIABLES
###
maxRobotsCell   = 2
plateau         = {}
orientations    = ["n", "o", "s", "e"]
turns           = l: {n: "o", o: "s", s: "e", e: "n"}, r: {n: "e", o: "n", s: "o", e: "s"}
moves           = x: {n: 0, o: -1, s: 0, e: +1}, y: {n: +1, o: 0, s: -1, e: 0}
robots          = []                  
messages        = 
    default:                "Error"    
    end:                    "End"
    no_data:                "No input data"

    coordinates_check:      "Please, check the following coordinates: "
    coordinates_error_1:    "Error in input coordinates. Data type not valid"
    coordinates_error_2:    "Error in input coordinates. Input data not valid"    

    creating_plateau:       "Creating plateau"
    plateau_error_1:        "Error generating the plateau. Please, check the input data"

    deploying_robot:        "Deploying robot with id: "
    robot_error_1:          "Error deploying the robot with id: " 
    robot_error_2:          "Robot orientation error"
    robot_error_3:          "Error. " + maxRobotsCell + " robot/s in the same position"
    robot_error_4:          "Error. Robot's instructions are not valid"
    robot_error_5:          "Error moving robot to: "
    robot_error_6:          "Error moving robot. Out of plateau limits"

    robot_move_1:           "Starting to move robot with id: "
    robot_move_2:           "Moving robot to: "    
