isholding_obj = (instance_place(x,y,obj_ore_parent) != noone);
holding_obj_ref = isholding_obj ? instance_place(x,y,obj_ore_parent) : noone;
if(isholding_obj && !holding_obj_ref.moving){ holding_obj_ref.moving = true; can_move_obj = true; show_debug_message("they hit it"); }

show_debug_message(string(isholding_obj) + " | " + string(is_placed) + " | " + string(can_move_obj));
if(isholding_obj && is_placed && can_move_obj){
    if(string_ends_with(dir_faced, "up")){
        holding_obj_ref.direction = 90;
        holding_obj_ref.speed = belt_speed;
        if(holding_obj_ref.x != x){ holding_obj_ref.x = x; }
    }
    if(string_ends_with(dir_faced, "down")){
        holding_obj_ref.direction = 270;
        holding_obj_ref.speed = belt_speed;
        if(holding_obj_ref.x != x){ holding_obj_ref.x = x; }
    }
    if(string_ends_with(dir_faced, "left")){
        holding_obj_ref.direction = 180;
        holding_obj_ref.speed = belt_speed;
        if(holding_obj_ref.y != y){ holding_obj_ref.y = y; }
    } 
    if(string_ends_with(dir_faced, "right")){
        holding_obj_ref.direction = 0;
        holding_obj_ref.speed = belt_speed;
        if(holding_obj_ref.y != y){ holding_obj_ref.y = y; }
    }
}