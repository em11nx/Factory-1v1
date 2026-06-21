/// @desc Places down a single conveyor belt
/// @param {String} placement_dir The direction that the belt will face
/// @param {Real} x_round Rounded x
/// @param {Real} y_round Rounded y
/// @return {String} The corrected placement direction
function single_conv_placement(placement_dir, x_round, y_round){
    
    placement_dir = get_conv_direc(placement_dir, x_round, y_round);
    
    if(instance_position(x_round, y_round, obj_placed_obj) == noone){
        var placed_conv = instance_create_layer(x_round,y_round,"Instances",obj_mkOne_conveyor);
        placed_conv.dir_faced = placement_dir;
        placed_conv.update_spr();
        return placed_conv;
    }
}