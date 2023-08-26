require 'src/ui/slots-thumbnails'
require 'src/ui/slots'

function states.game:enter()
  slotsThumbnails = SlotsThumbnails:new{}
  slots = Slots:new{}
end

function states.game:draw()
  slotsThumbnails:draw()
  slots:draw()
end
