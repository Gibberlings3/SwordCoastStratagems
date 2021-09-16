-- sprite.lua

function sprite_getcurrent()
  local _area = area_getcurrent()
  local _enum = _area:getdword("0x242")
  if _enum == -1 then
    error("No object")
  end
  local _sprite = createobject(getsprite(_enum), "sprite")
  _sprite.type = sprite_gettype(_sprite)
  return _sprite --table
end

function sprite_gettype(_obj)
  if _obj.type ~= "sprite" then
    error("expected a sprite object (1)")
  end

  local _type = _obj:getbyte(4)
  if _type == 0 then
    local _vtable = dec2hex(_obj:getdword(0))
    if _vtable == "0xab7428" then
      return "sprite_chunks"
    elseif _vtable == "0xaabb68" then
      return "sprite_sparkle"
    elseif _vtable == "0xaabedc" then
      return "sprite_projbam"
    elseif _vtable == "0xaaced0" then
      return "sprite_vvc"
    elseif _vtable == "0xaacfa8" then
      return "sprite_vef"
    elseif _vtable == "0xaac9e8" then
      return "sprite_castglow"
    elseif _vtable == "0xaaca70" then
      return "sprite_spellhit"
    else
      return _vtable
    end
  elseif _type == 1 then
    return "sprite"
  elseif _type == 16 then -- 0x10
    return "sprite_sound"
  elseif _type == 17 then -- 0x11
    return "sprite_container"
  elseif _type == 32 then -- 0x20
    return "sprite_spawn"
  elseif _type == 33 then -- 0x21
    return "sprite_door"
  elseif _type == 48 then -- 0x30
    return "sprite_static"
  elseif _type == 49 then -- 0x31
    return "sprite_creature"
  elseif _type == 64 then -- 0x40
    return "sprite_objmarker"
  elseif _type == 65 then -- 0x41
    return "sprite_trigger"
  elseif _type == 80 then -- 0x50
    return "sprite_projectile"
  elseif _type == 81 then -- 0x51
    return "sprite_tile"
  elseif _type == 96 then -- 0x60
    return "sprite_smoke"
  elseif _type == 97 then -- 0x61
    return "sprite_area"
  elseif _type == 113 then -- 0x71
    return "sprite_baldur"
  else
    return "notype"
  end
end
