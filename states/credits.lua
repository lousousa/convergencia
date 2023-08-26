local function handleInput()
  if Input:pressed 'quit' or Input:pressed 'action2' then
    Gamestate.switch(states.title)
  end
end

function states.credits:enter()
  creditsData = {
    {
      title = 'Emma Araripe',
      subtitle = 'Artes e Beleza'
    },
    {
      title = 'Luis Sousa',
      subtitle = 'Programação Voraz'
    }
  }

  currentCredits = 1
  isWaiting = true

  primaryFont = love.graphics.newFont(primaryFontSrc, 96)
  secondaryFont = love.graphics.newFont(primaryFontSrc, 48)

  local function next()
    if currentCredits == #creditsData then
      isWaiting = true
      Timer.after(.5, function() Gamestate.switch(states.title) end)
      do return end
    end

    currentCredits = currentCredits + 1

    isWaiting = true
    Timer.clear()
    Timer.after(.5, function() isWaiting = false end)
    Timer.after(2.5, next)
  end

  Timer.after(.5, function() isWaiting = false end)
  Timer.after(2.5, next)
end

function states.credits:draw()
  if isWaiting then
    do return end
  end

  local width = love.graphics.getWidth()

  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setFont(secondaryFont)
  love.graphics.printf(creditsData[currentCredits].subtitle, 0, 248, width, 'center')

  love.graphics.setFont(primaryFont)
  love.graphics.printf(creditsData[currentCredits].title, 0, 330, width, 'center')
end

function states.credits:update(dt)
  Timer.update(dt)
  handleInput()
end