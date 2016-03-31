local tile = newmoon.helper.optionaltable("newmoon.tile")
table.insert(newmoon.mod.createcallbacks, function(mod) mod.tiles = {} end)
---Create a new tile.
---Tile id expected at tile.id
---Init functions: voxel() (in a 3d voxel game), top() (in a top-down game), side() (in a side on platformer type game.)
---In voxel, this is a stateless block.
---In top, this is a tile, and the only stats it has is whether it is walkable or not.
---In side, this is a world block.
---Callback functions: None! This is a decorative object, and all of it's functions are part of it's material.
function tile.create(id)
    local b = {material=newmoon.material.iron}
    b.id = id
    b.init=newmoon.helper.optionaltable(id.."init")
    newmoon.mod.currentmod.tiles[b.id] = b
    return b
end
newmoon.tile = tile
return tile