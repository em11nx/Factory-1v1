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
