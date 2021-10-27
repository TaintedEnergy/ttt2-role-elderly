if SERVER then
  hook.Add("TTT2ModifyWinningAlives", "CheckElderlyTeamSwitch", function(alives)
    local winningTeam = ""

    -- Check alive teams
    for i in pairs(alives) do
      local t = alives[i]
      if winningTeam != "" and winningTeam != t then return end
      winningTeam = t
    end
 
    -- Find and change Elderlys' team to winning team
    for _, ply in ipairs(player.GetAll()) do
      if not IsValid(ply) or ply:IsDeadTerror() then continue end
			if SpecDM and (ply.IsGhost and ply:IsGhost() or (vics.IsGhost and vics:IsGhost())) then continue end

      if ply:GetSubRole() == ROLE_ELDERLY then
        ply:UpdateTeam(winningTeam, false)
        if has_elderly == false then has_elderly = true end
      end
    end
  end)
end