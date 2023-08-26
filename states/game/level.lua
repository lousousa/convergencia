WF = require 'vendor/windfield'
Camera = require 'vendor/camera'
Anim8 = require 'vendor/anim8'

require 'src/ui/slots-thumbnails'

require 'src/controllers/player'
require 'src/controllers/checkpoint'
require 'src/controllers/ally'

local function handleInput()
  if Input:down 'up' then
    playerController:move{ x = 0, y = -1 }
    playerController.animation = playerController.animations.walking.up
  end

  if Input:down 'right' then
    playerController:move{ x = 1, y = 0 }
    playerController.animation = playerController.animations.walking.right
  end

  if Input:down 'left' then
    playerController:move{ x = -1, y = 0 }
    playerController.animation = playerController.animations.walking.left
  end

  if Input:down 'down' then
    playerController:move{ x = 0, y = 1 }
    playerController.animation = playerController.animations.walking.down
  end
end

function states.gameLevel:enter()
  world = WF.newWorld()
  camera = Camera()

  world:addCollisionClass('Player')
  world:addCollisionClass('Checkpoint')
  world:addCollisionClass('Ally')

  slotsThumbnails = SlotsThumbnails:new{}

  playerController = PlayerController:new{}
  checkpointController = CheckpointController:new{}
  allyControllers = {
    AllyController:new{ idx = 1, position = { x = 500, y = 100 }, slots = { 'S', 'I' } },
    AllyController:new{ idx = 2, position = { x = -100, y = -100 }, slots = { 'O', 'N', 'V' } },
    AllyController:new{ idx = 3, position = { x = 500, y = 600 }, slots = { 'E', 'I', 'V' } },
    AllyController:new{ idx = 4, position = { x = -100, y = 600 }, slots = { 'E', 'N' } },
    AllyController:new{ idx = 5, position = { x = 200, y = 900 }, slots = { 'G', 'U', 'M' } }
  }
end

function states.gameLevel:draw()
  camera:attach()
    playerController:draw()
    checkpointController:draw()

    for _, controller in ipairs(allyControllers) do
      controller:draw()
    end

    -- world:draw()
  camera:detach()

  slotsThumbnails:draw()
end

function states.gameLevel:update(dt)
  handleInput()

  checkpointController:update()

  for _, controller in ipairs(allyControllers) do
    controller:update()
  end

  playerController.position.x = playerController.collider:getX()
  playerController.position.y = playerController.collider:getY()
  camera:lookAt(playerController.position.x, playerController.position.y)

  playerController:update(dt)

  world:update(dt)
end
