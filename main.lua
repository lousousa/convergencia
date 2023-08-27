Timer = require 'vendor/hump/timer'
Gamestate = require 'vendor/hump/gamestate'
WF = require 'vendor/windfield'
Camera = require 'vendor/camera'
Anim8 = require 'vendor/anim8'
STI = require 'vendor/sti'
Flux = require 'vendor/flux'

require('input')

require('src/globals')
require('src/music-manager')

require('states/init')
require('states/splash')
require('states/title')
require('states/credits')
require('states/game/puzzle')
require('states/game/level')
require('states/game/end')

local function handleInput()
  if Input:pressed 'quit' then
    if Gamestate.current().name == 'title'
      -- or Gamestate.current().name == 'gamePuzzle'
      -- or Gamestate.current().name == 'gameLevel'
    then
      love.event.quit()
    else
      musicManager:stopAll()
      Gamestate.switch(states.title)
    end
  end
end

function love.load()
  primaryFontSrc = 'assets/fonts/oswald-regular.ttf'
  titleFontScr = 'assets/fonts/20db.otf'
  keyboardFontSrc = 'assets/fonts/alpha-echo.ttf'

  musicManager = MusicManager:new{}

  Gamestate.registerEvents()
  Gamestate.switch(states.gameEnd)
end

function love.update()
  Input:update()

  handleInput()
end
