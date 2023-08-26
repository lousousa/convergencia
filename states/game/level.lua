WF = require 'vendor/windfield'

require 'src/ui/slots-thumbnails'
require 'src/controllers/player'

local function handleInput()
  if Input:down 'left' then
    playerController:move({ x = -1, y = 0 })
  end

  if Input:down 'right' then
    playerController:move({ x = 1, y = 0 })
  end

  if Input:down 'up' then
    playerController:move({ x = 0, y = -1 })
  end

  if Input:down 'down' then
    playerController:move({ x = 0, y = 1 })
  end
end

function states.gameLevel:enter()
  world = WF.newWorld(0, 0)
  world:addCollisionClass('Player')

  slotsThumbnails = SlotsThumbnails:new{}
  playerController = PlayerController:new{}
end

function states.gameLevel:draw()
  slotsThumbnails:draw()
  playerController:draw()

  world:draw()
end

function states.gameLevel:update(dt)
  handleInput()

  playerController.position.x = playerController.collider:getX() - playerController.width / 2
  playerController.position.y = playerController.collider:getY() - playerController.height / 2
  world:update(dt)
end
