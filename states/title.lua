local function textFadeIn()
  if titleOpacity < 1 then
    titleOpacity = titleOpacity + .01
  end

  if titleOpacity > .125 and optionsOpacity < 1 then
    optionsOpacity = optionsOpacity + .01
  end

  if optionsOpacity > .125 and footerOpacity < 1 then
    footerOpacity = footerOpacity + .01
  end
end

local function previousOption()
  optionSound:stop()
  optionSound:play()

  if titleSelected == 1 then
    titleSelected = #titleOptions
    do return end
  end

  titleSelected = titleSelected - 1
end

local function nextOption()
  optionSound:stop()
  optionSound:play()

  if titleSelected == #titleOptions then
    titleSelected = 1
    do return end
  end

  titleSelected = titleSelected + 1
end

local function handleInput()
  if Input:pressed 'up' then
    previousOption()
  end

  if Input:pressed 'down' then
    nextOption()
  end

  if Input:pressed 'start' or Input:pressed 'action1' then
    titleActions[titleSelected]()
  end
end

function states.title:enter()
  titleOptions = { 'Iniciar', 'Créditos', 'Sair' }

  titleSelected = 1

  titleActions = {
    function()
      Gamestate.switch(states.gameLevel)
    end,
    function()
      Gamestate.switch(states.credits)
    end,
    function()
      love.event.quit()
    end
  }

  titleFont = love.graphics.newFont(titleFontScr, 128)
  optionFont = love.graphics.newFont(primaryFontSrc, 48)
  footerFont = love.graphics.newFont(primaryFontSrc, 24)

  titleSound = love.audio.newSource('assets/sounds/load.wav', 'static')
  optionSound = love.audio.newSource('assets/sounds/misc_menu.wav', 'static')

  titleBackground = love.graphics.newImage('assets/images/arte-titulo.jpg')

  musicManager:stopAll()
  musicManager.list.title:play()
  titleSound:play()

  titleOpacity = 0
  optionsOpacity = 0
  footerOpacity = 0
end

function states.title:draw()
  local width = love.graphics.getWidth()

  love.graphics.setColor(1, 1, 1, titleOpacity)
  love.graphics.draw(titleBackground)
  love.graphics.setFont(titleFont)
  love.graphics.printf('ELO', 0, 106, width, 'center')

  for i, option in ipairs(titleOptions) do
    if i == titleSelected then
      love.graphics.setColor(181 / 255, 23 / 255, 158 / 255, optionsOpacity)
    else
      love.graphics.setColor(1, 1, 1, optionsOpacity)
    end

    love.graphics.setFont(optionFont)
    love.graphics.printf(option, 0, 296 + (i - 1) * 81, width, 'center')
  end

  love.graphics.setColor(1, 1, 1, footerOpacity)
  love.graphics.setFont(footerFont)
  love.graphics.printf('Desenvolvido em 2023', 0, 578, width, 'center')
  love.graphics.setColor(1, 1, 1, 1)
end

function states.title:update()
  textFadeIn()
  handleInput()
end