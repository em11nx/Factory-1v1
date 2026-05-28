// Param: direction(str)   return: direction(str)
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