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