-- area.lua

function area_getcurrent()
  local _game = createobject(game)
  local _index = _game:getbyte("0x38b4")
  local _offset = 14518 + 4 * _index -- 0x38b6
  return createobject(_game:getpointer(_offset), "area") --table
end

function area_listsprites(_are)
  if _are.type ~= "area" then
    error("expected an area object(1)")
  end

  local _front = _are:getlist("0x8ce")
  local _mid = _are:getlist("0x8ea")
  local _back = _are:getlist("0x906")
  
  local _index, _value
  local _obj

  if (_front ~= nil) then
    p("--Front")
    _index, _value = nil, nil
    repeat
      _index, _value = next(_front, _index)
      if (_value ~= nil) then
        _obj = createobject(getsprite(u2n(_value)), "sprite")
        _obj.type = sprite_gettype(_obj)
        _obj:print(1)
      end
    until _index == nil
  end

  if (_mid ~= nil) then
    p("--Mid")
    _index, _value = nil, nil
    repeat
      _index, _value = next(_mid, _index)
      if (_value ~= nil) then
        _obj = createobject(getsprite(u2n(_value)), "sprite")
        _obj.type = sprite_gettype(_obj)
        _obj:print(1)
      end
    until _index == nil
  end

  if (_back ~= nil) then
    p("--Back")
    _index, _value = nil, nil
    repeat
      _index, _value = next(_back, _index)
      if (_value ~= nil) then
        _obj = createobject(getsprite(u2n(_value)), "sprite")
        _obj.type = sprite_gettype(_obj)
        _obj:print(1)
      end
    until _index == nil
  end
end