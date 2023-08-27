Dialog = {}

function Dialog:new(t)
  setmetatable(t, self)
  self.__index = self

  t.position = {
    x = 0,
    y = 0
  }

  t.dialogFont = love.graphics.newFont(primaryFontSrc, 32)
  t.messageLength = 0
  t.cursor = 1

  return t
end

function Dialog:draw()
  if DIALOG_MESSAGE ~= '' then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle('fill', self.position.x - 16, self.position.y - 16, 532, 120)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(self.dialogFont)

    local message = string.sub(DIALOG_MESSAGE, 1, self.cursor)
    love.graphics.printf(message, self.position.x, self.position.y, 500)
  end
end

function Dialog:update(dt)
  Timer.update(dt)

  if self.cursor < self.messageLength then
    self.cursor = self.cursor + 1
  end
end

function Dialog:show(message, time, position)
  Timer.clear()
  DIALOG_MESSAGE = message
  self.messageLength = #message
  self.cursor = 0
  self.position = position
  Timer.after(time, function() DIALOG_MESSAGE = '' end)
end