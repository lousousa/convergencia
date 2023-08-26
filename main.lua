Timer = require 'vendor/hump/timer'
Gamestate = require 'vendor/hump/gamestate'

require('input')

require('gamestates/init')
require('gamestates/splash')
require('gamestates/title')
require('gamestates/credits')
require('gamestates/game')

local function handleInput()
  if Input:pressed 'quit' then
    if Gamestate.current().name == 'title' then
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
