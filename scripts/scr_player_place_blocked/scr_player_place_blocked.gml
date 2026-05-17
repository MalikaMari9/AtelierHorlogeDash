function scr_player_place_blocked(_x, _y){
    return place_meeting(_x, _y, obj_wall)
        || place_meeting(_x, _y, obj_desk)
        || place_meeting(_x, _y, obj_raw_matt_drawer)
        || place_meeting(_x, _y, obj_trash)
        || place_meeting(_x, _y, obj_craft_room)
        || place_meeting(_x, _y, obj_craft_window);
}
