if(inventory_open){
    #region draws inventory
    
    var sprite_size = 64;
    var num_inventory_rows = array_length(inventory);
    var num_inventory_cols = array_length(inventory[0]);
    var inventory_x_max = sprite_size + (sprite_size * num_inventory_cols) + num_inventory_cols*(num_inventory_cols-1);
    var inventory_y_max = sprite_size + (sprite_size * num_inventory_rows) + num_inventory_rows*(num_inventory_rows-1)
    draw_sprite_stretched(
        ui_box,
        0,
        sprite_size,
        sprite_size,
        inventory_x_max,
        inventory_y_max
    );
    for(var r = 0; r < num_inventory_rows; r++) {
    	for(var c = 0; c < num_inventory_cols; c++){
            draw_sprite_stretched(
                ui_slot,
                0,
                sprite_size + 12*(c+1) + (sprite_size * c),
                sprite_size + 12*(r+1) + (sprite_size * r),
                sprite_size + 8,
                sprite_size + 8 
            )
        }
    }
    #endregion
    
    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), sprite_size, sprite_size, inventory_x_max, inventory_y_max)){
        //mouse inside inventory
        show_debug_message("u in the tory");
    }else{
        show_debug_message("u not in the tory");
    }
}