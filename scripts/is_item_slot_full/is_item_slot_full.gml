/// @desc Checks if an inventory slot is full of an item
/// @param {Array<Array<Array<Any*>>>} inventory Inventory being added to
/// @param {real} row Int of row
/// @param {real} col Int of col
/// @param {String} item_name Name of item being added
/// @return {Bool} Returns true if full, false if not
function is_item_slot_full(inventory, row, col, item_name){
    if(item_name == "Iron ore"){
        return inventory[row][col][1] >= 50;
    }
}