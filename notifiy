local lib = {}

function lib:CreateNotify(settings,callback)
    if type(settings) ~= "table" then print("Invalid settings provided, table excepted. <lib:CreateNotify()>");return end
    local callback = callback or function() end
    local _airg = false

    -- services
    local sTween = game:GetService("TweenService")

    -- vars apply
    local setting = {['1'] = "title", ['2'] = "text", ['3'] = 1.2,['4'] = 16}
    for i,v in pairs(settings) do
        if table.find({"title","name"},tostring(i):lower()) and type(v) == "string" then
            setting['1'] = v
        elseif table.find({"desc","text"},tostring(i):lower()) and type(v) == "string" then
            setting['2'] = v
        elseif table.find({"time","wait","sleep"},tostring(i):lower()) and type(v) == "number" then
            setting['3'] = v
        elseif table.find({"textscale"},tostring(i):lower()) and type(v) == "number" then
            setting['4'] = v
        else print('"'..i..'" is not valid var, check "'..i..'" name and "'..v..'" type.') end
    end

    local function _App(_1,obj)
        if obj == nil then return "no ScreenGui Instance given." end
        if obj.ClassName ~= "ScreenGui" then return "Instance is not a ScreenGui class" end
        if _1 == 1 then
            sTween:Create(obj.Frame,TweenInfo.new(1),{Position = UDim2.new(0.8, 0,0.84, 0)}):Play()
            sTween:Create(obj.Frame,TweenInfo.new(0.6),{ImageTransparency = 0}):Play()
            for i,v in pairs(obj:GetDescendants()) do
                if v.ClassName == "ImageLabel" then sTween:Create(v,TweenInfo.new(0.6),{ImageTransparency = 0}):Play()
                elseif v.ClassName == "TextLabel" then sTween:Create(v,TweenInfo.new(0.6),{TextTransparency = 0}):Play() 
                end
            end
        elseif _1 == 2 then
            sTween:Create(obj.Frame,TweenInfo.new(1),{Position = UDim2.new(0.85, 0,0.89, 0)}):Play()
            sTween:Create(obj.Frame,TweenInfo.new(0.6),{ImageTransparency = 1}):Play()
            for i,v in pairs(obj:GetDescendants()) do
                if v.ClassName == "ImageLabel" then sTween:Create(v,TweenInfo.new(0.6),{ImageTransparency = 1}):Play()
                elseif v.ClassName == "TextLabel" then sTween:Create(v,TweenInfo.new(0.6),{TextTransparency = 1}):Play()
                end
            end
            sTween:Create(obj.Frame.Body.TextFrame.ProgressBg.Progress,TweenInfo.new(0.1),{Size = UDim2.new(1, 0, 1, 0)}):Play()
        end
        wait(0.6)
    end
    local function RandomID(count)
        local indificator = ""
        local symbols = {"Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M","q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m","1","2","3","4","5","6","7","8","9","0","!","@","#","$","%","^","&","*"}
        for i = 1,count do indificator = indificator .. symbols[math.random(#symbols)] end
        return indificator
    end

    if _G.LastNotificationId ~= nil then
        for i,v in pairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
            if v.Name == _G.LastNotificationId then
                _App(2,v)
                v:Destroy()
            end
        end
    end

    local randname = Instance.new("ScreenGui")
    local Frame = Instance.new("ImageLabel")
    local Body = Instance.new("TextButton")
    local bg = Instance.new("ImageLabel")
    local TextFrame = Instance.new("ImageLabel")
    local ProgressBg = Instance.new("ImageLabel")
    local Progress = Instance.new("ImageLabel")
    local Desc = Instance.new("TextLabel")
    local Title = Instance.new("TextLabel")

    _G.LastNotificationId = RandomID(8)
    randname.Name = _G.LastNotificationId
    randname.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Frame.Name = "Frame"
    Frame.Parent = randname
    Frame.BackgroundTransparency = 1
    Frame.Position = UDim2.new(0.85, 0,0.89, 0)
    Frame.Size = UDim2.new(0, 250, 0, 17)
    Frame.ZIndex = 2
    Frame.Image = "rbxassetid://3570695787"
    Frame.ImageTransparency = 1
    Frame.ImageColor3 = Color3.fromRGB(25, 25, 25)
    Frame.ScaleType = Enum.ScaleType.Slice
    Frame.SliceCenter = Rect.new(100, 100, 100, 100)
    Frame.SliceScale = 0.040

    Body.Name = "Body"
    Body.Parent = Frame
    Body.AnchorPoint = Vector2.new(0.5, 0)
    Body.BackgroundTransparency = 1
    Body.ClipsDescendants = true
    Body.Position = UDim2.new(0.5, 0, 0.45, 0)
    Body.Size = UDim2.new(1, 0, 0, 85)
    Body.Text = ""

    bg.Name = "bg"
    bg.Parent = Body
    bg.Active = true
    bg.AnchorPoint = Vector2.new(0.5, 0.5)
    bg.BackgroundTransparency = 1
    bg.Position = UDim2.new(0.5, 0, 0.5, 0)
    bg.Selectable = true
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Image = "rbxassetid://3570695787"
    bg.ImageColor3 = Color3.fromRGB(15, 15, 15)
    bg.ImageTransparency = 1
    bg.ScaleType = Enum.ScaleType.Slice
    bg.SliceCenter = Rect.new(100, 100, 100, 100)
    bg.SliceScale = 0.040

    TextFrame.Name = "TextFrame"
    TextFrame.Parent = Body
    TextFrame.BackgroundTransparency = 1
    TextFrame.ClipsDescendants = true
    TextFrame.Position = UDim2.new(0.02, 0, 0.19, 0)
    TextFrame.Size = UDim2.new(0, 240, 0, 63)
    TextFrame.Image = "rbxassetid://3570695787"
    TextFrame.ImageTransparency = 1
    TextFrame.ImageColor3 = Color3.fromRGB(25, 25, 25)
    TextFrame.ScaleType = Enum.ScaleType.Slice
    TextFrame.SliceCenter = Rect.new(100, 100, 100, 100)
    TextFrame.SliceScale = 0.050

    ProgressBg.Name = "ProgressBg"
    ProgressBg.Parent = TextFrame
    ProgressBg.AnchorPoint = Vector2.new(0.5, 0.5)
    ProgressBg.BackgroundTransparency = 1
    ProgressBg.ClipsDescendants = true
    ProgressBg.Position = UDim2.new(0.5, 0, 0.9, 0)
    ProgressBg.Size = UDim2.new(0, 230, 0, 7)
    ProgressBg.ImageTransparency = 1
    ProgressBg.Image = "rbxassetid://3570695787"
    ProgressBg.ImageColor3 = Color3.fromRGB(30, 30, 30)
    ProgressBg.ScaleType = Enum.ScaleType.Slice
    ProgressBg.SliceCenter = Rect.new(100, 100, 100, 100)
    ProgressBg.SliceScale = 0.120

    Progress.Name = "Progress"
    Progress.Parent = ProgressBg
    Progress.AnchorPoint = Vector2.new(0, 0.5)
    Progress.BackgroundTransparency = 1
    Progress.Position = UDim2.new(0, 0, 0.5, 0)
    Progress.Size = UDim2.new(0, 0, 1, 0)
    Progress.ImageTransparency = 1
    Progress.Image = "rbxassetid://3570695787"
    Progress.ImageColor3 = Color3.fromRGB(85, 0, 182)
    Progress.ScaleType = Enum.ScaleType.Slice
    Progress.SliceCenter = Rect.new(100, 100, 100, 100)
    Progress.SliceScale = 0.120

    Desc.Name = "Desc"
    Desc.Parent = TextFrame
    Desc.BackgroundTransparency = 1
    Desc.Position = UDim2.new(0.02, 0, 0.095, 0)
    Desc.Size = UDim2.new(0, 230, 0, 40)
    Desc.Font = Enum.Font.Gotham
    Desc.Text = setting['2']
    Desc.TextTransparency = 1
    Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
    Desc.TextSize = setting['4']
    Desc.TextWrapped = true
    Desc.TextYAlignment = Enum.TextYAlignment.Top

    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.0168332513, 0, -0.0224088784, 0)
    Title.Size = UDim2.new(0, 235, 0, 17)
    Title.ZIndex = 2
    Title.Font = Enum.Font.Gotham
    Title.Text = setting['1']
    Title.TextTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 13
    Title.TextXAlignment = Enum.TextXAlignment.Left

    spawn(function()
        _App(1,randname)

        sTween:Create(Progress,TweenInfo.new(0.1),{Size = UDim2.new(0.04, 0, 1, 0)}):Play()
        wait(0.1)

        sTween:Create(Progress,TweenInfo.new(setting['3']),{Size = UDim2.new(1, 0, 1, 0)}):Play()
        wait(setting['3'] - 0.1)

        _App(2,randname)
        randname:Destroy()
    end)

        Body.MouseButton1Down:Connect(function()
            if _airg == false then
                _airg = true
                pcall(callback)
                _App(2,randname)
                randname:Destroy()
            end
        end)

end
return lib

--[[

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/GameSTALkER/synapse.luas/main/UiLibs/NotifyLibRewrite.lua"))()

lib:CreateNotify({[name, title]: string, [desc, text]: string, [time, wait, sleep]: number},callback: function() or nil)

lib:CreateNotify({name="Notification test",text='with callback',time=3},function() print("clicked!") end)
wait(1)
lib:CreateNotify({title="Notification test",desc='without callback',sleep=1.3})

]]--
