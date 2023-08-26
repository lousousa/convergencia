AllyController = {}

function AllyController:new(t)
  setmetatable(t, self)
  self.__index = self

  t.width = 64
  t.height = 64
  t.position = {
    x = 1000,
    y = 600
  }

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
    table.insert(SLOTS, { value = 'E', isUsed = false })
    table.insert(SLOTS, { value = 'I', isUsed = false })
    table.insert(SLOTS, { value = 'V', isUsed = false })
  end
end