if(instance_place(x, y, obj_iron_ore) != noone && is_placed){
    switch (dir_faced) {
    	
        case "up":
            instance_place(x, y, obj_iron_ore).y -= belt_speed;
            break;
        
        case "down":
            instance_place(x, y, obj_iron_ore).y += belt_speed;
            break;
        
        case "left":
            instance_place(x, y, obj_iron_ore).x -= belt_speed;
            break;
        
        case "right":
            instance_place(x, y, obj_iron_ore).x += belt_speed;
            break;
        
        default:
            show_error("Not implemted yet", true);
            break;
    }
}