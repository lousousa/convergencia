Baton = require 'vendor/baton'

Input = Baton.new {
  controls = {
    up = { 'key:up', 'key:w' },
    down = { 'key:down', 'key:s' },
    action1 = { 'key:space', 'key:l' },
    action2 = { 'key:k' },
    start = { 'key:return' },
    quit = { 'key:escape' }
  }
}