--SCALE MANAGER UTIL--
local function ScaleComponent()
  local self = {}

  --low-res canvas to draw to
  local _canvas = love.graphics.newCanvas(gGameWidth, gGameHeight)
  _canvas:setFilter("nearest", "nearest") --for pixel-perfect scale

  --called in main.lua before normal drawing operations
  function self.preDraw()
    --set low-res canvas to draw to
    love.graphics.setCanvas(_canvas)
    love.graphics.setBackgroundColor(221,190,143)
    love.graphics.clear()
  end

  --called in main.lua after normal drawing operations
  function self.postDraw()
    local canvasWidth = gGameWidth
    local canvasHeight = gGameHeight
    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()
    local drawScale

    --calculate scale
    local gameAspect = canvasWidth / canvasHeight
    local windowAspect = windowWidth / windowHeight
    local sw = windowWidth / canvasWidth
    local sh = windowHeight / canvasHeight
    if windowAspect > gameAspect then drawScale = sh
    else drawScale = sw end

    --find v and h offset in order to center canvas
    local hMargin = windowWidth - (canvasWidth * drawScale)
    local vMargin = windowHeight - (canvasHeight * drawScale)
    drawOffsetHorizontal = hMargin / 2
    drawOffsetVertical = vMargin / 2

    --draw to low-res canvas to scale
    love.graphics.setCanvas()
    love.graphics.draw(_canvas, drawOffsetHorizontal, drawOffsetVertical, 0, drawScale, drawScale)
  end

  return self
end

return ScaleComponent