MusicManager = {}

function MusicManager:new(t)
  setmetatable(t, self)
  self.__index = self

  t.list = {
    mainTheme = love.audio.newSource('assets/music/mysterious-ambiance.mp3', 'stream'),
    credits = love.audio.newSource('assets/music/next-to-you.mp3', 'stream'),
    title = love.audio.newSource('assets/music/magic-space.mp3', 'stream'),
    endGame = love.audio.newSource('assets/music/shake-and-bake.mp3', 'stream')
  }

  return t
end

function MusicManager:stopAll()
  for _, music in pairs(self.list) do
    music:stop()
  end
end