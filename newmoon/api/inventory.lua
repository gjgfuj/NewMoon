local inventory = newmoon.helper.optionaltable("newmoon.api.inventory")
inventory.blank = {}
inventory.blank.inv = {}
---Modify this to change the maximum size of the inventory.
inventory.blank.size = 4
---Inserts an item into a certain slot of an inventory. Defaults to the last untaken slot.
---Returns the remainder stack that wasn't inserted, or nil if all was inserted.
function inventory.blank:insertItem(item, slot)
    if not slot then slot = #self.inv+1 end
    if slot > self.size then return false end
    if self.inv[slot] then
        local existingslot = self.inv[slot]
        if not existingslot.canStack then
            return item
        end
        local res = existingslot+item
        self.inv[slot] = res[1]
        return res[2]
    else
        self.inv[slot] = item
        return nil
    end
end
inventory.blank.setItem = inventory.blank.insertItem
---Gets an item from the inventory. Defaults to the last slot.
function inventory.blank:getItem(slot)
    if not slot then slot = #self.inv end
    local val = self.inv[slot]
    return val
end
---Gets an item from the inventory and removes that item from the inventory.
function inventory.blank:extractItem(slot,stack)
    if not slot then slot = #self.inv end
    local val = self.inv[slot]
    local res = val-stack
    self.inv[slot] = res[1]
    return res[2]
end
---Installs the inventory api inside the component.
function inventory.install(component, size)
    local inv = newmoon.helper.copytable(inventory.blank)
    inv.size = size or 4
    component.__inventory = inv
end
---Retrieves the inventory api from the component.
function inventory.get(component)
    return component.__inventory
end
newmoon.api.inventory = inventory
return inventory