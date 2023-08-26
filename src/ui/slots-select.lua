SlotsSelect = {}

function SlotsSelect:new(t)
  setmetatable(t, self)
  self.__index = self

  t.items = {
    { value = 'E', enabled = true },
    { value = 'N', enabled = true },
    { value = 'G', enabled = true },
    { value = 'U', enabled = true },
    { value = 'M', enabled = true },
    { value = 'S', enabled = true },
    { value = 'I', enabled = true },
    { value = 'O', enabled = true },
    { value = 'N', enabled = true },
    { value = 'E', enabled = true },
    { value = 'I', enabled = true },
    { value = 'V', enabled = true },
    { value = 'V', enabled = true }
  }

  t.itemsScreenOffsetX = 232
  t.itemsFont = love.graphics.newFont(primaryFontSrc, 24)
  t.cursorPosition = 1

  return t
end

function SlotsSelect:draw()
  for i, item in ipairs(self.items) do
    local x, y = self.itemsScreenOffsetX + (48 + 16) * (i - 1) + 24, 420

    if item.enabled then
      item.idx = i
      item.x = x
      item.y = y

      love.graphics.circle('fill', x, y, 24)
      love.graphics.setColor(0, 0, 0)
      love.graphics.setFont(self.itemsFont)
      love.graphics.print(item.value, x - 6, y - 18)
      love.graphics.setColor(1, 1, 1)
    else
      love.graphics.circle('line', x, y, 24)
    end
  end

  love.graphics.circle(
    'line',
    self.items[self.cursorPosition].x,
    self.items[self.cursorPosition].y,
    32
  )
end

function SlotsSelect:moveLeft()
  if self.cursorPosition == 1 then
    self.cursorPosition = #self.items
    do return end
  end

  self.cursorPosition = self.cursorPosition - 1
end

function SlotsSelect:moveRight()
  if self.cursorPosition == #self.items then
    self.cursorPosition = 1
    do return end
  end

  self.cursorPosition = self.cursorPosition + 1
end

function SlotsSelect:selectItem()
  if self.items[self.cursorPosition].enabled == false then
    do return end
  end

  self.items[self.cursorPosition].enabled = false
  slots:addItem(self.items[self.cursorPosition])
end

function SlotsSelect:reset()
  for _, item in ipairs(self.items) do
    item.enabled = true
  end

  slots:reset()
end