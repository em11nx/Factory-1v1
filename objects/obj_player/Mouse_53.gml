if(curr_mode == "building"){ 
    origin_x_placement_round64 = (mouse_x - mouse_x % 64) + 32;
    origin_y_placement_round64 = (mouse_y - mouse_y % 64) + 32;
    max_x_placement_round64 = origin_x_placement_round64;
    max_y_placement_round64 = origin_y_placement_round64;
}