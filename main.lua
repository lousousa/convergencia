Timer = require 'vendor/hump/timer'
Gamestate = require 'vendor/hump/gamestate'

require('input')

require('states/init')
require('states/splash')
require('states/title')
require('states/credits')
require('states/game')

local function handleInput()
  if Input:pressed 'quit' then
    if Gamestate.current().name == 'title'
      or Gamestate.current().name == 'game'
    then
      love.event.quit()
    else
      Gamestate.switch(states.title)
    end
  end
end

function love.load()
  primaryFontSrc = 'assets/fonts/oswald-regular.ttf'

  Gamestate.registerEvents()
  Gamestate.switch(states.game)
end

function love.update()
  Input:update()

  handleInput()
end
