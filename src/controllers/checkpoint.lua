CheckpointController = {}

function CheckpointController:new(t)
  setmetatable(t, self)
  self.__index = self

  t.width = 128
  t.height = 128

  t.image = love.graphics.newImage('assets/images/game/checkpoint.png')

  t.collider = world:newRectangleCollider(t.position.x, t.position.y, t.width, t.height)
  t.collider:setCollisionClass('Checkpoint')
  t.collider:setType('static')

  return t
end

function CheckpointController:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(self.image, self.position.x, self.position.y)
end

function CheckpointController:update()
  if self.collider:enter('Player') then
    for _, item in ipairs(SLOTS) do
      item.isUsed = false
    end

    PLAYER_SPAWN_POSITION.x = CHECKPOINT_POSITION.x + 64
    PLAYER_SPAWN_POSITION.y = CHECKPOINT_POSITION.y + 192

    Gamestate.switch(states.gamePuzzle)
  end
end