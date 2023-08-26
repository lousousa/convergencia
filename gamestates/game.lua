require 'src/ui/slots-thumbnails'
require 'src/ui/slots'
require 'src/ui/select'

local function handleInput()
  if Input:pressed 'left' then
    select:moveLeft()
  end

  if Input:pressed 'right' then
    select:moveRight()
  end

  if Input:pressed 'action1' then
    select:selectItem()
  end

  if Input:pressed 'action2' then
    select:reset()
  end
end

function states.game:enter()
  slotsThumbnails = SlotsThumbnails:new{}
  slots = Slots:new{}
  select = Select:new{}
end

function states.game:draw()
  slotsThumbnails:draw()
  slots:draw()
  select:draw()
end

function states.game:update()
  handleInput()
end
