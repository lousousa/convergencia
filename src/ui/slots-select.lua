SlotsSelect = {}

function SlotsSelect:new(t)
  setmetatable(t, self)
  self.__index = self

  t.itemsScreenOffsetX = 232
  t.itemsFont = love.graphics.newFont(keyboardFontSrc, 32)
  t.cursorPosition = 1

  return t
end

function SlotsSelect:draw()
  for i = 1, SLOTS_MAX_SIZE do
    local x, y = self.itemsScreenOffsetX + (48 + 16) * (i - 1) + 24, 420
    local slot = SLOTS[i]

    if slot then
      slot.idx = i
      slot.x = x
      slot.y = y

      love.graphics.circle('fill', x, y, 24)
      love.graphics.setColor(0, 0, 0)
      love.graphics.setFont(self.itemsFont)
      love.graphics.print(slot.value, x - 10, y - 18)
      love.graphics.setColor(1, 1, 1)
    else
      love.graphics.circle('line', x, y, 24)
    end
  end

  love.graphics.circle(
    'line',
    self.itemsScreenOffsetX + (48 + 16) * (self.cursorPosition - 1) + 24,
    420,
    32
  )
end

function SlotsSelect:moveLeft()
  if self.cursorPosition == 1 then
    self.cursorPosition = SLOTS_MAX_SIZE
    do return end
  end

  self.cursorPosition = self.cursorPosition - 1
end

function SlotsSelect:moveRight()
  if self.cursorPosition == SLOTS_MAX_SIZE then
    self.cursorPosition = 1
    do return end
  end

  self.cursorPosition = self.cursorPosition + 1
end

function SlotsSelect:selectItem()
  if SLOTS[self.cursorPosition].enabled == false then
    do return end
  end

  SLOTS[self.cursorPosition].enabled = false
  slots:addItem(SLOTS[self.cursorPosition])
end

function SlotsSelect:reset()
  for _, item in ipairs(SLOTS) do
    item.enabled = true
  end

  slots:reset()
end