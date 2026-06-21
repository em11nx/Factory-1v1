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
