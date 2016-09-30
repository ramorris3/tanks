Solid = require 'objects.Solid'

local function TileLoader(game)
  local self = {}

  function self.loadTiles()
    for x = 0,19 do
      for y = 0, 14 do
        if x == 0 or x == 19 or y == 0 or y == 14 or math.random() < 0.05 then
          Solid(game,x*16, y*16 + 8, 16, 16)
        end
      end
    end
  end

  return self
end

return TileLoader