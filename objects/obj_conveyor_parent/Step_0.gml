isholding_obj = (instance_place(x,y,obj_ore_parent) != noone) && (instance_place(x,y,obj_ore_parent).being_held_by == noone || instance_place(x,y,obj_ore_parent).being_held_by == id);
holding_obj_ref = isholding_obj ? instance_place(x,y,obj_ore_parent) : noone;
if(holding_obj_ref != noone){ holding_obj_ref.being_held_by = id; }

if(string_ends_with(dir_faced, "up")){
    next_conv = instance_place(x, y-sprite_height, obj_conveyor_parent);
    is_there_another_conv = next_conv != noone;
}
if(string_ends_with(dir_faced, "down")){
    next_conv = instance_place(x, y+sprite_height, obj_conveyor_parent);
    is_there_another_conv = next_conv != noone;
}
if(string_ends_with(dir_faced, "left")){
    next_conv = instance_place(x-sprite_width, y, obj_conveyor_parent);
    is_there_another_conv = next_conv != noone;
}
if(string_ends_with(dir_faced, "right")){
    next_conv = instance_place(x+sprite_width, y, obj_conveyor_parent);
    is_there_another_conv = next_conv != noone;
}

if(is_there_another_conv && isholding_obj && is_placed && holding_obj_ref.speed = 0 && next_conv.holding_obj_ref == noone){
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