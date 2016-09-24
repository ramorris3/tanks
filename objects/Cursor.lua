-- The curson image -- 
local function Cursor(x,y)
  local self = {}
  local _img = love.graphics.newImage("assets/img/cursor.png")

  gDrawComponent.addDrawable(self, 5)

  function self.draw()
    local x, y = love.mouse.getPosition() -- get the position of the mouse
    x,y = math.floor(x/gGameScale), math.floor(y/gGameScale)
    love.graphics.draw(_img, x, y) -- draw the custom mouse image
  end

  return self
end

return Cursor