AllyController = {}

function AllyController:new(t)
  setmetatable(t, self)
  self.__index = self

  t.width = 64
  t.height = 64
  t.state = 1

  t.collider = world:newRectangleCollider(t.position.x, t.position.y, t.width, t.height)
  t.collider:setCollisionClass('Ally')
  t.collider:setType('static')

  return t
end

function AllyController:draw()
  love.graphics.setColor(0, 0, 1)
  love.graphics.rectangle('fill', self.position.x, self.position.y, self.width, self.height)

  love.graphics.setColor(1, 1, 1)
end

function AllyController:update()
  if self.collider:enter('Player') then
    if self.hasSlots == 2 then
      do return end
    end

    self.hasSlots = 2

    for _, slot in ipairs(self.slots) do
      table.insert(SLOTS, { value = slot, inUsed = false })
    end
  end
end