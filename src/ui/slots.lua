Slots = {}

function Slots:new(t)
  setmetatable(t, self)
  self.__index = self

  t.itemsScreenOffsetX = {
    192,
    680,
    976
  }

  return t
end

function Slots:draw()
  for i = 0, 6 do
    love.graphics.circle('fill', self.itemsScreenOffsetX[1] + 64 * i + 24, 300, 24)
  end

  for i = 0, 3 do
    love.graphics.circle('fill', self.itemsScreenOffsetX[2] + 64 * i + 24, 300, 24)
  end

  for i = 0, 1 do
    love.graphics.circle('fill', self.itemsScreenOffsetX[3] + 64 * i + 24, 300, 24)
  end

end