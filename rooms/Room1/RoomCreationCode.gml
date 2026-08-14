seed = randomise();
var perption_of_room_that_ore_exists = 1000;
var rooms_highest_val = (room_width < room_height) ? room_height : room_width;
var amount_avabile_vein_slots = 3*rooms_highest_val/perption_of_room_that_ore_exists;
var node_size = 15;
var curr_nodes = [];
var curr_veins = [];

global.layer_iron_vein = layer_create(400);
global.iron_vein_tilemap = layer_tilemap_create(global.layer_iron_vein, 0, 0, ts_iron_vien, room_width, room_height);

for(var i = 0; i < amount_avabile_vein_slots; i++) {
    var cx = irandom(room_width);
    var cy = irandom(room_height);
    
    cx = (cx - cx % 64) + 32;
    cy = (cy - cy % 64) + 32;
    
    while(array_contains(curr_veins, string(cx)+","+string(cy))
        && array_length(curr_veins) > 1
        && abs(int64(string_split(curr_veins[i-1], ",")[0]) - cx) <= int64((node_size/pi)*2)
        && abs(int64(string_split(curr_veins[i-1], ",")[1]) - cy) <= int64((node_size/pi)*2)){
        
        cx = irandom(room_width);
        cy = irandom(room_height);
        
        cx = (cx - cx % 64) + 32;
        cy = (cy - cy % 64) + 32;
    }
    
    var rand_tile = irandom_range(1, 5);
    tilemap_set_at_pixel(global.iron_vein_tilemap, rand_tile, cx, cy);
    
    array_push(curr_nodes, string(cx)+","+string(cy));
    array_push(curr_veins, string(cx)+","+string(cy));
    
    for(var j = 0; j < node_size; j++){
        var cxp = cx;
        var cyp = cy;
        var past_direcs = [];
        
        while(array_contains(curr_nodes, string(cxp)+","+string(cyp))){
            
            if(array_length(past_direcs)>=3
                && past_direcs[array_length(past_direcs)-1] == past_direcs[array_length(past_direcs)-2]
                && past_direcs[array_length(past_direcs)-1] == past_direcs[array_length(past_direcs)-3]){
                
                for(var k = 0; k < 2; k++){
                    var popped = array_pop(past_direcs);
                    if(popped == "up"){ cyp += 64; }
                    else if(popped == "down"){ cyp -= 64; }
                    else if(popped == "right"){ cxp -= 64; }
                    else if(popped == "left"){ cxp += 64; }
                }
            }
            
            var rand_direc = get_random_direc();
            if(rand_direc == "up"){ cyp -= 64; }
            else if(rand_direc == "down"){ cyp += 64; }
            else if(rand_direc == "right"){ cxp += 64; }
            else if(rand_direc == "left"){ cxp -= 64; }
            
        }
        rand_tile = irandom_range(1, 5);
        tilemap_set_at_pixel(global.iron_vein_tilemap, rand_tile, cxp, cyp);
        array_push(curr_nodes, string(cxp)+","+string(cyp));
    }
}