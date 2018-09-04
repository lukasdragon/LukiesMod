local self = FindMetaTable( "Player" )
local lm_maxscore = GetConVar( "lm_maxscore")

function self:addPoints( amt )
  if not type( amt ) == "number" then return end

  local currentPoints = self:GetNWInt("points") + amt
  if currentPoints >= 0 then
    self:SetNWInt( "points", currentPoints)
  else
    self:SetNWInt( "points", 0)
  end

  if currentPoints >=  lm_maxscore:GetInt() then
    endMatch(self)
  end
end

function self:setPoints ( amt )
  if not type( amt ) == "number" then return end
  self:SetNWInt( "points", amt)
end

function self:getPoints ()
  return self:GetNWInt("points")
end
