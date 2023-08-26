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

  t.spriteSheet = love.graphics.newImage("assets/images/game/character-player.png")

  t.grid = Anim8.newGrid(
    t.width,
    t.height,
    t.spriteSheet:getWidth(),
    t.spriteSheet:getHeight()
  )

  t.animations = {
    walking = {
      up = Anim8.newAnimation(t.grid('1-1', 1), 0.125),
      right = Anim8.newAnimation(t.grid('3-3', 1), 0.125):flipH(),
      down = Anim8.newAnimation(t.grid('2-2', 1), 0.125),
      left = Anim8.newAnimation(t.grid('3-3', 1), 0.125)
    }
  }

  t.animation = t.animations.walking.up

  return t
end

function PlayerController:draw()
  self.animation:draw(
    self.spriteSheet,
    self.position.x,
    self.position.y,
    nil, -- angle
    nil, -- scale x
    nil, -- scale y
    self.width / 2, -- offset x
    self.height / 2 -- offset y
  )
end

function PlayerController:update(dt)
  self.animation:update(dt)
end

function PlayerController:move(dir)
  local px, py = self.collider:getLinearVelocity()

  if px < 1000 or py < 1000 then
    self.collider:applyForce(8000 * dir.x, 8000 * dir.y)
  end
end