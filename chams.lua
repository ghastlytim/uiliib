local players = game:GetService('Players')
local runService = game:GetService('RunService')
local coreGui = game:GetService('CoreGui')

local client = players.LocalPlayer
local h_parent = coreGui

if type(gethui) == 'function' then h_parent = gethui() end
if type(get_hidden_gui) == 'function' then h_parent = get_hidden_gui() end

local function create(class, properties)
	local object = Instance.new(class)
	for k, v in next, properties do
		object[k] = v;
	end
	return object
end

local function cleaner()
	-- basic cleanup class so we dont have to import maid or broom 
	local tasks = {}
	local function give(task)
		table.insert(tasks, task)
	end
	local function clean()
		for i = #tasks, 1, -1 do
			local task = table.remove(tasks, i)

			if typeof(task) == 'Instance' then task:Destroy() end
			if typeof(task) == 'RBXScriptSignal' then task:Disconnect() end
			if typeof(task) == 'function' then task() end
		end
	end
	return give, clean
end

local chams = {}
local function onPlayerAdded(player)
	-- cleanup functions
	
	local p_give, p_clean = cleaner() -- player shit
	local c_give, c_clean = cleaner() -- character shit

	local function onCharacterAdded(character)
		c_clean()

		local highlight = create('Highlight', {
			Adornee = character,
			Parent = h_parent,
		})

		local storage = { player, highlight }

		c_give(highlight)
		c_give(function()
			local index = table.find(chams, storage)
			if index then
				table.remove(chams, index)
			end
		end)

		table.insert(chams, storage)
	end

	if player.Character then
		task.spawn(onCharacterAdded, player.Character)
	end

	p_give(player.CharacterAdded:Connect(onCharacterAdded))
	p_give(player:GetPropertyChangedSignal('Parent'):Connect(function()
		if player.Parent ~= players then
			p_clean()
			c_clean()
		end
	end))

end

for _, player in next, players:GetPlayers() do
	if player ~= client then
		task.spawn(onPlayerAdded, player)
	end
end

players.PlayerAdded:Connect(onPlayerAdded)

local function fail(r) client:Kick(r) end

runService.Stepped:Connect(function()
	for i = 1, #chams do
		local store = chams[i]
		local plr, highlight = store[1], store[2]

		local isSameTeam = plr.Team == client.Team
		local plrColor = (isSameTeam and _G.ChamsallyColor or _G.ChamsenemyColor)
		local plrOutlineColor = (isSameTeam and _G.ChamsallyOutlineColor or _G.ChamsenemyOutlineColor)

		local doesShow = _G.ChamsE 

		if _G.ChamsteamColors then plrColor = plr.TeamColor end
		if _G.ChamsshowTeams then doesShow = isSameTeam end

		highlight.Enabled = doesShow
		
		highlight.FillColor = plrColor
		highlight.OutlineColor = plrOutlineColor

		highlight.FillTransparency = _G.Chamstransparency
		highlight.OutlineTransparency = _G.ChamsoutlineTransparency
	end
end)
