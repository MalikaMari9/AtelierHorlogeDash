// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_craft_recipes(){
    if (!variable_global_exists("craft_recipes")) {
        global.craft_recipes = {
            mask: {
                id: "mask",
                name: "Mask of Mercy",
                result_object: obj_finished_mask,
                result_icon_sprite: spr_icon_mask,
                ingredients: ["water", "wood", "fate"]
            },
            lamp: {
                id: "lamp",
                name: "Everknowing Lamp",
                result_object: obj_finished_lamp,
                result_icon_sprite: spr_icon_lamp,
                ingredients: ["sand", "wood", "time"]
            },
            monocle: {
                id: "monocle",
                name: "Monocle of Foresight",
                result_object: obj_finished_monocle,
                result_icon_sprite: spr_icon_monocle,
                ingredients: ["steel", "sand", "time"]
            },
            cloak: {
                id: "cloak",
                name: "Graceful Cloak",
                result_object: obj_finished_cloak,
                result_icon_sprite: spr_icon_cloak,
                ingredients: ["cotton", "water", "fate"]
            }
        };
    }

    return global.craft_recipes;
}

function scr_craft_recipe_get(_recipe_id) {
    var _recipes = scr_craft_recipes();
    return variable_struct_get(_recipes, _recipe_id);
}

function scr_craft_recipe_find(_ingredients) {
    var _recipes = scr_craft_recipes();
    var _names = variable_struct_get_names(_recipes);

    for (var _i = 0; _i < array_length(_names); _i++) {
        var _recipe = variable_struct_get(_recipes, _names[_i]);

        if (scr_craft_ingredients_match(_ingredients, _recipe.ingredients)) {
            return _recipe;
        }
    }

    return undefined;
}

function scr_craft_ingredients_match(_a, _b) {
    if (array_length(_a) != array_length(_b)) {
        return false;
    }

    var _used = array_create(array_length(_b), false);

    for (var _i = 0; _i < array_length(_a); _i++) {
        var _found = false;

        for (var _j = 0; _j < array_length(_b); _j++) {
            if (!_used[_j] && _a[_i] == _b[_j]) {
                _used[_j] = true;
                _found = true;
                break;
            }
        }

        if (!_found) {
            return false;
        }
    }

    return true;
}
