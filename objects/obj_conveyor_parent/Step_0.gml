isholding_obj = (instance_place(x,y,obj_ore_parent) != noone);
holding_obj_ref = isholding_obj ? instance_place(x,y,obj_ore_parent) : noone;

if(isholding_obj && is_placed){ 
    if(string_ends_with(dir_faced, "up") && instance_place(x_middle, y_middle-64, obj_conveyor_parent) != noone){
        holding_obj_ref.y -= belt_speed;
        if(holding_obj_ref.x != x_middle){ holding_obj_ref.x = x_middle; }
    }
    if(string_ends_with(dir_faced, "down") && instance_place(x_middle, y_middle+64, obj_conveyor_parent) != noone){
        holding_obj_ref.y += belt_speed;
        if(holding_obj_ref.x != x_middle){ holding_obj_ref.x = x_middle; }
    }
    if(string_ends_with(dir_faced, "left") && instance_place(x_middle-64, y_middle, obj_conveyor_parent) != noone){
        holding_obj_ref.x -= belt_speed;
        if(holding_obj_ref.y != y_middle){ holding_obj_ref.y = y_middle; }
    }
    if(string_ends_with(dir_faced, "right") && instance_place(x_middle+64, y_middle, obj_conveyor_parent) != noone){
        holding_obj_ref.x += belt_speed;
        if(holding_obj_ref.y != y_middle){ holding_obj_ref.y = y_middle; }
    }
}