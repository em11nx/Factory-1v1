var on_conv = instance_place(x, y, obj_conveyor_parent) != noone;
if(on_conv){ direction = get_pos_direc_from_str(instance_place(x, y, obj_conveyor_parent).dir_faced); }

var pv = get_position_vector(x, y, direction, (sprite_width/2)+1, (sprite_height/2)+1);
var does_next_conv_exist = collision_point(pv[0], pv[1], obj_conveyor_parent, false, true) != noone;
var is_there_ore_ahead = collision_point(pv[0], pv[1], obj_ore_parent, false, true) != noone;

if(on_conv && does_next_conv_exist && !is_there_ore_ahead){
    var conv = collision_point(pv[0], pv[1], obj_conveyor_parent, false, true);
    direction = get_pos_direc_from_str(conv.dir_faced);
    if(direction == 90 || direction == 270){ x = conv.x; }
    if(direction == 180 || direction == 0){ y = conv.y; }
    speed = conv.belt_speed;
}else{
    speed = 0;
}