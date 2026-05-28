// Param: number(str), direction(str)   return: conv_spr(spr obj)
function get_conv_spr(num , direc){
    
    var spr_return = asset_get_index("conv_mk" + num);
    
    switch (direc) {
    	
        case "down":
            image_angle = 0;
            break;
        
        case "up":
            image_angle = 180;
            break;
        
        case "left":
            image_angle = 270;
            break;
        
        case "right":
            image_angle = 90;
            break;
        
        case "down_left":
            spr_return = asset_get_index("conv_mk" + num + "_turn_1");
            break;
        
        case "down_right":
            spr_return = asset_get_index("conv_mk" + num + "_turn_2");
            break;
        
        case "left_down":
            spr_return = asset_get_index("conv_mk" + num + "_turn_2");
            image_angle = 270;
            break;
        
        case "left_up":
            spr_return = asset_get_index("conv_mk" + num + "_turn_1");
            image_angle = 270;
            break;
        
        case "right_down":
            spr_return = asset_get_index("conv_mk" + num + "_turn_1");
            image_angle = 90;
            break;
        
        case "right_up":
            spr_return = asset_get_index("conv_mk" + num + "_turn_2");
            image_angle = 90;
            break;
        
        case "up_right":
            spr_return = asset_get_index("conv_mk" + num + "_turn_1");
            image_angle = 180;
            break;
        
        case "up_left":
            spr_return = asset_get_index("conv_mk" + num + "_turn_2");
            image_angle = 180;
            break;
        
        default:
            show_error($"Invalid direction or mk number sent to get_conv_spr \n direc val: {direc} \n num val: {num}", true);
    }
    
    if(spr_return != -1)
        return spr_return
    else
        show_error($"Invalid direction or mk number sent to get_conv_spr \n direc val: {direc} \n num val: {num}", true);
}