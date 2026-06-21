/// @desc Checks if you can add an item to an inventory slot
/// @param {Array<Array<Array<Any*>>>} inventory Inventory being added to
/// @param {real} row Int of row
/// @param {real} col Int of col
/// @param {String} item_name Name of item being added
/// @return {Bool} True if it added the item, false if it did not add the item
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
    return true;
}