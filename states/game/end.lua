require 'src/controllers/player'
require 'src/controllers/checkpoint'
require 'src/controllers/ally'

function states.gameEnd:enter()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

  map = STI('assets/maps/predio.lua')

  PLAYER_SPAWN_POSITION.x = width / 2
  PLAYER_SPAWN_POSITION.y = height / 2 - 150
  playerController = PlayerController:new{}

  local x = PLAYER_SPAWN_POSITION.x
  local y = PLAYER_SPAWN_POSITION.y
  local dist = 10

  allyControllers = {
    AllyController:new{ idx = 1, position = { x = x - 200 - 32, y = y + 50 }, slots = {} },
    AllyController:new{ idx = 2, position = { x = x - 150 - 32, y = y + 200 }, slots = {} },
    AllyController:new{ idx = 3, position = { x = x - 32, y = y + 300 }, slots = {} },
    AllyController:new{ idx = 4, position = { x = x + 150 - 32, y = y + 200 }, slots = {} },
    AllyController:new{ idx = 5, position = { x = x + 200 - 32, y = y + 50 }, slots = {} },
  }

  for _, controller in ipairs(allyControllers) do
    controller.animation = controller.animations.idle.fixed
  end

  function jump()
    Flux.to(playerController.position, .25, { x = x, y = y + dist }):oncomplete(
      function()
        dist = dist * -1
        jump()
      end
    )
  end

  jump()
end

function states.gameEnd:draw()
  map:drawLayer(map.layers['layer1'])
  playerController:draw()

  for _, controller in ipairs(allyControllers) do
    controller:draw()
  end
end

function states.gameEnd:update(dt)
  Flux.update(dt)
end
