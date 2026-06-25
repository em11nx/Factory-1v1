#region movement

if(can_move){
    var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));
    var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
    
    var move_hor = 0;
    var move_ver = 0;
    
    if(_hor != 0 or _ver != 0){ 
        var dir = point_direction(0, 0, _hor, _ver);
    
        //1 is movement speed: curr 2
        move_hor = lengthdir_x(2, dir);
        move_ver = lengthdir_y(2, dir);
    }
    
    if(x + move_hor + sprite_width/2 > room_width && move_hor > 0){
        move_hor = 0;
    }
    if(x + move_hor - sprite_width/2 <= 0 && move_hor < 0){
        move_hor = 0;
    }
    if(y + move_ver + sprite_height/2 > room_height && move_ver > 0){
        move_ver = 0;
    }
    if(y + move_ver - sprite_height/2 < 0 && move_ver < 0){
        move_ver = 0;
    }

    
    move_and_collide(move_hor*delta_time/5000, move_ver*delta_time/5000, obj_smelter);
    
}

#endregion

#region mode changing

can_change_modes = true;
if(curr_mode == "none") and can_change_modes{
    if(keyboard_check_pressed(ord("B"))){
        curr_mode = "building";
        can_change_modes = false;
    }
    if(keyboard_check_pressed(ord("E"))){
        curr_mode = "inventory";
        can_change_modes = false;
    }
}

if(curr_mode == "building") and can_change_modes{
    if(keyboard_check_pressed(ord("B")) or keyboard_check_pressed(vk_escape)){
        instance_destroy(id_obj_temp);
        curr_mode = "none";
        can_change_modes = false;
    }
}

if(curr_mode == "inventory") and can_change_modes{
    if(keyboard_check_pressed(vk_escape) or keyboard_check_pressed(ord("E"))){
        inventory_open = false;
        curr_mode = "none";
        can_change_modes = false;
    }
}

#endregion

if(curr_mode == "building"){
    
    if(mouse_wheel_up())
        { placeable_list_num = (placeable_list_num > 0) ? placeable_list_num-1 : 0; }
    if(mouse_wheel_down())
        { placeable_list_num = (placeable_list_num < array_length(placeable_obj_list)-1) ? placeable_list_num+1 : array_length(placeable_obj_list)-1; }
    
    obj_getting_placed = placeable_obj_list[placeable_list_num];
     if(mouse_wheel_up() || mouse_wheel_down()){
        instance_destroy(id_obj_temp);
        id_obj_temp = noone;
    }
    
    current_x_placement_round64 = (mouse_x - mouse_x % 64) + 32;
    current_y_placement_round64 = (mouse_y - mouse_y % 64) + 32;
    
    if(current_x_placement_round64 != last_frame_x_placement_round64) or (current_y_placement_round64 != last_frame_y_placement_round64){
        instance_destroy(id_obj_temp);
        id_obj_temp = noone;
    }
    
    var overlapping_obj = instance_position(current_x_placement_round64, current_y_placement_round64, obj_placed_obj);
    if(overlapping_obj == noone){
        
        ghost_building(x,y);
        id_obj_temp.image_alpha = 0.5;
    }
    
    if(keyboard_check_pressed(ord("R")) && !mouse_check_button(mb_left)){
        placement_dir = get_clockwise_direc(placement_dir);
        instance_destroy(id_obj_temp);
        id_obj_temp = noone;
    }
    
    if(mouse_check_button(mb_right) && overlapping_obj != id_obj_temp){
        instance_destroy(overlapping_obj);
    }
    
    if(mouse_check_button(mb_left)){
        
        instance_destroy(id_obj_temp);
        id_obj_temp = noone;
        
        var change_x = (origin_x_placement_round64 - current_x_placement_round64) != 0;
        var change_y = (origin_y_placement_round64 - current_y_placement_round64) != 0;
        var changed_needed = ((placement_dir == "down" || placement_dir == "up") && change_x) || ((placement_dir == "left" || placement_dir == "right") && change_y);
        
        if(keyboard_check_pressed(ord("R")) && changed_needed && string_ends_with(obj_getting_placed, "conv")){
            conv_zoop(x,y);
        }
        
        obj_placement_mangager(x,y);
        
        if(curr_obj_being_placed != undefined && string_ends_with(obj_getting_placed, "conv")){
            if(mouse_x >= max_x_placement_round64 && placement_dir == "right"){
                max_x_placement_round64 = current_x_placement_round64;
                max_conv = curr_obj_being_placed;
            }
            if(mouse_x <= max_x_placement_round64 && placement_dir == "left"){
                max_x_placement_round64 = current_x_placement_round64;
                max_conv = curr_obj_being_placed;
            }
            if(mouse_y >= max_y_placement_round64 && placement_dir == "down"){
                max_y_placement_round64 = current_y_placement_round64;
                max_conv = curr_obj_being_placed;
            }
            if(mouse_y <= max_y_placement_round64 && placement_dir == "up"){
                max_y_placement_round64 = current_y_placement_round64;
                max_conv = curr_obj_being_placed;
            }
            last_conv = curr_obj_being_placed;
        }
    }
}

if(curr_mode == "inventory"){
    inventory_open = true;
}