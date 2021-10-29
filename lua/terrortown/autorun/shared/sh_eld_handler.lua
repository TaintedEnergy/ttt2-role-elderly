if SERVER then
  hook.Add("TTT2ModifyWinningAlives", "CheckElderlyTeamSwitch", function(alives)
    local winningTeam = ""

    if alives == nil then return end

    -- Check alive teams
    for i in pairs(alives) do
      local t = alives[i]
      if winningTeam != "" and winningTeam != t then return end
      winningTeam = t
    end

    if winningTeam == "" then return end
 
    -- Find and change Elderlys' team to winning team
    for _, ply in ipairs(player.GetAll()) do
      if not IsValid(ply) or not ply:Alive() then continue end
			if SpecDM and (ply.IsGhost and ply:IsGhost() or (vics.IsGhost and vics:IsGhost())) then continue end

      if ply:GetSubRole() == ROLE_ELDERLY then
        ply:UpdateTeam(winningTeam, false)
      end
    end
  end)
end