SlotsThumbnails = {}

function SlotsThumbnails:new(t)
  setmetatable(t, self)
  self.__index = self

  t.thumbsScreenOffsetX = 408

  return t
end

function SlotsThumbnails:draw()
  for i = 0, 11 do
    love.graphics.circle('fill', self.thumbsScreenOffsetX + 40 * i + 12, 52, 12)
  end

  love.graphics.rectangle('line', 392, 24, 496, 56, 24, 24)
end