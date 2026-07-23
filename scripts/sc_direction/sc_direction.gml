/// @desc Takes the current direction and finds which way the mouse is on the other axis
/// @param {String} curr_dirc The current direction
/// @param {Real} origin_mouse_x_round64 The rounded x value of the mouse
/// @param {Real} origin_mouse_y_round64 The rounded y value of the mouse
/// @return {String} The new direction
function get_direc_to_mouse(curr_dirc, origin_mouse_x_round64, origin_mouse_y_round64){
    
    if(curr_dirc == "down" || curr_dirc == "up"){
        if((origin_mouse_x_round64 - mouse_x) <= 0){
            return "right";
        }
        else if((origin_mouse_x_round64 - mouse_x) > 0){
            return "left";
        }
    }
    
    else if(curr_dirc == "left" || curr_dirc == "right"){
        if((origin_mouse_y_round64 - mouse_y) <= 0){
            return "down";
        }
        else if((origin_mouse_y_round64 - mouse_y) > 0){
            return "up";
        }
    }
}

/// @desc Finds next the clockwise direction
/// @param {String} curr_direc The current direction
/// @return {String} The next direction
function get_clockwise_direc(curr_direc){
    switch (curr_direc) {
    	
        case "up":
            return "right";
        
        case "right":
            return "down";
            
        case "down":
            return "left";
            
        case "left":
            return "up";
        
        default:
            show_error($"Invalid direction sent to get_clockwise_direc \n direc val: {curr_direc}", true);
    }
}

/// @desc Finds next the counterclockwise direction
/// @param {String} curr_direc The current direction
/// @return {String} The next direction
function get_counterclockwise_direc(curr_direc){
    switch (curr_direc) {
    	
        case "up":
            return "left";
        
        case "right":
            return "up";
            
        case "down":
            return "right";
            
        case "left":
            return "down";
        
        default:
            show_error($"Invalid direction sent to get_counterclockwise_direc \n direc val: {curr_direc}", true);
    }
}

function get_random_direc(){
    switch (irandom(3)) {
    	
        case 0:
            return "up";
            
        case 1:
            return "down";
        
        case 2:
            return "right";
        
        case 3:
            return "left";
    }
}