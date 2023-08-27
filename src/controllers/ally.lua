AllyController = {}

function AllyController:new(t)
  setmetatable(t, self)
  self.__index = self

  t.width = 128
  t.height = 128

  if ALLIES_STATE[t.idx] == nil then
    ALLIES_STATE[t.idx] = 1
  end

  if world then
    t.collider = world:newCircleCollider(t.position.x + t.width / 4, t.position.y + t.height / 2, t.width / 4)
    t.collider:setCollisionClass('Ally')
    t.collider:setType('static')
  end

  t.spriteSheet = love.graphics.newImage("assets/images/game/character-ally.png")

  t.grid = Anim8.newGrid(
    t.width,
    t.height,
    t.spriteSheet:getWidth(),
    t.spriteSheet:getHeight()
  )

  t.animations = {
    idle = {
      damaged = Anim8.newAnimation(t.grid('1-1', 1), 0.125),
      fixed = Anim8.newAnimation(t.grid('2-2', 1), 0.125)
    }
  }

  t.animation = t.animations.idle.damaged

  t.stateChangeSound = love.audio.newSource('assets/sounds/moving.mp3', 'static')

  return t
end

function AllyController:draw()
  self.animation:draw(
    self.spriteSheet,
    self.position.x,
    self.position.y,
    nil, -- angle
    nil, -- scale x
    nil, -- scale y
    self.width / 4, -- offset x
    self.height / 4 -- offset y
  )
end

function AllyController:update()
  if ALLIES_STATE[self.idx] == 2 then
    self.animation = self.animations.idle.fixed
  end

  if self.collider:enter('Player') then
    if ALLIES_STATE[self.idx] == 2 then
      do return end
    end

    self.stateChangeSound:play()
    ALLIES_STATE[self.idx] = 2

    for _, slot in ipairs(self.slots) do
      table.insert(SLOTS, { value = slot, inUsed = false })
    end

    local message = 'Voce me consertou! Receba essas LETRAS DO TECLADO em agradecimento.'
    dialog:show(message, 5, { x = self.position.x, y = self.position.y - 100 })
  end
end