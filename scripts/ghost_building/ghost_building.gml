function ghost_building(x,y){
    with(instance_nearest(x,y, obj_player)){
        if(string_ends_with(obj_getting_placed ,"conv")){
            var direc = get_conv_direc(placement_dir, current_x_placement_round64, current_y_placement_round64);
            id_obj_temp = instance_create_layer(current_x_placement_round64, current_y_placement_round64, "Instances", conv_mk1);
            
            var res = get_conv_spr("1", direc);
            id_obj_temp.sprite_index = res[0];
            id_obj_temp.image_angle = res[1];
        }
        if(obj_getting_placed == "chest"){
            id_obj_temp = instance_create_layer(current_x_placement_round64, current_y_placement_round64, "Instances", chest);
        }
    }
}