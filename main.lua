Timer = require 'vendor/hump/timer'
Gamestate = require 'vendor/hump/gamestate'

require('input')

require('states/init')
require('states/splash')
require('states/title')
require('states/credits')
require('states/game/puzzle')
require('states/game/level')

local function handleInput()
  if Input:pressed 'quit' then
    if Gamestate.current().name == 'title'
      or Gamestate.current().name == 'gamePuzzle'
      or Gamestate.current().name == 'gameLevel'
    then
      love.event.quit()
    else
      Gamestate.switch(states.title)
    end
  end
end

function love.load()
  primaryFontSrc = 'assets/fonts/oswald-regular.ttf'
  keyboardFontSrc = 'assets/fonts/alpha-echo.ttf'

  Gamestate.registerEvents()
  Gamestate.switch(states.gameLevel)
end

function love.update()
  Input:update()

  handleInput()
end
