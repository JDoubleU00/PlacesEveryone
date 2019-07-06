local name, mod = ...
local peorder = {
	{"JWXPBar","JWXPBarFrame",0,0},
	{"JWRepBar","JWRepBarFrame",0,7},
	{"BFAInvasionTimer","BFAInvasionTimer",0,25},
	{"Skada","SkadaBarWindowSkada",0,18},
	{"TinyDPS","tdpsFrame",0,5},
}
local pestartpoint = {"BOTTOMRIGHT","UIParent", "BOTTOMRIGHT",-10,30}
local lt = {}
local ht = ""

local function PlaceStuff()
    for key, value in pairs(peorder) do
      if IsAddOnLoaded(peorder[key][1]) and _G[peorder[key][2]]:IsVisible() then
         --ht = _G[peorder[key][2]]:GetHeight()
		 table.insert(lt,peorder[key])
		 --peorder[key][5]=ht
      end
   end
   
   for j, k in pairs(lt) do
      _G[lt[j][2]]:SetMovable(true)
      _G[lt[j][2]]:SetUserPlaced(true)
      _G[lt[j][2]]:ClearAllPoints()
      if j == 1 then
         _G[lt[j][2]]:SetPoint("BOTTOMRIGHT","UIParent", "BOTTOMRIGHT",-10,30) --first frame gets anchored to UIParent
      else
		 --[3] x offset, [4] is y offset, [5] is height of frame look at the table entry for anchoring
         _G[lt[j][2]]:SetPoint("BOTTOM",_G[lt[j-1][2]],"TOP",lt[j][3],lt[j][4]) --+lt[j-1][5])
		 print(j.."-",_G[lt[j][2]]:GetName(),_G[lt[j-1][2]]:GetName(),lt[j][3],lt[j][4])
      end
   end
end

local PEF = CreateFrame("Frame", name, UIParent)
PEF:RegisterEvent("PLAYER_ENTERING_WORLD")
PEF:SetScript("OnEvent", PlaceStuff)
