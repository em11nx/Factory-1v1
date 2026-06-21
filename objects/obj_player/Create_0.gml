#region State vars

curr_mode = "none";
in_ui = false;
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
curr_obj_being_placed = noone;
last_conv = noone;
id_obj_temp = 0;
placement_dir = "down";


placeable_obj_list = ["mkOne_conv", "chest"];
placeable_list_num = 0;
obj_getting_placed = placeable_obj_list[placeable_list_num];

#endregion


#region Camera vars
min_view_x = 0;
min_view_y = 0;
max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

#endregion

#region Inventory vars

inventory = create_inventory(8, 5);

#endregion