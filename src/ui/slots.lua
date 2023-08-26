Slots = {}

function Slots:new(t)
  setmetatable(t, self)
  self.__index = self

  t.itemsScreenOffsetX = {
    192,
    680,
    976
  }

  t.items = {}
  t.currentText = ''
  t.itemsFont = love.graphics.newFont(keyboardFontSrc, 32)
  t.cursorPosition = 1

  return t
end

function Slots:draw()
  local background = love.graphics.newImage('assets/images/game/slots-background.jpg')
  love.graphics.draw(background, 0, 0)

  for i = 0, 6 do
    local x, y = self.itemsScreenOffsetX[1] + 64 * i + 24, 300
    love.graphics.circle('fill', x, y, 24)

    table.insert(self.items, { idx = #self.items + 1, x = x, y = y, value = '' })
  end

  for i = 0, 3 do
    local x, y = self.itemsScreenOffsetX[2] + 64 * i + 24, 300
    love.graphics.circle('fill', x, y, 24)

    table.insert(self.items, { idx = #self.items + 1, x = x, y = y, value = '' })
  end

  for i = 0, 1 do
    local x, y = self.itemsScreenOffsetX[3] + 64 * i + 24, 300
    love.graphics.circle('fill', x, y, 24)

    table.insert(self.items, { idx = #self.items + 1, x = x, y = y, value = '' })
  end

  for _, item in ipairs(self.items) do
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(self.itemsFont)
    love.graphics.print(item.value, item.x - 10, item.y - 18)
    love.graphics.setColor(1, 1, 1)
  end
end

function Slots:addItem(item)
  self.items[self.cursorPosition].value = item.value
  self.currentText = self.currentText .. item.value

  if self.cursorPosition == SLOTS_MAX_SIZE then
    local encoded = love.data.encode('string', 'base64', self.currentText)
    local isSuccess = encoded == 'TklOR1VFTVZJVkVTTw=='

    if isSuccess then
      Gamestate.switch(states.gameEnd)
      do return end
    end

    print('youre failed')
    do return end
  end

  self.cursorPosition = self.cursorPosition + 1
end

function Slots:reset()
  for _, item in ipairs(self.items) do
    item.value = ''
  end

  self.currentText = ''
  self.cursorPosition = 1
end