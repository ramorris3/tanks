function love.mouse.getScaledX()
    return math.floor(love.mouse.getX() / gGameScale)
end

function love.mouse.getScaledY()
    return math.floor(love.mouse.getY() / gGameScale)
end

function love.mouse.getScaledPosition()
    return love.mouse.getScaledX(), love.mouse.getScaledY()
end