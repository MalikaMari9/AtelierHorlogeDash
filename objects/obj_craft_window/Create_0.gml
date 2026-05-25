craft_time_seconds = 3;
show_debug_slots = true;

output_slots = [
    { x: x - 24, y: y + 2, width: 36, height: 44 },
    { x: x + 24, y: y + 2, width: 36, height: 44 }
];

slot_reserved = array_create(2, false);
slot_timer = array_create(2, 0);
slot_recipe = array_create(2, undefined);
slot_pocket_indices = array_create(2, undefined);
slot_visuals = array_create(2, noone);
