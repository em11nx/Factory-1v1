function is_item_slot_full(inventory, row, col, item_name){
    if(item_name == "Iron ore"){
        return inventory[row][col][1] >= 50;
    }
}