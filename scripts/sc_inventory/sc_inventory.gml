/// @desc Creates an inventory array
/// @param {Real} rows Desired amount of rows
/// @param {Real} cols Desired amount of cols
/// @return {Array<Array<Array<Any>>>} The created inventory
function create_inventory(rows, cols){
    var inventory = array_create(rows);
    for (var i =0; i < rows; i++){
        inventory[i] = array_create(cols);
        for(var j = 0; j < cols; j++){
            inventory[i][j] = array_create(2);
        }
    }
    return inventory;
}

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