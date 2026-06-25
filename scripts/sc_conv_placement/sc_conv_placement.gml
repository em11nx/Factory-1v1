/// @desc Places down a single conveyor belt
/// @param {String} placement_dir The direction that the belt will face
/// @param {Real} x_round Rounded x
/// @param {Real} y_round Rounded y
/// @return {String} The corrected placement direction
function single_conv_placement(placement_dir, x_round, y_round){
    
    placement_dir = get_conv_direc(placement_dir, x_round, y_round);
    
    if(instance_position(x_round, y_round, obj_placed_obj) == noone){
        var placed_conv = instance_create_layer(x_round,y_round,"Instances",obj_mkOne_conveyor);
        placed_conv.dir_faced = placement_dir;
        placed_conv.update_spr();
        return placed_conv;
    }
}

/// @desc Handles the zoop function of conveyor belts during placement
/// @param {Real} pla_x Player x
/// @param {Real} pla_y Player y
function conv_zoop(pla_x, pla_y){
    with(instance_nearest(pla_x,pla_y, obj_player)){
        var last_dir = placement_dir;
        placement_dir = get_direc_to_mouse(placement_dir, origin_x_placement_round64, origin_y_placement_round64);
        var sign_of_curr_minus_orgin_x = sign(current_x_placement_round64 - origin_x_placement_round64); 
        var sign_of_curr_minus_orgin_y = sign(current_y_placement_round64 - origin_y_placement_round64);
        
        if(placement_dir == "left" || placement_dir == "right"){
               for(var i = 0; i <= abs(current_x_placement_round64 - origin_x_placement_round64); i += 64){
                   curr_obj_being_placed = single_conv_placement(placement_dir, origin_x_placement_round64+(i*sign_of_curr_minus_orgin_x), max_y_placement_round64);
                   if(curr_obj_being_placed != undefined) { curr_obj_being_placed.is_placed = true; }
               }
        }
        if(placement_dir == "up" || placement_dir == "down"){
               for(var i = 0; i <= abs(current_y_placement_round64 - origin_y_placement_round64); i += 64){
                   curr_obj_being_placed = single_conv_placement(placement_dir, max_x_placement_round64, origin_y_placement_round64+(i*sign_of_curr_minus_orgin_y));
                   if(curr_obj_being_placed != undefined) { curr_obj_being_placed.is_placed = true; }
               }
        }
        
        var last_ori_x = origin_x_placement_round64;
        var last_ori_y = origin_y_placement_round64;
        if(last_dir == "up" || last_dir == "down"){
               origin_x_placement_round64 = origin_x_placement_round64;
               origin_y_placement_round64 = max_y_placement_round64;
        } else if(last_dir == "left" || last_dir == "right"){
               origin_x_placement_round64 = max_x_placement_round64;
               origin_y_placement_round64 = origin_y_placement_round64;
        }
        max_x_placement_round64 = current_x_placement_round64;
        max_y_placement_round64 = current_y_placement_round64;
        
        max_conv.update_spr_with_given_direc(last_dir + "_" + placement_dir);
        max_conv = (curr_obj_being_placed != undefined) ? curr_obj_being_placed : last_conv;
    }
}

