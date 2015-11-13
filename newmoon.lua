_G.newmoon = {}
function newmoon.copytable(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[newmoon.copytable(orig_key)] = newmoon.copytable(orig_value)
        end
        setmetatable(copy, newmoon.copytable(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end
newmoon.api = {}
newmoon.mod = {}
newmoon.mod.mods = {}
function newmoon.mod.create(id)
    table.insert(newmoon.mod.mods, id)
    newmoon.mod.currentmod = id
    return {id=id}
end
newmoon.block = require("newmoon/block")
newmoon.api.inventory = require("newmoon/api/inventory")
return newmoon