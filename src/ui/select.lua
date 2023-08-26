Select = {}

function Select:new(t)
  setmetatable(t, self)
  self.__index = self

  t.availableItems = {
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

function Select:draw()
  for i, item in ipairs(self.availableItems) do
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
    self.availableItems[self.cursorPosition].x,
    self.availableItems[self.cursorPosition].y,
    32
  )
end

function Select:moveLeft()
  if self.cursorPosition == 1 then
    self.cursorPosition = #self.availableItems
    do return end
  end

  self.cursorPosition = self.cursorPosition - 1
end

function Select:moveRight()
  if self.cursorPosition == #self.availableItems then
    self.cursorPosition = 1
    do return end
  end

  self.cursorPosition = self.cursorPosition + 1
end

function Select:selectItem()
  self.availableItems[self.cursorPosition].enabled = false
  slots:addItem(self.availableItems[self.cursorPosition])
end