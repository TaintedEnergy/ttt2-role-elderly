if SERVER then
  AddCSLuaFile()
  resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_eld.vmt")
end

function ROLE:PreInitialize()
  self.color = Color(70, 24, 24, 255)

  self.abbr = "eld"
  self.surviveBonus = 0
  self.scoreKillsMultiplier = 5
  self.scoreTeamKillsMultiplier = -16

  self.defaultEquipment = SPECIAL_EQUIPMENT
  self.defaultTeam = TEAM_NONE

  self.conVarData = {
    pct = 0.17,
    maximum = 1,
    minPlayers = 6,
    togglable = true
  }
end

function ROLE:Initialize()
  if SERVER and JESTER then self.networkRoles = {JESTER} end
end

if SERVER then
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
    if ply:Alive() then ply:SetHealth((ply:Health() * GetConVar("ttt2_eld_health"):GetInt()) / ply:GetMaxHealth()) end
    ply:SetMaxHealth(GetConVar("ttt2_eld_health"):GetInt())
	end

  function ROLE:RemoveRoleLoadout(ply, isRoleChange)
    if ply:Alive() then ply:SetHealth((ply:Health() * 100) / ply:GetMaxHealth()) end
    ply:SetMaxHealth(100)
	end
end