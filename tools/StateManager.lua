-- game state manager
local function StateManager()
  local self = {}

  local _states = {}
  local _currentState

  -- adding and starting states
  function self.addState(key, state)
    _states[key] = state
  end

  function self.startState(key)
    -- reset draw and update components to clear current state
    gDrawComponent.reset()
    gUpdateComponent.reset()

    -- create instance of new state
    -- (this adds it to components)
    _currentState = _states[key]()
  end

  return self
end

return StateManager