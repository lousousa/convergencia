local function handleInput()
end

function states.gameEnd:enter()
end

function states.gameEnd:draw()
  local width = love.graphics.getWidth()
  local height = love.graphics.getHeight()

  messageFont = love.graphics.newFont(primaryFontSrc, 48)
  love.graphics.setFont(messageFont)
  love.graphics.printf('Parabéns,\nvocê resolveu o enigma!', 0, height / 2 - 72, width, 'center')
end

function states.gameEnd:update()
end
