Baton = require 'vendor/baton'

Input = Baton.new {
  controls = {
    up = { 'key:up', 'key:w' },
    right = { 'key:right', 'key:d' },
    down = { 'key:down', 'key:s' },
    left = { 'key:left', 'key:a' },
    action1 = { 'key:space', 'key:l' },
    action2 = { 'key:k' },
    start = { 'key:return' },
    quit = { 'key:escape' }
  }
}