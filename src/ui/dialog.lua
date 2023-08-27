Dialog = {}

function Dialog:new(t)
  setmetatable(t, self)
  self.__index = self

  t.position = {
    x = 0,
    y = 0
  }

  t.dialogFont = love.graphics.newFont(primaryFontSrc, 32)

  return t
end

function Dialog:draw()
  if DIALOG_MESSAGE ~= '' then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle('fill', self.position.x - 16, self.position.y - 16, 532, 120)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(self.dialogFont)
    love.graphics.printf(DIALOG_MESSAGE, self.position.x, self.position.y, 500)
  end
end

function Dialog:update(dt)
  Timer.update(dt)
end

function Dialog:show(message, time, position)
  DIALOG_MESSAGE = message
  self.position = position
  Timer.after(time, function() DIALOG_MESSAGE = '' end)
end