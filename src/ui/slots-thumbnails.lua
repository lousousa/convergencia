SlotsThumbnails = {}

function SlotsThumbnails:new(t)
  setmetatable(t, self)
  self.__index = self

  t.thumbsScreenOffsetX = 387

  return t
end

function SlotsThumbnails:draw()
  for i = 1, SLOTS_MAX_SIZE do
    local slot = SLOTS[i]
    local mode = 'line'

    if slot then
      mode = 'fill'
    end

    love.graphics.circle(mode, self.thumbsScreenOffsetX + (24 + 16) * (i - 1) + 12, 52, 12)
  end

  love.graphics.rectangle('line', 371, 24, 538, 56, 24, 24)
end

function SlotsThumbnails:addSlots()
  print('add slots')
end