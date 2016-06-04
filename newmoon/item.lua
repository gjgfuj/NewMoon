local item = newmoon.helper.optionaltable("newmoon.item")
table.insert(newmoon.mod.createcallbacks, function(mod) mod.items = {} end)
---Create a new item.
---Init functions: voxel() (in a 3d voxel game), top() (in a top-down game), side() (in a side on platformer type game.)
---Callback functions: onUse() when the player activates the item.
function item.create(id)
    local b = {}
    b.id = id
    b.init=newmoon.helper.optionaltable(id..".init")
    b.callback=newmoon.helper.optionaltable(id..".init")
    return b
end
function item.itemstack(i, size)
    local res = {}
    while size > i.maxsize do
        res[#res+1] = newmoon.item.itemstack(i, i.maxsize)
        size = size - i.maxsize
    end
    local stack = {item=i,size=size }
    setmetatable(stack,{__index=newmoon.item.itemstackfunc,__add=item.itemstackfunc.add,__sub=newmoon.item.itemstackfunc.sub})
    res.insert(stack)
    return res
end
newmoon.item = item
return item