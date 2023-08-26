local function contentFadeIn()
  if contentOpacity < 1 then
    contentOpacity = contentOpacity + .025
  end
end

local function contentFadeOut()
  if contentOpacity > 0 then
    contentOpacity = contentOpacity - .025
  end
end

local function handleInput()
  if Input:pressed 'start' or Input:pressed 'action1' then
    Gamestate.switch(states.title)
  end
end

function states.splash:enter()
  isEntering = true
  isExiting = false

  messageFont = love.graphics.newFont(primaryFontSrc, 24)
  titleSmallFont = love.graphics.newFont(primaryFontSrc, 32)
  titleLargeFont = love.graphics.newFont(primaryFontSrc, 64)

  partnersLogos = {
    love.graphics.newImage('assets/images/splash-screen/logo-piauindie.png'),
    love.graphics.newImage('assets/images/splash-screen/logo-sebrae-pi.png')
  }

  footerLogo = love.graphics.newImage('assets/images/splash-screen/logo-love2d.png')

  Timer.after(.5, function() isEntering = false end)
  Timer.after(5.5, function() isExiting = true end)
  Timer.after(6.5, function() Gamestate.switch(states.title) end)

  contentOpacity = 0
end

function states.splash:update(dt)
  Timer.update(dt)
  if isEntering == false then
    if isExiting then
      contentFadeOut()
    else
      contentFadeIn()
    end
  end
  handleInput()
end

function states.splash:draw()
  love.graphics.setColor(1, 1, 1, contentOpacity)
  local width = love.graphics.getWidth()

  love.graphics.setFont(messageFont)
  local message = 'Este jogo foi idealizado e produzido no prazo de 48 horas\ndurante a PiauIndie Game Jam 2023, realizada por:'
  love.graphics.printf(message, 0, 88, width, 'center')

  love.graphics.draw(partnersLogos[1], 488, 216)
  love.graphics.draw(partnersLogos[2], 672, 216)

  love.graphics.setFont(titleSmallFont)
  love.graphics.printf('Um jogo de', 0, 392, width, 'center')

  love.graphics.setFont(titleLargeFont)
  love.graphics.printf('Manu & Luis', 0, 445, width, 'center')

  love.graphics.setFont(messageFont)
  local message = 'Desenvolvido com Löve 2D'
  love.graphics.printf(message, 504, 596, 230, 'center')
  love.graphics.draw(footerLogo, 744, 598)
end

