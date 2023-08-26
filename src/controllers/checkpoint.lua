CheckpointController = {}

function CheckpointController:new(t)
  setmetatable(t, self)
  self.__index = self

  t.width = 64
  t.height = 64
  t.position = {
    x = 200,
    y = 200
  }

  t.collider = world:newRectangleCollider(t.position.x, t.position.y, t.width, t.height)
  t.collider:setCollisionClass('Checkpoint')
  t.collider:setType('static')

  return t
end

function CheckpointController:draw()
  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle('fill', self.position.x, self.position.y, self.width, self.height)

  love.graphics.setColor(1, 1, 1)
end

function CheckpointController:update()
  if self.collider:enter('Player') then
    Gamestate.switch(states.gamePuzzle)
  end
end