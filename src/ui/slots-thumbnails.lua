SlotsThumbnails = {}

function SlotsThumbnails:new(t)
  setmetatable(t, self)
  self.__index = self

  t.thumbsScreenOffsetX = 387

  return t
end

function SlotsThumbnails:draw()
  for i = 0, 12 do
    love.graphics.circle('fill', self.thumbsScreenOffsetX + (24 + 16) * i + 12, 52, 12)
  end

  love.graphics.rectangle('line', 371, 24, 538, 56, 24, 24)
end