/// @desc Creates an inventory array
/// @param {Real} rows Desired amount of rows
/// @param {Real} cols Desired amount of cols
/// @return {Array<Array<Array<Any*>>>} The created inventory
function create_inventory(rows, cols){
    var inventory = array_create(rows);
    for (i =0; i < rows; i++){
        inventory[i] = array_create(cols);
        inventory[i][0] = array_create(2);
        inventory[i][1] = array_create(2);
    }
    return inventory;
}