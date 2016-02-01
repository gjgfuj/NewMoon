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
end-- Compatibility: Lua-5.1
function newmoon.helper.split(str, pat)
    local t = {}  -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pat
    local last_end = 1
    local s, e, cap = str:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(t,cap)
        end
        last_end = e+1
        s, e, cap = str:find(fpat, last_end)
    end
    if last_end <= #str then
        cap = str:sub(last_end)
        table.insert(t, cap)
    end
    return t
end
local optionaltablemeta = {}
local function optionaltable(name,tbl)
    if not tbl then
        tbl = {}
    end
    tbl.__apiname = name
    return setmetatable(tbl, optionaltablemeta)
end
function optionaltablemeta.__index(t,k)
    print(t.__apiname.."."..k.." not implemented")
    return optionaltable(t.__apiname.."."..k)
end
function optionaltablemeta.__call(t)
    print(t.__apiname.."() not implemented")
    return nil,"Not implemented"
end
setmetatable(newmoon,optionaltablemeta)
newmoon.helper.optionaltable = optionaltable
---Mod stuff.
newmoon.mod = optionaltable()
newmoon.mod.mods = {}
newmoon.mod.createcallbacks = {}
---Create a new mod. Will register it to whatever registry is required.
function newmoon.mod.create(id)
    local mod = newmoon.helper.optionaltable(id,{id=id})
    newmoon.mod.mods[id] = mod
    newmoon.mod.currentmod = mod
    for _,v in pairs(newmoon.mod.createcallbacks) do
        v(mod)
    end
    return mod
end
newmoon.api = optionaltable("newmoon.api")
return newmoon