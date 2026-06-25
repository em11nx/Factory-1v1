/// @desc Places the desired object during player build mode
/// @param {Real} pla_x Player x
/// @param {Real} pla_y Player y
function obj_placement_mangager(pla_x, pla_y){
    if((instance_position(mouse_x, mouse_y, obj_placed_obj) == noone)){
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
            if(obj_getting_placed == "chest"){
                instance_create_layer(current_x_placement_round64, current_y_placement_round64, "Instances", obj_chest);
            }
        }
    }
}

/// @desc Places a shell object in the players build mode
/// @param {Real} x Player x
/// @param {Real} y Player y
function ghost_building(x,y){
    with(instance_nearest(x,y, obj_player)){
        if(string_ends_with(obj_getting_placed ,"conv")){
            var direc = get_conv_direc(placement_dir, current_x_placement_round64, current_y_placement_round64);
            id_obj_temp = instance_create_layer(current_x_placement_round64, current_y_placement_round64, "Instances", shell_obj);
            
            var res = get_conv_spr("1", direc);
            id_obj_temp.sprite_index = res[0];
            id_obj_temp.image_angle = res[1];
        }
        if(obj_getting_placed == "chest"){
            id_obj_temp = instance_create_layer(current_x_placement_round64, current_y_placement_round64, "Instances", shell_obj);
            id_obj_temp.sprite_index = chest;
        }
    }
}