local block = {}
---Create a new block.
---Init functions: voxel() (in a 3d voxel game), top() (in a top-down game), side() (in a side on platformer type game.)
---Callback functions: onUse() when the player activates the block.
function block.create(b) b.init={} b.callback={} return b end
newmoon.block = block
return block