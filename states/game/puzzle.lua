require 'src/ui/slots'
require 'src/ui/slots-select'
require 'src/ui/slots-instructions'

local function handleInput()
  if slots.isWaiting == true then
    do return end
  end

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
    slotsSelect:back()
  end

  if Input:pressed 'action3' then
    slotsSelect:reset()
  end
end

function states.gamePuzzle:enter()
  slots = Slots:new{}
  slotsSelect = SlotsSelect:new{}
  slotsInstructions = SlotsInstructions:new{}

  musicManager:stopAll()
  musicManager.list.credits:play()
  musicManager.list.credits:setLooping(true)
end

function states.gamePuzzle:draw()
  slots:draw()
  slotsSelect:draw()
  slotsInstructions:draw()
end

function states.gamePuzzle:update(dt)
  slots:update(dt)
  handleInput()
end
