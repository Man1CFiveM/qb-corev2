local Timeout = {}

function QBCorev2.Components.Timeout.set(self)
  self.time = os.time()
end

function QBCorev2.Components.Timeout.get(self)
  return self.time
end

function QBCorev2.Components.Timeout.check(self, seconds)
  local time = os.time()
  if time - self.time >= seconds then
    return true
  end
  return false
end