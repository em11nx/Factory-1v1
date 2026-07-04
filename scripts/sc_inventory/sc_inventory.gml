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
/// @param {Real} row Int of row
/// @param {Real} col Int of col
/// @param {String} item_name Name of item being added
/// @return {Bool} Returns true if full, false if not
function is_item_slot_full(inventory, row, col, item_name){
    if(item_name == "Iron ore"){
        return inventory[row][col][1] >= 50;
    }
}

/// @desc Checks if you can add an item to an inventory slot and adds it
/// @param {Array<Array<Array<Any*>>>} inventory Inventory being added to
/// @param {Real} row Int of row
/// @param {Real} col Int of col
/// @param {String} item_name Name of item being added
/// @param {Real} num_of_times Number of times the item is being added
/// @return {Bool} True if it added the item, false if it did not add the item
function add_item_to_inventory_slot(inventory, row, col, item_name, num_of_times){
    if(inventory[row][col][0] == 0){
        inventory[row][col][0] = item_name;
        inventory[row][col][1] += num_of_times;
    }
    else{
        if(inventory[row][col][0] != item_name || is_item_slot_full(inventory, row, col, item_name)){
            return false;
        }
        inventory[row][col][1] += num_of_times;
    }
    return true;
}

/// @desc Places an item into a inventory at the first avalible slot
/// @param {Array<Array<Array<Any*>>>} inventory Inventory being added to
/// @param {String} item_name Name of item being added
/// @param {Real} num_of_times Number of times the item is being added
function input_item_to_inventory(inventory, item_name, num_of_times){
    var placed = false;
    for(var r = 0; r < array_length(inventory); r++) {
    	for(var c = 0; c < array_length(inventory[r]); c++){
            if(inventory[r][c][0] == item_name){
                add_item_to_inventory_slot(inventory, r, c, item_name, num_of_times);
                placed = true;
            }
        }
    }
    var inputed = false;
    var r = 0;
    var c = 0;
    while(!inputed && !placed){
        inputed = add_item_to_inventory_slot(inventory, r, c, item_name, num_of_times);
        if(c == array_length(inventory[r])){ c = 0; r++; }
        else{ c++; }
    }
}

/// @desc Checks if you can remove an item to an inventory slot and removes it
/// @param {Array<Array<Array<Any*>>>} inventory Inventory being removed from
/// @param {Real} row Int of row
/// @param {Real} col Int of col
/// @return {Bool} True if it removed the item, false if it did not remove the item
function remove_item_from_inventory(inventory, row, col){
    if(inventory[row][col][0] != 0){ return false; }
    
    if(inventory[row][col][1] > 1){
        inventory[row][col][1]--;
        return true;
    }else if (inventory[row][col][1] == 1){
        inventory[row][col][0] = 0;
        inventory[row][col][1] = 0;
        return true;
    }else{
        return false;
    }
}

/// @desc Removes the entire stack of items from an inventory slot
/// @param {Array<Array<Array<Any*>>>} inventory Inventory being added to
/// @param {Real} row Int of row
/// @param {Real} col Int of col
/// @return {Array<String,Real>} Contents of the slot
function get_all_items_from_inventory_slot(inventory, row, col){
    var item_name = inventory[row][col][0];
    var item_count = inventory[row][col][1];
    var item = [item_name, item_count];
    if(item_name != 0){
        inventory[row][col][0] = 0;
        inventory[row][col][1] = 0;
        return item;
    }
    return [0,0];
}