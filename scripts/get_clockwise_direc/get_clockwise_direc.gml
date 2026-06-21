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