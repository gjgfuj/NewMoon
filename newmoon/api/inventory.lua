local inventory = {}
inventory.blank = {}
inventory.blank.inv = {}
inventory.blank.size = 4
function inventory.blank:insertItem(item, slot)
    if not slot then slot = #self.inv+1 end
    if slot > self.size then return false end
    self.inv[slot] = item
    return true
end
inventory.blank.setItem = inventory.blank.insertItem
function inventory.blank:getItem(slot)
    if not slot then slot = #self.inv end
    local val = self.inv[slot]
    return val
end
function inventory.blank:extractItem(slot)
    if not slot then slot = #self.inv end
    local val = self.inv[slot]
    self.inv[slot] = nil
    return val
end
function inventory.install(component, size)
    local inv = newmoon.helper.copytable(inventory.blank)
    inv.size = size or 4
    component.__inventory = inv
end
function inventory.get(component)
    return component.__inventory
end
newmoon.api.inventory = inventory
return inventory