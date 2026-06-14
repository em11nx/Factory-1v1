function get_conv_direc(placement_dir, x_round, y_round){
    //physical direction
    var down_conv = instance_place(x_round, y_round+32, obj_conveyor_parent);
    var up_conv = instance_place(x_round, y_round-32, obj_conveyor_parent);
    var left_conv = instance_place(x_round+32, y_round, obj_conveyor_parent);
    var right_conv = instance_place(x_round-32, y_round, obj_conveyor_parent);
    
    //does physical direction exist
    var down_conv_exists = down_conv != noone;
    var up_conv_exists = up_conv != noone;
    var left_conv_exists = left_conv != noone;
    var right_conv_exists = right_conv != noone;
    
    //
    var down_conv_faced_in = false;
    var up_conv_faced_in = false;
    var left_conv_faced_in = false;
    var right_conv_faced_in = false;
    
    //if(physical) then faced towards me?
    if(down_conv_exists){
        down_conv_faced_in = string_ends_with(down_conv.dir_faced, "up");
    }
    if(up_conv_exists){
        up_conv_faced_in = string_ends_with(up_conv.dir_faced, "down");
    }
    if(left_conv_exists){
        left_conv_faced_in = string_ends_with(left_conv.dir_faced, "left");
    }
    if(right_conv_exists){
        right_conv_faced_in = string_ends_with(right_conv.dir_faced, "right");
    }
    
    switch (placement_dir) {
    	
        //case facing_dir
        case "down":
            
            if(up_conv_faced_in) or (left_conv_faced_in && right_conv_faced_in){
                break;
            }else if(left_conv_faced_in){
                placement_dir = "left_down";
            }else if(right_conv_faced_in){
                placement_dir = "right_down";
            }
            
            break;
        
        case "up":
            
            if(down_conv_faced_in) or (left_conv_faced_in && right_conv_faced_in){
                break;
            }else if(left_conv_faced_in){
                placement_dir = "left_up";
            }else if(right_conv_faced_in){
                placement_dir = "right_up";
            }
            
            break;
        
        case "right":
            
            if(right_conv_faced_in) or (up_conv_faced_in && down_conv_faced_in){
                break;
            }else if(up_conv_faced_in){
                placement_dir = "down_right";
            }else if(down_conv_faced_in){
                placement_dir = "up_right";
            }
            
            break;
        
        case "left":
            
            if(left_conv_faced_in) or (up_conv_faced_in && down_conv_faced_in){
                break;
            }else if(up_conv_faced_in){
                placement_dir = "down_left";
            }else if(down_conv_faced_in){
                placement_dir = "up_left";
            }
            
            break;
      
        default:
            show_error($"Invaild direction sent to conv_placement \nCurrent value of placement_dir: {placement_dir}", true);
    }
    
    return placement_dir;
}