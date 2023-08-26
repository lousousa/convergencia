Select = {}

function Select:new(t)
  setmetatable(t, self)
  self.__index = self

  t.availableItems = {
    { value = 'E' },
    { value = 'N' },
    { value = 'G' },
    { value = 'U' },
    { value = 'M' },
    { value = 'S' },
    { value = 'I' },
    { value = 'O' },
    { value = 'N' },
    { value = 'E' },
    { value = 'I' },
    { value = 'V' },
    { value = 'V' }
  }
  t.itemsScreenOffsetX = 232
  t.itemsFont = love.graphics.newFont(primaryFontSrc, 24)
  t.cursorPosition = 1

  return t
end

function Select:draw()
  for i, item in ipairs(self.availableItems) do
    local x, y = self.itemsScreenOffsetX + (48 + 16) * (i - 1) + 24, 420
    item.x = x
    item.y = y

    love.graphics.circle('fill', x, y, 24)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(self.itemsFont)
    love.graphics.print(item.value, x - 6, y - 18)
    love.graphics.setColor(1, 1, 1)
  end

  love.graphics.circle(
    'line',
    self.availableItems[self.cursorPosition].x,
    self.availableItems[self.cursorPosition].y,
    32
  )
end