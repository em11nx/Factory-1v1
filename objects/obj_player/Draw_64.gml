if(inventory_open || other_inventory_open){
    #region drawing inventory
    var sprite_size = 64;
    var outline_size = 4;
    var padding = 4;
    var num_inventory_rows = array_length(inventory);
    var num_inventory_cols = array_length(inventory[0]);
    var inventory_x_max = ((sprite_size + outline_size) * num_inventory_cols) + padding*(num_inventory_cols+3);
    var inventory_y_max = ((sprite_size + outline_size) * num_inventory_rows) + padding*(num_inventory_rows+3);
    
    //inventory bg
    draw_sprite_stretched(ui_box, 0, sprite_size, sprite_size, inventory_x_max, inventory_y_max);
    draw_sprite_stretched(ui_box, 0, sprite_size+inventory_x_max+padding, sprite_size, inventory_x_max+sprite_size+padding, inventory_y_max)
    
    var sslot_r = -1;
    var sslot_c = -1;
    
    //draws the inventory slots
    for(var r = 0; r < num_inventory_rows; r++) {
    	for(var c = 0; c < num_inventory_cols; c++){
            var mouse_in_box = false;
            if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
                sprite_size, sprite_size, sprite_size+inventory_x_max, sprite_size+inventory_y_max)){
                
                var box_x = sprite_size + (outline_size+padding)*(c+1) + (sprite_size * c);
                var box_y = sprite_size + (outline_size+padding)*(r+1) + (sprite_size * r);
                mouse_in_box = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
                    box_x, box_y, box_x+sprite_size+(outline_size+padding), box_y+sprite_size+(outline_size+padding));
            }
            
            if(mouse_in_box){
                sslot_r = r;
                sslot_c = c;
                draw_sprite_stretched(
                    ui_slot_selected, 0,
                    sprite_size + (outline_size+padding)*(c+1) + (sprite_size * c),
                    sprite_size + (outline_size+padding)*(r+1) + (sprite_size * r),
                    sprite_size + outline_size,
                    sprite_size + outline_size
                );
            }else{
                draw_sprite_stretched(
                    ui_slot, 0,
                    sprite_size + (outline_size+padding)*(c+1) + (sprite_size * c),
                    sprite_size + (outline_size+padding)*(r+1) + (sprite_size * r),
                    sprite_size + outline_size,
                    sprite_size + outline_size
                );
            }
            if(inventory[r][c][0] == "Iron ore"){
                draw_sprite(
                    temp_iron, 0,
                    sprite_size + (outline_size+padding)*(c+1) + (sprite_size * c) + sprite_size/2,
                    sprite_size + (outline_size+padding)*(r+1) + (sprite_size * r) + sprite_size/2
                );
            }
        }
    }
    
    if(other_inventory_id != noone){
        var other_inventory = other_inventory_id.inventory;
        var other_inventory_num_inventory_rows = array_length(other_inventory);
        var other_inventory_num_inventory_cols = array_length(other_inventory[0]);
        var other_inventory_x_offset = inventory_x_max + padding;
        
        for(var r = 0; r < other_inventory_num_inventory_rows; r++) {
        	for(var c = 0; c < other_inventory_num_inventory_cols; c++){
                var mouse_in_box = false;
                if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
                    sprite_size + other_inventory_x_offset, sprite_size, sprite_size+inventory_x_max+other_inventory_x_offset, sprite_size+inventory_y_max)){
                    
                    var box_x = sprite_size + (outline_size+padding)*(c+1) + (sprite_size * c) + other_inventory_x_offset;
                    var box_y = sprite_size + (outline_size+padding)*(r+1) + (sprite_size * r);
                    mouse_in_box = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),
                        box_x, box_y, box_x+sprite_size+(outline_size+padding), box_y+sprite_size+(outline_size+padding));
                }
                
                if(mouse_in_box){
                    sslot_r = r;
                    sslot_c = c;
                    draw_sprite_stretched(
                        ui_slot_selected, 0,
                        sprite_size + (outline_size+padding)*(c+1) + (sprite_size * c) + other_inventory_x_offset,
                        sprite_size + (outline_size+padding)*(r+1) + (sprite_size * r),
                        sprite_size + outline_size,
                        sprite_size + outline_size
                    );
               }else{
                    draw_sprite_stretched(
                        ui_slot, 0,
                        sprite_size + (outline_size+padding)*(c+1) + (sprite_size * c) + other_inventory_x_offset,
                        sprite_size + (outline_size+padding)*(r+1) + (sprite_size * r),
                        sprite_size + outline_size,
                        sprite_size + outline_size
                    );
                }
            }
        }
    }
    
    #endregion
    if(mouse_check_button_pressed(mb_left) && sslot_c != -1 && sslot_r != -1){
        add_item_to_inventory(inventory, sslot_r, sslot_c, "Iron ore");
    }
}