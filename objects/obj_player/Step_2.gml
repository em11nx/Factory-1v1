last_frame_x = mouse_x;
last_frame_y = mouse_y;

#region Moves the view with room limits

var halfView_width = camera_get_view_width(view_camera[0]) / 2;
var halfView_height = camera_get_view_height(view_camera[0]) / 2;

var cx = x - halfView_width + (sprite_width / 2);
var cy = y - halfView_height + (sprite_height / 2);

cx = clamp(cx, min_view_x, max_view_x);
cy = clamp(cy, min_view_x, max_view_y);

camera_set_view_pos(view_camera[0], cx, cy);

#endregion