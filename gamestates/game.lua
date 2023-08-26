require 'src/ui/slots-thumbnails'
require 'src/ui/slots'
require 'src/ui/select'

function states.game:enter()
  slotsThumbnails = SlotsThumbnails:new{}
  slots = Slots:new{}
  select = Select:new{}
end

function states.game:draw()
  slotsThumbnails:draw()
  slots:draw()
  select:draw()
end
