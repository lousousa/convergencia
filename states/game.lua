require 'src/ui/slots'
require 'src/ui/slots-thumbnails'
require 'src/ui/slots-select'
require 'src/ui/slots-instructions'

local function handleInput()
  if Input:pressed 'left' then
    slotsSelect:moveLeft()
  end

  if Input:pressed 'right' then
    slotsSelect:moveRight()
  end

  if Input:pressed 'action1' then
    slotsSelect:selectItem()
  end

  if Input:pressed 'action2' then
    slotsSelect:reset()
  end
end

function states.game:enter()
  slots = Slots:new{}
  slotsThumbnails = SlotsThumbnails:new{}
  slotsSelect = SlotsSelect:new{}
  slotsInstructions = SlotsInstructions:new{}
end

function states.game:draw()
  slots:draw()
  -- slotsThumbnails:draw()
  slotsSelect:draw()
  slotsInstructions:draw()
end

function states.game:update()
  handleInput()
end
