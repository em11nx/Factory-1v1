var pv = get_arrow_vector(x, y, image_angle, sprite_width, sprite_height);
var output_blocked = check_overlap(pv[0], pv[1], 64, obj_ore_parent);

if(instance_place(x, y, global.iron_vein_tilemap) != noone && !output_blocked){
    instance_create_layer(pv[0], pv[1], "Instances", obj_iron_ore);
}