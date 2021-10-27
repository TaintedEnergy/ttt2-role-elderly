L = LANG.GetLanguageTableReference("en")

L[ELDERLY.name] = "Elderly"
L["info_popup_" .. ELDERLY.name] = [[You are an Elderly! You must survive until the end of the round!]]
L["body_found_" .. ELDERLY.abbr] = "They were an Elderly!"
L["search_role_" .. ELDERLY.abbr] = "This person was an Elderly!"
L["target_" .. ELDERLY.name] = "Elderly"
L["ttt2_desc_" .. ELDERLY.name] = [[Elderly is a neutral role that wins with the winning team if they remain alive.]]