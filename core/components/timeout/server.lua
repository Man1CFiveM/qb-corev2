local timeout

function QBCorev2.Components.Timeout.set(self)
  timeout = os.time()
end

function QBCorev2.Components.Timeout.get(self)
  return timeout
end

function QBCorev2.Components.Timeout.check(self, seconds)
  local time = os.time()
  if time - timeout >= seconds then
    return true
  end
  return false
end