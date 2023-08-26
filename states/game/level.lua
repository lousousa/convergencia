WF = require 'vendor/windfield'
Camera = require 'vendor/camera'

require 'src/ui/slots-thumbnails'

require 'src/controllers/player'
require 'src/controllers/checkpoint'
require 'src/controllers/ally'

local function handleInput()
  if Input:down 'left' then
    playerController:move{ x = -1, y = 0 }
  end

  if Input:down 'right' then
    playerController:move{ x = 1, y = 0 }
  end

  if Input:down 'up' then
    playerController:move{ x = 0, y = -1 }
  end

  if Input:down 'down' then
    playerController:move{ x = 0, y = 1 }
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
  allyController = AllyController:new{
    position = { x = 1000, y = 600 },
    slots = { 'E', 'I', 'V' }
  }
end

function states.gameLevel:draw()
  slotsThumbnails:draw()

  camera:attach()
    playerController:draw()
    checkpointController:draw()
    allyController:draw()

    -- world:draw()
  camera:detach()
end

function states.gameLevel:update(dt)
  handleInput()

  checkpointController:update()
  allyController:update()

  playerController.position.x = playerController.collider:getX()
  playerController.position.y = playerController.collider:getY()
  camera:lookAt(playerController.position.x, playerController.position.y)

  world:update(dt)
end
