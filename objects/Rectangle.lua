-- RECTANGLE COLLIDER CLASS --
local function Rectangle(x, y, w, h)
  local self = {
    x = x or 0,
    y = y or 0,
    w = w or 16,
    h = h or 16
  }

  function self.collideWith(other)
    if self.x < other.x + other.w and
      self.x + self.w > other.x and
      self.y < other.y + other.h and
      self.y + self.h > other.y then
      return true
    end
    return false
  end

  return self
end

return Rectangle