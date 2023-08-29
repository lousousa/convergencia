Baton = require 'vendor/baton'

Input = Baton.new {
  controls = {
    up = { 'key:up', 'key:w', 'axis:lefty-', 'button:dpup' },
    right = { 'key:right', 'key:d', 'axis:leftx+', 'button:dpright' },
    down = { 'key:down', 'key:s', 'axis:lefty+', 'button:dpdown' },
    left = { 'key:left', 'key:a', 'axis:leftx-', 'button:dpleft' },
    action1 = { 'key:space', 'key:l', 'button:a' },
    action2 = { 'key:k', 'button:b' },
    action3 = { 'key:j', 'button:x' },
    start = { 'key:return', 'button:start' },
    quit = { 'key:escape' }
  },
  joystick = love.joystick.getJoysticks()[1]
}