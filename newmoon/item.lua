local item = newmoon.helper.optionaltable("newmoon.item")
table.insert(newmoon.mod.createcallbacks, function(mod) mod.items = {} end)
---Create a new item.
---Init functions: voxel() (in a 3d voxel game), top() (in a top-down game), side() (in a side on platformer type game.)
---Callback functions: onUse() when the player activates the item.
function item.create(id)
    local b = {}
    b.id = id
    b.init={}
    b.callback={}
    return b
end
newmoon.item = item
return item