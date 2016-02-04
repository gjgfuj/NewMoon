local object = newmoon.helper.optionaltable("newmoon.object")
table.insert(newmoon.mod.createcallbacks, function(mod) mod.objects = {} end)
---Create a new object.
---Object id expected at object.id
---Init functions: voxel() (in a 3d voxel game), top() (in a top-down game), side() (in a side on platformer type game.)
---Callback functions: onUse() when the player activates the object.
function object.create(id)
    local b = {}
    b.id = id
    b.init=newmoon.helper.optionaltable(id..".init")
    b.callback=newmoon.helper.optionaltable(id..".callback")
    newmoon.mod.currentmod.objects[id] = b
    return b
end
newmoon.object = object
return object