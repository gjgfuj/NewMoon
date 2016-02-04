local tile = newmoon.helper.optionaltable("newmoon.tile")
table.insert(newmoon.mod.createcallbacks, function(mod) mod.tiles = {} end)
---Create a new tile.
---Object id expected at object.id
---Init functions: voxel() (in a 3d voxel game), top() (in a top-down game), side() (in a side on platformer type game.)
---Callback functions: None! This is a decorative object.
function tile.create(id)
    local b = {}
    b.id = id
    b.init=newmoon.helper.optionaltable(id.."init")
    newmoon.mod.currentmod.tiles[b.id] = b
    return b
end
newmoon.tile = tile
return tile