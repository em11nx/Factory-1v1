randomise();
var perption_of_room_that_ore_exists = 1000;
var rooms_highest_val = (room_width < room_height) ? room_height : room_width;
var amount_avabile_vein_slots = rooms_highest_val/perption_of_room_that_ore_exists
var current_viens = [];

for (var i = 0; i < amount_avabile_vein_slots; i++) {
    var cx = irandom(room_width);
    var cy = irandom(room_height);
    
    cx = (cx - cx % 64) + 32;
    cy = (cy - cy % 64) + 32;
    
    instance_create_layer(cx, cy, "Instances", obj_iron_ore);
}