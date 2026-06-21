gui_open = true;
var player = instance_nearest(x, y, obj_player);
player.can_move = false;
player.curr_mode = "ui";
player.in_ui = true;