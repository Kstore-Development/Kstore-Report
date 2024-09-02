local function toggleUI(bool)
	SetNuiFocus(bool, bool)
	SendNUIMessage({
		action = "setVisible",
		data = bool
	})
end

-- RegisterCommand("UI", function()
-- 	toggleUI(true)
-- end, false)

-- RegisterNUICallback("hideUI", function()
--     toggleUI(false)
-- end)

RegisterCommand('report', function()
    toggleUI(true)
end)

RegisterNUICallback('report', function(input)
    TriggerServerEvent('SendInfoToServer', input)
    toggleUI(false)
    lib.notify({description = 'Report recieved in database. A staff will take a look at your case in a bit. '})
end)