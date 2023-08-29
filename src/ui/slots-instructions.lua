SlotsInstructions = {}

function SlotsInstructions:new(t)
  setmetatable(t, self)
  self.__index = self

  t.instructionsFont = love.graphics.newFont(primaryFontSrc, 24)

  return t
end

function SlotsInstructions:draw()
  love.graphics.setFont(self.instructionsFont)
  local message = '< > : mover\nSPACE: selecionar\nJ: reiniciar\nK: voltar'

  if love.joystick.getJoystickCount() > 0 then
    message = '< > : mover\nB: selecionar\nX: reiniciar\nA: voltar'
  end

  love.graphics.printf(message, 901, 555, 200, 'right')
end