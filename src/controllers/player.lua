PlayerController = {}

function PlayerController:new(t)
  setmetatable(t, self)
  self.__index = self

  t.width = 64
  t.height = 64
  t.position = {
    x = PLAYER_SPAWN_POSITION.x,
    y = PLAYER_SPAWN_POSITION.y
  }

  t.collider = world:newRectangleCollider(t.position.x, t.position.y, t.width, t.height)
  t.collider:setCollisionClass('Player')
  t.collider:setLinearDamping(5)
  t.collider:setFixedRotation(true)

  return t
end

function PlayerController:draw()
  love.graphics.setColor(1, 1, 0)
  love.graphics.rectangle('fill', self.position.x - self.width / 2, self.position.y - self.height / 2, self.width, self.height)

  love.graphics.setColor(1, 1, 1)
end

function PlayerController:move(dir)
  local px, py = self.collider:getLinearVelocity()

  if px < 1000 or py < 1000 then
    self.collider:applyForce(8000 * dir.x, 8000 * dir.y)
  end
end