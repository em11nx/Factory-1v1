/// @desc Finds the sprite and the rotation of the sprite for a conveyor
/// @param {Real} mk Mark of the conveyor belt
/// @param {Real} direc The direction that the conveyor belt is facing
/// @return {Array<Asset,Real>} Returns an array of the sprite asset and sprite rotation
function get_conv_spr(mk , direc){
    
    var spr_return = asset_get_index("conv_mk" + string(mk));
    var return_angle = 0;
    
    switch (direc) {
    	
        case "down":
            return_angle = 0;
            break;
        
        case "up":
            return_angle = 180;
            break;
        
        case "left":
            return_angle = 270;
            break;
        
        case "right":
            return_angle = 90;
            break;
        
        case "down_left":
            spr_return = asset_get_index("conv_mk" + mk + "_turn_1");
            break;
        
        case "down_right":
            spr_return = asset_get_index("conv_mk" + mk + "_turn_2");
            break;
        
        case "left_down":
            spr_return = asset_get_index("conv_mk" + mk + "_turn_2");
            return_angle = 270;
            break;
        
        case "left_up":
            spr_return = asset_get_index("conv_mk" + mk + "_turn_1");
            return_angle = 270;
            break;
        
        case "right_down":
            spr_return = asset_get_index("conv_mk" + mk + "_turn_1");
            return_angle = 90;
            break;
        
        case "right_up":
            spr_return = asset_get_index("conv_mk" + mk + "_turn_2");
            return_angle = 90;
            break;
        
        case "up_right":
            spr_return = asset_get_index("conv_mk" + mk + "_turn_1");
            return_angle = 180;
            break;
        
        case "up_left":
            spr_return = asset_get_index("conv_mk" + mk + "_turn_2");
            return_angle = 180;
            break;
        
        default:
            show_error($"Invalid direction or mk number sent to get_conv_spr \n direc val: {direc} \n num val: {mk}", true);
    }
    
    if(spr_return != -1)
        return [spr_return, return_angle];
    else
        show_error($"Invalid direction or mk number sent to get_conv_spr \n direc val: {direc} \n num val: {mk}", true);
}