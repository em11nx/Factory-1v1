function add_item_to_inventory(inventory, row, col, item_name){
    if(inventory[row][col][0] == 0){
        inventory[row][col][0] = item_name;
        inventory[row][col][1]++;
    }
    else{
        if(inventory[row][col][0] != item_name || is_item_slot_full(inventory, row, col, item_name)){
            return false;
        }
        inventory[row][col][1]++;
    }
}