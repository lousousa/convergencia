WF = require 'vendor/windfield'
Camera = require 'vendor/camera'
Anim8 = require 'vendor/anim8'
STI = require 'vendor/sti'

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
  map = STI('assets/maps/predio.lua')

  world:addCollisionClass('Player')
  world:addCollisionClass('Checkpoint')
  world:addCollisionClass('Ally')

  slotsThumbnails = SlotsThumbnails:new{}

  playerObj = map.layers['player'].objects[1]
  PLAYER_SPAWN_POSITION.x = playerObj.x
  PLAYER_SPAWN_POSITION.y = playerObj.y
  playerController = PlayerController:new{}

  checkpointObj = map.layers['checkpoint'].objects[1]
  checkpointController = CheckpointController:new{
    position = {
      x = checkpointObj.x,
      y = checkpointObj.y
    }
  }

  slotsByAlly = {
    { 'S', 'I' },
    { 'O', 'N', 'V' },
    { 'E', 'I', 'V' },
    { 'E', 'N' },
    { 'G', 'U', 'M' }
  }

  allyControllers = {}

  if map.layers['allies'] then
    for i, obj in pairs(map.layers['allies'].objects) do
      local ally = AllyController:new{ idx = i, position = { x = obj.x, y = obj.y }, slots = slotsByAlly[i] }
      table.insert(allyControllers, ally)
    end
  end
end

function states.gameLevel:draw()
  camera:attach()
    map:drawLayer(map.layers['layer1'])

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
