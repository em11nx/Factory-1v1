var player = instance_nearest(x,y,obj_player);
if(!player.other_inventory_open){
    player.other_inventory_open = true;
    player.other_inventory_id = self;
    player.curr_mode = "inventory";
}