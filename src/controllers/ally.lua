AllyController = {}

function AllyController:new(t)
  setmetatable(t, self)
  self.__index = self

  t.width = 64
  t.height = 64

  if ALLIES_STATE[t.idx] == nil then
    ALLIES_STATE[t.idx] = 1
  end

  t.collider = world:newRectangleCollider(t.position.x, t.position.y, t.width, t.height)
  t.collider:setCollisionClass('Ally')
  t.collider:setType('static')

  return t
end

function AllyController:draw()
  if ALLIES_STATE[self.idx] == 1 then
    love.graphics.setColor(0, 0, 1)
  elseif ALLIES_STATE[self.idx] == 2 then
    love.graphics.setColor(0, 1, 1)
  end

  love.graphics.rectangle('fill', self.position.x, self.position.y, self.width, self.height)

  love.graphics.setColor(1, 1, 1)
end

function AllyController:update()
  if self.collider:enter('Player') then
    if ALLIES_STATE[self.idx] == 2 then
      do return end
    end

    ALLIES_STATE[self.idx] = 2

    for _, slot in ipairs(self.slots) do
      table.insert(SLOTS, { value = slot, inUsed = false })
    end
  end
end