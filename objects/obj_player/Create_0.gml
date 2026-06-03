#region State vars

curr_mode = "none";
can_change_modes = true;
can_move = true;

#endregion


#region building vars

origin_x_placement_round64 = 0;
origin_y_placement_round64 = 0;
current_x_placement_round64 = 0;
current_y_placement_round64 = 0;
last_frame_x_placement_round64 = 0;
last_frame_y_placement_round64 = 0;
max_x_placement_round64 = 0;
max_y_placement_round64 = 0;
max_conv = noone;
curr_conv = noone;
last_conv = noone;
idConvTemp = 0;
placement_dir = "down";
clock_or_counter = "";

#endregion


#region Camera vars
min_view_x = 0;
min_view_y = 0;
max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

#endregion