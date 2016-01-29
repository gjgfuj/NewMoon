local tile = newmoon.helper.optionaltable("tile")
---Create a new tile.
---Object id expected at object.id
---Init functions: voxel() (in a 3d voxel game), top() (in a top-down game), side() (in a side on platformer type game.)
---Callback functions: None! This is a decorative object.
function tile.create(b) b.init={} newmoon.mod.currentmod.tiles[b.id] = b return b end
newmoon.tile = tile
return tile