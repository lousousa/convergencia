Slots = {}

function Slots:new(t)
  setmetatable(t, self)
  self.__index = self

  t.thumbsScreenOffsetX = {
    224,
    648,
    944
  }

  return t
end

function Slots:draw()
  for i = 0, 5 do
    love.graphics.circle('fill', self.thumbsScreenOffsetX[1] + 64 * i + 24, 300, 24)
  end

  for i = 0, 3 do
    love.graphics.circle('fill', self.thumbsScreenOffsetX[2] + 64 * i + 24, 300, 24)
  end

  for i = 0, 1 do
    love.graphics.circle('fill', self.thumbsScreenOffsetX[3] + 64 * i + 24, 300, 24)
  end

end