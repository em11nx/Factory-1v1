var sprite_size = 64;
var outline_size = 4;
var padding = 4;

if(curr_mode == "building"){
    
    var num_of_building_preview = array_length(placeable_obj_list);
    var sprite_with_padding_and_outline = (sprite_size + padding*2 + outline_size*2);
    var x_max = sprite_with_padding_and_outline*num_of_building_preview + padding*3 + outline_size*num_of_building_preview;
    var y_max = sprite_size + outline_size*4 + padding*4;
    draw_sprite_stretched(
        ui_box, 0,
        0, 0,
        x_max, y_max
    );
    
    for(var i = 0; i < num_of_building_preview; i++){
        if(i == placeable_list_num){
            draw_sprite_stretched(
                ui_slot_selected, 0,
                sprite_with_padding_and_outline*i + padding*i + outline_size*2,
                outline_size + padding,
                sprite_with_padding_and_outline, sprite_with_padding_and_outline
            );
        }else{
            draw_sprite_stretched(
                ui_slot, 0,
                sprite_with_padding_and_outline*i + padding*i + outline_size*2,
                outline_size + padding,
                sprite_with_padding_and_outline, sprite_with_padding_and_outline
            );
        }
        var array_place = i;
        while(array_place >= array_length(placeable_sprite_list)){
            array_place -= array_length(placeable_sprite_list);
        }
        draw_sprite_stretched(
            placeable_sprite_list[array_place], 0,
            (sprite_size + padding*3 + outline_size*2)*i + padding*4,
            outline_size + padding + outline_size*2,
            sprite_size, sprite_size
        );
    }
}

if(inventory_open || other_inventory_open){
    #region drawing inventory
    var num_inventory_rows = array_length(inventory);
    var num_inventory_cols = array_length(inventory[0]);
    var inventory_x_max = ((sprite_size + outline_size) * num_inventory_cols) + padding*(num_inventory_cols+3);
    var inventory_y_max = ((sprite_size + outline_size) * num_inventory_rows) + padding*(num_inventory_rows+3);
    
    //inventory bg
    draw_sprite_stretched(ui_box, 0, sprite_size, sprite_size, inventory_x_max, inventory_y_max);
    draw_sprite_stretched(ui_box, 0, sprite_size+inventory_x_max+padding, sprite_size, inventory_x_max, inventory_y_max)
    
    var sslot_r = -1;
    var sslot_c = -1;
    var mouse_in_box = false;
    
    //draws the inventory slots
    for(var r = 0; r < num_inventory_rows; r++) {
    	for(var c = 0; c < num_inventory_cols; c++){
            
            if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), sprite_size, sprite_size, sprite_size+inventory_x_max, sprite_size+inventory_y_max)){
                var box_x = sprite_size + (outline_size+padding)*(c+1) + (sprite_size * c);
                var box_y = sprite_size + (outline_size+padding)*(r+1) + (sprite_size * r);
                mouse_in_box = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), box_x, box_y, box_x+sprite_size+(outline_size+padding), box_y+sprite_size+(outline_size+padding));
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
    
    var other_sslot_r = -1;
    var other_sslot_c = -1;
    var other_inventory = 0;
    
    if(other_inventory_id != noone){
        other_inventory = other_inventory_id.inventory;
        var other_inventory_num_inventory_rows = array_length(other_inventory);
        var other_inventory_num_inventory_cols = array_length(other_inventory[0]);
        var other_inventory_x_offset = inventory_x_max + padding;
        var mouse_in_other_box = false;
        
        for(var r = 0; r < other_inventory_num_inventory_rows; r++) {
        	for(var c = 0; c < other_inventory_num_inventory_cols; c++){
                
                if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), sprite_size+other_inventory_x_offset, sprite_size, sprite_size+inventory_x_max+other_inventory_x_offset, sprite_size+inventory_y_max)){
                    var box_x = sprite_size + (outline_size+padding)*(c+1) + (sprite_size * c) + other_inventory_x_offset;
                    var box_y = sprite_size + (outline_size+padding)*(r+1) + (sprite_size * r);
                    mouse_in_other_box = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), box_x, box_y, box_x+sprite_size+(outline_size+padding), box_y+sprite_size+(outline_size+padding));
                }
                
                if(mouse_in_other_box){
                    other_sslot_r = r;
                    other_sslot_c = c;
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
                if(other_inventory[r][c][0] == "Iron ore"){
                    draw_sprite(
                        temp_iron, 0,
                        sprite_size + (outline_size+padding)*(c+1) + (sprite_size * c) + sprite_size/2 + other_inventory_x_offset,
                        sprite_size + (outline_size+padding)*(r+1) + (sprite_size * r) + sprite_size/2
                    );
                }
            }
        }
    }
    #endregion
    
    if(mouse_check_button_pressed(mb_left)){
        if(sslot_r != -1 && sslot_c != -1){
            if(!is_mouse_holding_item){
                mouse_holding_content = get_all_items_from_inventory_slot(inventory, sslot_r, sslot_c);
                if(mouse_holding_content[0] != 0){ is_mouse_holding_item = true; }
            }else{
                if(mouse_holding_content[0] != 0){
                    var added_item = add_item_to_inventory_slot(inventory, sslot_r, sslot_c, mouse_holding_content[0], mouse_holding_content[1]);
                    if(added_item){
                        is_mouse_holding_item = false;
                        mouse_holding_content = [0, 0];
                    }
                }
            }
        }
        if(other_inventory_id != noone && other_sslot_r != -1 && other_sslot_c != -1){
            if(!is_mouse_holding_item){
                mouse_holding_content = get_all_items_from_inventory_slot(other_inventory, other_sslot_r, other_sslot_c);
                if(mouse_holding_content[0] != 0){ is_mouse_holding_item = true; }
            }else{
                if(mouse_holding_content[0] != 0){
                    var added_item = add_item_to_inventory_slot(other_inventory, other_sslot_r, other_sslot_c, mouse_holding_content[0], mouse_holding_content[1]);
                    if(added_item){
                        is_mouse_holding_item = false;
                        mouse_holding_content = [0, 0];
                    }
                }
            }
        }
    }
    
    if(is_mouse_holding_item){
        if(mouse_holding_content[0] == "Iron ore"){
            draw_sprite(temp_iron, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
        }
    }
}