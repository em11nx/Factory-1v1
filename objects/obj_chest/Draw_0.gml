draw_sprite(chest, 0, x,y);
if(gui_open){
    draw_sprite_stretched(
        ui_box,
        0,
        x-4,
        y-4,
        12+(array_length(inventory))*64,
        12+(array_length(inventory[0]))*64
    );
    var player = instance_nearest(x, y, obj_player);
    gui_open = player.in_ui;
}