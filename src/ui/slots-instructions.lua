SlotsInstructions = {}

function SlotsInstructions:new(t)
  setmetatable(t, self)
  self.__index = self

  t.instructionsFont = love.graphics.newFont(primaryFontSrc, 24)

  return t
end

function SlotsInstructions:draw()
  love.graphics.setFont(self.instructionsFont)
  local message = '< > : para mover\nSPACE: para selecionar\nK: para reiniciar'
  love.graphics.printf(message, 901, 564, 200, 'right')
end