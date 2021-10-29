CreateConVar("ttt2_eld_health", 20, {FCVAR_NOTIFY, FCVAR_ARCHIVE})

hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_dynamic_eld_convars", function(tbl)
  tbl[ROLE_ELDERLY] = tbl[ROLE_ELDERLY] or {}

  table.insert(tbl[ROLE_ELDERLY], {
      cvar = "ttt2_eld_health",
      slider = true,
      min = 0,
      max = 100,
      desc = "ttt2_eld_health (def. 20)"
  })
end)
