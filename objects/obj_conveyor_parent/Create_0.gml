mk = "";
belt_speed = 0;
is_placed = false;
dir_faced = "up";
is_holding_obj = false;
holding_obj_ref = noone;
can_move_obj = false;

update_spr = function() { var res = get_conv_spr(mk, dir_faced); sprite_index = res[0]; image_angle = res[1]; }
update_spr_with_given_direc = function(new_direc) { dir_faced = new_direc; var res = get_conv_spr(mk, new_direc); sprite_index = res[0]; image_angle = res[1]; }