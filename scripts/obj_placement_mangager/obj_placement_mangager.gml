function obj_placement_mangager(pla_x, pla_y){
    with(instance_nearest(pla_x, pla_y, obj_player)){
        if(string_ends_with(obj_getting_placed ,"conv")){
            if (placement_dir == "up" || placement_dir == "down"){
                curr_obj_being_placed = single_conv_placement(placement_dir, origin_x_placement_round64, current_y_placement_round64);
                if(curr_obj_being_placed != undefined) { curr_obj_being_placed.is_placed = true; }
            } else if (placement_dir == "left" || placement_dir == "right"){
                curr_obj_being_placed = single_conv_placement(placement_dir, current_x_placement_round64, origin_y_placement_round64);
                if(curr_obj_being_placed != undefined) { curr_obj_being_placed.is_placed = true; }
            }
        }
    }
}