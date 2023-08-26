require 'src/ui/slots-thumbnails'

local function handleInput()
end

function states.gameLevel:enter()
  slotsThumbnails = SlotsThumbnails:new{}
end

function states.gameLevel:draw()
  slotsThumbnails:draw()
end

function states.gameLevel:update()
  handleInput()
end
