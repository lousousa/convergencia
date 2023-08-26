SlotsInstructions = {}

function SlotsInstructions:new(t)
  setmetatable(t, self)
  self.__index = self

  t.instructionsFont = love.graphics.newFont(primaryFontSrc, 24)

  return t
end

function SlotsInstructions:draw()
  love.graphics.setFont(self.instructionsFont)
  local message = '< > : para mover\nSPACE: para selecionar\nJ: para reiniciar\nK: para voltar'
  love.graphics.printf(message, 901, 555, 200, 'right')
end