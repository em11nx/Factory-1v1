/// @desc Places the desired object during player build mode
/// @param {Real} pla_x Player x
/// @param {Real} pla_y Player y
/// @param {Real} player_id Player ID
function obj_placement_mangager(pla_x, pla_y, player_id){
    with(player_id){
        if(check_overlap(current_x_placement_round64, current_y_placement_round64,
            sprite_get_width(placeable_sprite_list[placeable_list_num]), obj_placed_obj) == noone){
            
            if(string_ends_with(obj_getting_placed ,"conv")){
                if (placement_dir == "up" || placement_dir == "down"){
                    curr_obj_being_placed = single_conv_placement(placement_dir, origin_x_placement_round64, current_y_placement_round64);
                    if(curr_obj_being_placed != undefined) { curr_obj_being_placed.is_placed = true; }
                } else if (placement_dir == "left" || placement_dir == "right"){
                    curr_obj_being_placed = single_conv_placement(placement_dir, current_x_placement_round64, origin_y_placement_round64);
                    if(curr_obj_being_placed != undefined) { curr_obj_being_placed.is_placed = true; }
                }
            }
            if(obj_getting_placed == "chest"){
                instance_create_layer(current_x_placement_round64, current_y_placement_round64, "layer_buildings_without_arrows", obj_chest);
            }
            if(obj_getting_placed == "miner"){
                instance_create_layer(current_x_placement_round64, current_y_placement_round64,
                    "layer_buildings_with_arrows", obj_miner, {image_angle : string_dir_to_num(placement_dir)} );
            }
        }
    }
}

/// @desc Places a shell object in the players build mode
/// @param {Real} x Player x
/// @param {Real} y Player y
/// @param {Real} player_id Player ID
function ghost_building(x,y, player_id){
    with(player_id){
        
        if(string_ends_with(obj_getting_placed ,"conv")){
            var direc = get_conv_direc(placement_dir, current_x_placement_round64, current_y_placement_round64);
            id_obj_temp = instance_create_layer(current_x_placement_round64, current_y_placement_round64, "layer_conveyor", shell_obj);
            
            var res = get_conv_spr("1", direc);
            id_obj_temp.sprite_index = res[0];
            id_obj_temp.image_angle = res[1];
            id_obj_temp.image_alpha = 0.5;
        }
        if(obj_getting_placed == "chest"){
            id_obj_temp = instance_create_layer(current_x_placement_round64, current_y_placement_round64, "layer_buildings_without_arrows", shell_obj);
            id_obj_temp.sprite_index = chest;
            id_obj_temp.image_alpha = 0.5;
        }
        if(obj_getting_placed == "miner"){
            id_obj_temp = instance_create_layer(current_x_placement_round64, current_y_placement_round64, "layer_buildings_with_arrows", shell_obj);
            id_obj_temp.sprite_index = miner;
            id_obj_temp.image_alpha = 0.5;
            id_obj_temp.image_angle = string_dir_to_num(placement_dir);
        }
    }
}

function draw_arrows(){
    var objs = layer_get_all_elements("layer_buildings_with_arrows");
    if(array_length(objs) <= 0){ return; }
    for(var i = 0; i < array_length(objs); i++){
        var obj = layer_instance_get_instance(objs[i]);
        var px = obj.x;
        var py = obj.y;
        var angle = 0;
        
        if(obj.image_angle = 0){ py += obj.sprite_height/1.5; angle = 0; }
        if(obj.image_angle = 90){ px -= obj.sprite_width/1.5; angle = 270; }
        if(obj.image_angle = 180){ py -= obj.sprite_height/1.5; angle = 180; }
        if(obj.image_angle = 270){ px += obj.sprite_width/1.5; angle = 90; }
        
        draw_sprite_ext(item_arrow_idk, 0, px, py, 1, 1, angle, c_white, 1);
    }
}

function check_overlap(px, py, sprite_size, obj){
    return collision_rectangle(px-sprite_size/2, py-sprite_size/2, px+sprite_size/2, py+sprite_size/2, obj, false, false);
}

function should_ghost_move(px, py, cx, cy, sprite_size){
    return abs(cx-px) > sprite_size/4 || abs(cy-py) > sprite_size/4
}