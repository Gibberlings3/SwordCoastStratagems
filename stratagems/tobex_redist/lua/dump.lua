-- dump.lua

function dump_table(t, name)
  local index, value
  index = nil
  repeat
    index, value = next(t, index)
    if type(index) ~= "nil" then
      p(tostring(name) .. "->" .. tostring(index) .. ": " .. tostring(value))
    end
    if type(value) == "table" then
      dump_table(value, "--subtable")
    end
  until
    index == nil
end

function dump()
  local name, value
  name = nil
  repeat
    name, value = nextvar(name)
    if type(name) ~= "nil" then
      p(tostring(name) .. "->" .. tostring(value))
    end
    if type(value) == "table" then
      dump_table(value, "-table")
    end
  until
    name == nil
end
