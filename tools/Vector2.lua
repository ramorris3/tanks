local function Vector2()
  local self = {
    x = 0,
    y = 0,
  }

  function self.magnitude()
    return math.sqrt(self.x * self.x + self.y * self.y)
  end

  function self.normalize()
    local mag = self.magnitude()
    self.x = self.x / mag
    self.y = self.y / mag
  end

  function self.scale(k)
    self.x = self.x * k
    self.y = self.y * k
  end

  return self
end

return Vector2