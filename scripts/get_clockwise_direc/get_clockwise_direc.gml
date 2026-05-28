// Param: direction(str)   return: direction(str)
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