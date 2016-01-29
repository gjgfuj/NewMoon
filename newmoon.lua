_G.newmoon = {__apiname="newmoon"}
---Helper functions for general lua stuff.
newmoon.helper = {}
function newmoon.helper.copytable(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[newmoon.helper.copytable(orig_key)] = newmoon.helper.copytable(orig_value)
        end
        setmetatable(copy, newmoon.helper.copytable(getmetatable(orig)))
    else -- number, string, boolean, etc
    copy = orig
    end
    return copy
end
newmoon.helper.optionaltablemeta = {}
function newmoon.helper.optionaltablemeta.__index(t,k)
    print(t.."."..k.." not implemented")
    t[k] = newmoon.helper.optionaltable(t.."."..k)
    return t[k]
end
function newmoon.helper.optionaltablemeta.__call(t,k)
    print(t.."."..k.."() not implemented")
    return nil,"Not implemented"
end
function newmoon.helper.optionaltable(name)
    return setmetatable({__apiname=name}, newmoon.helper.optionaltablemeta)
end
setmetatable(newmoon,newmoon.helper.optionaltablemeta)
---Mod stuff.
newmoon.mod.mods = {}
---Create a new mod. Will register it to whatever registry is required.
function newmoon.mod.create(id)
    local mod = {id=id,objects=tnew(),item=tnew()}
    newmoon.mod.mods[id] = mod
    newmoon.mod.currentmod = mod
    return mod
end
return newmoon