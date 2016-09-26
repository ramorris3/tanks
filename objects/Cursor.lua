-- The curson image -- 
local function Cursor()
  local self = {}
  local _img = love.graphics.newImage("assets/img/cursor.png")

  gDrawComponent.addDrawable(self, 5)

  function self.draw()
    local x, y = love.mouse.getScaledPosition() -- get the position of the mouse
    love.graphics.draw(_img, x-4, y-4) -- draw the custom mouse image, -4 so reticle is centered on pointer
  end

  return self
end

return Cursor