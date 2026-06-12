mk = "";
belt_speed = 0;
is_placed = false;
dir_faced = "up";
is_holding_obj = false;
holding_obj_ref = noone;
can_move_obj = false;

update_spr = function() { sprite_index = get_conv_spr(mk, dir_faced); }
update_spr_with_given_direc = function(new_direc) { sprite_index = get_conv_spr(mk, new_direc); }