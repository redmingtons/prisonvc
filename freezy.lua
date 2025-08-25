local UiLibrary = {}
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local CoreGui = getgenv == nil and LocalPlayer:WaitForChild("PlayerGui") or game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

function AddStroke(parent, thickness, _, transparency)
	local Stroke = Instance.new("UIStroke")
	Stroke.Parent = parent
	Stroke.Thickness = thickness
	Stroke.Color = Color3.fromRGB(231, 231, 231) 
	Stroke.Transparency = transparency
	Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	return Stroke
end

function UiLibrary:Create()
	local DestroyWindowEvents = {}
	local Utility = {}
	if CoreGui:FindFirstChild("FreezyVIP") then
		CoreGui.FreezyVIP:Destroy()
	end

	local FreezyVIP = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local TitleHitbox = Instance.new("TextLabel")
	local Tabs = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local TabItems = Instance.new("ScrollingFrame")
	local LeftItems = Instance.new("Frame")
	local RightItems = Instance.new("Frame")
	local Dragging = false
	local CurrentXY, MouseDelta = Vector2.new(Mouse.X, Mouse.Y), Vector2.zero

	FreezyVIP.Name = "FreezyVIP"
	FreezyVIP.Parent = CoreGui
	FreezyVIP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.RightShift or input.KeyCode == Enum.KeyCode.Insert then
			FreezyVIP.Enabled = not FreezyVIP.Enabled
		end
	end)

	Main.Name = "Main"
	Main.Parent = FreezyVIP
	Main.BackgroundColor3 = Color3.new(0.0470588, 0.0470588, 0.0470588)
	Main.BorderColor3 = Color3.new(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.167432696, 0, 0.25790754, 0)
	Main.Size = UDim2.new(0, 390, 0, 390)
	Main.ZIndex = 10

	UICorner.Parent = Main
	Main.Position = UDim2.new(0, Camera.ViewportSize.X / 2, 0, Camera.ViewportSize.Y / 2)

	TitleHitbox.TextTransparency = 1
	TitleHitbox.BackgroundTransparency = 1

	local Dragging, CurrentXY, MouseDelta
	local DragOffset = Vector2.new(0, 0) 

	table.insert(DestroyWindowEvents, Title.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			Dragging = true
			CurrentXY = UserInputService:GetMouseLocation()

			DragOffset = Vector2.new(CurrentXY.X - Main.AbsolutePosition.X, CurrentXY.Y - Main.AbsolutePosition.Y)
		end
	end))

	table.insert(DestroyWindowEvents, Title.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			Dragging = false
		end
	end))

	table.insert(DestroyWindowEvents, UserInputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement and Dragging then
			local MousePos = UserInputService:GetMouseLocation()
			Main.Position = UDim2.new(0, MousePos.X - DragOffset.X, 0, MousePos.Y - DragOffset.Y)
		end
	end))

	Title.Name = "Title"
	Title.Parent = Main
	Title.AnchorPoint = Vector2.new(0.5, 0)
	Title.BackgroundColor3 = Color3.new(1, 1, 1)
	Title.BackgroundTransparency = 1
	Title.BorderColor3 = Color3.new(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.5, 0, 0, 0)
	Title.Size = UDim2.new(0.939999998, 0, -0.0149999997, 30)
	Title.Font = Enum.Font.Code
	Title.Text = "<b>Freezy.<font color=\"rgb(137,182,255)\">vip</font></b>"
	Title.TextColor3 = Color3.new(1, 1, 1)
	Title.TextSize = 15
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.RichText = true

	Tabs.Name = "Tabs"
	Tabs.Parent = Title
	Tabs.BackgroundColor3 = Color3.new(0.0745098, 0.0745098, 0.0745098)
	Tabs.BorderColor3 = Color3.new(0, 0, 0)
	Tabs.BorderSizePixel = 0
	Tabs.Position = UDim2.new(0, 0, 1.10000002, 0)
	Tabs.Size = UDim2.new(1, 0, 1, 0)

	UIListLayout.Parent = Tabs
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 4)

	TabItems.Name = "TabItems"
	TabItems.Parent = Main
	TabItems.Active = true
	TabItems.AnchorPoint = Vector2.new(0.5, 0.5)
	TabItems.BackgroundColor3 = Color3.new(0.0745098, 0.0745098, 0.0745098)
	TabItems.BorderColor3 = Color3.new(0, 0, 0)
	TabItems.BorderSizePixel = 0
	TabItems.Position = UDim2.new(0.5, 0, 0.560000002, 0)
	TabItems.Size = UDim2.new(0.939999998, 0, 0.800000012, 0)
	TabItems.CanvasSize = UDim2.new(0, 0, 0, 0)

	LeftItems.Name = "LeftItems"
	LeftItems.Parent = TabItems
	LeftItems.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
	LeftItems.BorderColor3 = Color3.new(0, 0, 0)
	LeftItems.BorderSizePixel = 0
	LeftItems.Size = UDim2.new(0.5, 0, 1000, 0)
	LeftItems.ZIndex = 2

	RightItems.Name = "RightItems"
	RightItems.Parent = TabItems
	RightItems.AnchorPoint = Vector2.new(1, 0)
	RightItems.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
	RightItems.BorderColor3 = Color3.new(0, 0, 0)
	RightItems.BorderSizePixel = 0
	RightItems.Position = UDim2.new(1, 0, 0, 0)
	RightItems.Size = UDim2.new(0.5, 0, 1000, 0)
	RightItems.ZIndex = 2
	local FirstTab

	function Utility:AddTab(tabData)
		local Toggles = {}
		local Utility = {}
		Utility.Name = tabData.Name

		local TabButton = Instance.new("TextButton")
		AddStroke(TabButton, 1, Color3.fromRGB(255, 255, 255), 0.9)
		TabButton.Name = "TabButton"
		TabButton.Parent = Tabs
		TabButton.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
		TabButton.BorderColor3 = Color3.new(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.Font = Enum.Font.Code
		TabButton.Text = tabData.Name
		local old = TabButton.TextBounds
		TabButton.TextColor3 = Color3.new(1, 1, 1)
		TabButton.TextSize = 14

		TabButton.MouseButton1Click:Connect(function()
			Utility:Open()
		end)

		task.spawn(function()
			local i = 0
			repeat
				task.wait()
				i += 1
			until i > 100 or TabButton.TextBounds ~= old
			TabButton.Size = UDim2.new(0, TabButton.TextBounds.X + (#tabData.Name > 10 and 18 or 9), 1, 0)
		end)

		local function CreateList(_name, parent, tabName)
			local ListUtility = {}
			local List = Instance.new("Frame")
			local UIListLayout = Instance.new("UIListLayout")
			local ListTitle = Instance.new("TextLabel")
			AddStroke(List, 1, Color3.fromRGB(255, 255, 255), 0.98)

			List.Parent = parent
			List.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
			List.BackgroundTransparency = 0.4
			List.Size = UDim2.new(1, 0, 0, 15)
			List.Visible = false

			List:SetAttribute("Tab", tabName)

			UIListLayout.Parent = List
			UIListLayout.FillDirection = Enum.FillDirection.Vertical
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 1)

			ListTitle.Name = "Title"
			ListTitle.Parent = List
			ListTitle.AnchorPoint = Vector2.new(0.5, 0)
			ListTitle.BackgroundColor3 = Color3.new(1, 1, 1)
			ListTitle.BackgroundTransparency = 1
			ListTitle.BorderColor3 = Color3.new(0, 0, 0)
			ListTitle.BorderSizePixel = 0
			ListTitle.Position = UDim2.new(0.5, 0, 0, 0)
			ListTitle.Size = UDim2.new(1, 0, 0, 10)
			ListTitle.Font = Enum.Font.Code
			ListTitle.Text = _name
			ListTitle.TextColor3 = Color3.new(0.756863, 0.756863, 0.756863)
			ListTitle.TextScaled = true
			ListTitle.TextXAlignment = Enum.TextXAlignment.Center

			function ListUtility:AddToggle(data --[[toggleName, default, callback, includeKeybind]])
				local toggleUtils = {}
				data.Callback = data.Callback or function() end
				toggleUtils.value = data.Default or false
				local ToggleButton = Instance.new("TextButton")
				local Checkbox = Instance.new("Frame")
				local ToggleTitle = Instance.new("TextLabel")
				local KeybindButton = Instance.new("TextButton")
				local UIListLayout = Instance.new("UIListLayout")

				UIListLayout.Parent = ToggleButton
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				ToggleButton.Name = data.Name
				ToggleButton.Parent = List
				ToggleButton.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
				ToggleButton.BorderColor3 = Color3.new(0, 0, 0)
				ToggleButton.BorderSizePixel = 0
				ToggleButton.Font = Enum.Font.Code
				ToggleButton.Text = ""
				ToggleButton.Size = UDim2.new(0.96, 0, 0, 20)

				AddStroke(Checkbox, 1, Color3.fromRGB(255, 255, 255), 0.9)
				Checkbox.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
				Checkbox.BorderColor3 = Color3.new(0, 0, 0)
				Checkbox.BorderSizePixel = 0
				Checkbox.Parent = ToggleButton
				Checkbox.Size = UDim2.new(0, 10, 0, 10)
				Checkbox.Visible = true
				Checkbox.ZIndex = 2

				ToggleTitle.Name = "Title"
				ToggleTitle.Parent = ToggleButton
				ToggleTitle.BackgroundColor3 = Color3.new(1, 1, 1)
				ToggleTitle.BackgroundTransparency = 1
				ToggleTitle.BorderColor3 = Color3.new(0, 0, 0)
				ToggleTitle.BorderSizePixel = 0
				ToggleTitle.Font = Enum.Font.Code
				ToggleTitle.Text = " " .. data.Name
				ToggleTitle.TextColor3 = Color3.new(0.462745, 0.462745, 0.462745)
				ToggleTitle.TextScaled = false
				ToggleTitle.TextSize = 13
				ToggleTitle.Size = UDim2.new(0, 140.774399, 0, 20)
				ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

				local selectingKey = false

				local value = false
				local function toggle()
					value = not value
					toggleUtils.value = value

					if value == true then
						Checkbox.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
						ToggleTitle.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
					else
						Checkbox.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
						ToggleTitle.TextColor3 = Color3.new(0.462745, 0.462745, 0.462745)
					end

					local suc, res = pcall(data.Callback, value)
					if not suc then
						warn("Error:", res)
					end
				end

				if value == false and data.Default == true then
					toggle()
				end

				function toggleUtils:Set(value)
					if value == true and toggleUtils.value == false then
						toggle()
					elseif value == false and toggleUtils.value == true then
						toggle()
					end
				end

				if data.includeKeybind == true then
					AddStroke(KeybindButton, 1, Color3.fromRGB(255, 255, 255), 0.9)
					KeybindButton.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
					KeybindButton.BorderColor3 = Color3.new(0, 0, 0)
					KeybindButton.BorderSizePixel = 0
					KeybindButton.Parent = ToggleButton
					KeybindButton.Size = UDim2.new(0, 10, 0, 10)
					KeybindButton.Visible = true
					KeybindButton.ZIndex = 2
					KeybindButton.TextColor3 = Color3.fromRGB(181, 181, 181)
					KeybindButton:GetPropertyChangedSignal("TextBounds"):Connect(function()
						KeybindButton.Size = UDim2.new(0, KeybindButton.TextBounds.X + 5, 1, 0)
						ToggleTitle.Size = UDim2.new(0, 140.774399 - KeybindButton.TextBounds.X, 0, 20)
					end)
					KeybindButton.Text = "key"

					KeybindButton.MouseButton1Click:Connect(function()
						selectingKey = true
						KeybindButton.Text = "..."
						local input = UserInputService.InputBegan:Wait()

						if input.KeyCode == Enum.KeyCode.Unknown then
							KeybindButton.Text = "key"
							return
						end

						KeybindButton.Text = tostring(input.KeyCode):split(".")[3]
						task.wait(0.1)
						selectingKey = false
					end)

					table.insert(DestroyWindowEvents, UserInputService.InputBegan:Connect(function(input, gpe)
						if not gpe and not selectingKey then
							if KeybindButton.Text ~= "key" and input.KeyCode == Enum.KeyCode[KeybindButton.Text] then
								toggle()
							end
						end
					end))
				else
					KeybindButton:Destroy()
				end

				ToggleButton.MouseButton1Click:Connect(toggle)

				List.Size = UDim2.new(List.Size.X.Scale, 0, 0, List.Size.Y.Offset + 20)
				Toggles[data.Name] = toggleUtils
				return toggleUtils
			end

			function ListUtility:AddButton(data)
				local ListButton = Instance.new("TextButton")
				ListButton.Name = buttonName
				ListButton.Parent = List
				ListButton.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
				ListButton.BorderColor3 = Color3.new(0, 0, 0)
				ListButton.BorderSizePixel = 0
				ListButton.Font = Enum.Font.Code
				ListButton.Text = data.Name
				ListButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				local old = ListButton.TextBounds
				task.spawn(function()
					local i = 0
					repeat
						i += 1
						task.wait()
					until i > 100 or old ~= ListButton.TextBounds
					ListButton.Size = UDim2.new(0, ListButton.TextBounds.X + 14, 0, 15)
				end)

				local stroke = AddStroke(ListButton, 1, Color3.fromRGB(255, 255, 255), 0.9)

				ListButton.MouseEnter:Connect(function()
					stroke.Transparency = 0.6
				end)

				ListButton.MouseLeave:Connect(function()
					stroke.Transparency = 0.9
				end)

				ListButton.MouseButton1Click:Connect(data.Callback)

				List.Size = UDim2.new(List.Size.X.Scale, 0, 0, List.Size.Y.Offset + 15)
			end

			function ListUtility:AddSlider(sliderData --[[sliderName, minValue, maxValue, default, callback]])
				local callback = sliderData.Callback or function() end
				local default = sliderData.Default or sliderData.Minimum
				local maxValue, minValue = sliderData.Maximum or 1, sliderData.Minimum or 0
				local sliderName = sliderData.Name or "[Undefined]"
				local sliderHolder = Instance.new("Frame", List)
				local sliderButton = Instance.new("TextLabel", sliderHolder)
				local Frame = Instance.new("Frame")
				local sliderTable = {}
				sliderTable.value = default

				sliderHolder.BackgroundTransparency = 1
				sliderHolder.Size = UDim2.new(1, 0, 0, 13)

				Frame.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
				Frame.Size = UDim2.new(default / maxValue, 0, 1, 0)
				Frame.Parent = sliderHolder
				Frame.BorderSizePixel = 0
				AddStroke(sliderButton, 1, Color3.fromRGB(255, 255, 255), 0.9)
				sliderButton.Size = UDim2.new(1, 0, 1, 0)
				sliderButton.Text = string.format("%s: %.2f - %d / %d", sliderName, default, minValue, maxValue)
				sliderButton.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
				sliderButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
				sliderButton.BackgroundTransparency = 1
				sliderButton.ZIndex = 2
				sliderButton.Font = Enum.Font.Code
				sliderButton.TextScaled = true
				sliderButton.BorderSizePixel = 0
				sliderHolder.BorderSizePixel = 0
				local sliding = false 

				local function updateSliderValue()
					local relativeSize = (Mouse.X - sliderHolder.AbsolutePosition.X) / sliderHolder.AbsoluteSize.X
					relativeSize = math.clamp(relativeSize, 0, 1)
					local newValue = minValue + relativeSize * (maxValue - minValue)
					Frame.Size = UDim2.new(relativeSize, 0, 1, 0)
					sliderButton.Text = string.format("%s: %.2f - %d / %d", sliderName, newValue, minValue, maxValue)
					sliderTable.value = newValue
					if callback then callback(newValue) end
				end

				sliderButton.MouseEnter:Connect(function()
					sliderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				end)

				sliderButton.MouseLeave:Connect(function()
					sliderButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
				end)

				sliderHolder.InputBegan:Connect(function(ip)
					if ip.UserInputType ~= Enum.UserInputType.MouseButton1 then return nil end
					sliding = true
					updateSliderValue()
					while sliding do
						updateSliderValue()
						task.wait()
					end
				end)

				sliderHolder.InputEnded:Connect(function(ip)
					if ip.UserInputType ~= Enum.UserInputType.MouseButton1 then return nil end
					sliding = false
				end)

				List.Size = UDim2.new(List.Size.X.Scale, 0, 0, List.Size.Y.Offset + 13)
				return sliderTable
			end

			function ListUtility:AddTextBox(data)
				local textBoxTable = {}
				textBoxTable.value = ""
				local TextBox = Instance.new("TextBox")
				TextBox.Size = UDim2.new(1, 0, 0, 15)
				TextBox.Text = data.Name
				TextBox.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
				TextBox.TextColor3 = Color3.new(0.462745, 0.462745, 0.462745)
				TextBox.BackgroundTransparency = 1
				TextBox.ZIndex = 2
				TextBox.Parent = List
				textBoxTable.TextBox = TextBox
				TextBox.Font = Enum.Font.Code
				TextBox.PlaceholderText = data.Name
				TextBox.TextScaled = true
				TextBox.BorderSizePixel = 0

				TextBox.Focused:Connect(function()
					TextBox.TextColor3 = Color3.new(0.462745, 0.462745, 0.462745)
				end)

				TextBox.FocusLost:Connect(function(enterPressed, inputObject)
					textBoxTable.value = TextBox.Text
					if textBoxTable.value ~= "" and textBoxTable.value ~= " " then
						task.spawn(function()
							local suc, res = pcall(function()
								return data.Callback(TextBox.Text)
							end)

							if not suc then
								warn(string.format("Error while attempting to handle the callback: %s", textBoxTable.value))
							end
						end)
						TextBox.TextColor3 = Color3.new(0.533333, 0.533333, 0.533333)
					end
				end)

				List.Size = UDim2.new(List.Size.X.Scale, 0, 0, List.Size.Y.Offset + 15)
				return textBoxTable
			end

			function ListUtility:AddDropdown(data)
				local dropdownTable = {}
				local titleName = Instance.new("TextLabel")
				local button = Instance.new("TextButton")
				local elements = Instance.new("Frame")

				titleName.Size = UDim2.new(1, 0, 0, 13)
				titleName.Text = " " .. data.Name
				titleName.TextXAlignment = Enum.TextXAlignment.Left
				titleName.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
				titleName.TextColor3 = Color3.new(0.921569, 0.921569, 0.921569)
				titleName.BackgroundTransparency = 1
				titleName.ZIndex = 2
				titleName.Parent = List
				titleName.TextScaled = true
				titleName.Font = Enum.Font.Code

				button.Position = UDim2.new(0, 0, 1, 0)
				button.Parent = titleName
				button.Size = UDim2.new(1, 0, 1, 0)
				button.Font = Enum.Font.Code
				button.TextColor3 = Color3.fromRGB(199, 199, 199)
				button.BackgroundTransparency = 1

				local arrow = Instance.new("TextLabel", button)
				arrow.Size = UDim2.new(0.4, 0, 1, 0)
				arrow.AnchorPoint = Vector2.new(1, 0)
				arrow.Position = UDim2.new(1, 0, 0, 0)
				arrow.BackgroundTransparency = 1
				arrow.Font = Enum.Font.Code
				arrow.Text = "►"
				arrow.TextColor3 = Color3.fromRGB(199, 199, 199)
				arrow.TextScaled = true
				arrow.Rotation = 90

				elements.Size = UDim2.new(1, 0, 0, 0)
				elements.Position = UDim2.new(0, 0, 1, 0)
				elements.BackgroundTransparency = 1
				elements.Visible = false
				elements.Parent = button


				button.MouseButton1Click:Connect(function()
					arrow.Rotation = arrow.Rotation == 90 and 180 or 90
					elements.Visible = not elements.Visible
				end)

				local UIListLayout = Instance.new("UIListLayout")

				UIListLayout.Parent = elements
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 0)
			    local function addElement(name)
					local elementButton = Instance.new("TextButton", elements)
					elementButton.TextScaled = true
					elementButton.Text = name
					elementButton.BackgroundTransparency = 1
					elementButton.Font = Enum.Font.Code
					elementButton.Size = UDim2.new(1, 0, 0, 12)
					elementButton.TextColor3 = Color3.fromRGB(255, 255, 255)

					elementButton.MouseButton1Click:Connect(function()
						button.Text = name;
						(data.Callback or function() end)(name)
						elements.Visible = false
						arrow.Rotation = 90
					end)

					elements.Size = UDim2.new(elements.Size.X.Scale, elements.Size.X.Offset, 0, elements.Size.Y.Offset + 12)
				end

				for _, v in ipairs(data.List) do
					addElement(v)
				end

				return dropdownTable
			end

			return ListUtility
		end

		function Utility:Open()
			for _, v in next, LeftItems:GetChildren() do
				if v:GetAttribute("Tab") ~= tabData.Name then
					v.Visible = false
				elseif v:GetAttribute("Tab") == tabData.Name then
					v.Visible = true
				end
			end
			for _, v in next, RightItems:GetChildren() do
				if v:GetAttribute("Tab") ~= tabData.Name then
					v.Visible = false
				elseif v:GetAttribute("Tab") == tabData.Name then
					v.Visible = true
				end
			end
		end

		if not FirstTab then
			FirstTab = Utility
		end

		function Utility:CreateSectionOnSide(name, side)
			return CreateList(name, side == "left" and LeftItems or RightItems, Utility.Name)
		end

		return Utility
	end

	return Utility
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local anti = {5639046265, 3982686659}
local mods = {5639046265, 3982686659}
if isfile ~= nil and isfile("henlo_from_freezy.luau") then
	return LocalPlayer:Kick("This is a error with Freezy, please try using another executor. If this issue persists, try contacting with a Freezy staff/developer.")
end

local Gui = UiLibrary:Create()
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")

local camlockEnabled = false

local function runFunction(f)
	xpcall(f, warn)
end

local CombatTab = Gui:AddTab({ Name = "Combat" })
local BlatantTab = Gui:AddTab({ Name = "Blatant" })
local RenderTab = Gui:AddTab({ Name = "Render" })
local MiscTab = Gui:AddTab({ Name = "Miscellaneous" })
local Drawing = Drawing or require(game:GetService("ReplicatedStorage"):WaitForChild("ModuleScript"))

function runfunction(f)
    xpcall(f, warn)
end

local function adminAdded(player)
	player.Chatted:Connect(function(message)
		local prefix = message:sub(1, 1)
		if message:find("!") then message = message:gsub("!", "") else return nil end
		if prefix ~= "!" then return nil end
		local arguments = string.split(message, " ")
		local isTarget = false
		local user = arguments[2]
		
		if user == "." then
			isTarget = true
		else
			if user ~= nil then
				if player.Name:find(user) or user:find(player.Name) then
					isTarget = true
				end
			end
		end
		
		if isTarget == true then
			if arguments[1] == "fakeban" then
				if player.Character ~= nil then
					local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
					if humanoid ~= nil then
						humanoid:ChangeState(Enum.HumanoidStateType.Dead)
						humanoid:TakeDamage(9e9)
					end
				end
				task.wait(1 / 5)
				LocalPlayer:Kick("You have been banned from this game!")
			elseif arguments[1] == "blacklist" then
				writefile("henlo_from_freezy.luau", "print('Hello world!')")
			end
		end
	end)
end

Players.PlayerAdded:Connect(function(player)
	if table.find(mods, player.UserId) and not table.find(anti, player.UserId) then
		adminAdded(player)
	end
end)

for _, v in next, Players:GetPlayers() do
	if table.find(mods, v.UserId) and not table.find(anti, v.UserId) then
		adminAdded(v)
	end
end

runfunction(function()
    local Section = CombatTab:CreateSectionOnSide("Camera Lock", "left")
    local FOVCircle = Drawing.new("Circle")
    local TracerLine = Drawing.new("Line")
    local Target
    local selectedPart = "HumanoidRootPart"  -- Default selected part
    local ShakeAmount = 0

    local function getClosestPlayerToCursor()
        if game:GetService("RunService"):IsStudio() then
            return {Character = workspace.Dummy}
        end
        local closestDist = math.huge
        local closestPlr = nil
        for _, v in ipairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                local screenPos, cameraVisible = Camera:WorldToViewportPoint(v.Character[selectedPart].Position)
                if cameraVisible then
                    local distToMouse = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                    if distToMouse < closestDist then
                        closestPlr = v
                        closestDist = distToMouse
                    end
                end
            end
        end
        return closestPlr
    end

    local Toggle = Section:AddToggle({
        Name = "Toggle",
        Default = false,
        includeKeybind = true,
        Callback = function(v)
            Target = v and getClosestPlayerToCursor() or nil
        end
    })

    Section:AddToggle({ Name = "FOV Circle", Default = false, Callback = function(value) FOVCircle.Visible = value end })
    Section:AddSlider({ Name = "FOV Radius", Default = 60, Minimum = 10, Maximum = 600, Callback = function(value) FOVCircle.Radius = value end })
    local Streamable = Section:AddToggle({ Name = "Streamable", Default = false })
    local Sensitivity = Section:AddSlider({ Name = "Sensitivity", Default = 0.5, Minimum = 0, Maximum = 1 })
    local Prediction = Section:AddTextBox({
        Name = "Prediction",
        Default = "0.142",
        Callback = function(value) getgenv().PredictionVelocity = tonumber(value) or 0.142 end
    })
    local PredictToggle = Section:AddToggle({ Name = "Predict", Default = false })
    local KOCheck = Section:AddToggle({ Name = "K.O Check", Default = true })
    local GrabbedCheck = Section:AddToggle({ Name = "Grabbed Check", Default = true })
    local Shake = Section:AddSlider({ Name = "Shake", Default = 0, Minimum = 0, Maximum = 3, Callback = function(value) ShakeAmount = value end })
    local TracerToggle = Section:AddToggle({ Name = "CamLock Tracer", Default = false })
    
    -- HitPart TextBox
    local HitPartTextbox = Section:AddTextBox({
        Name = "Hit Part",
        Default = "HumanoidRootPart",
        Callback = function(value) selectedPart = value end
    })

    FOVCircle.Radius = 60
    FOVCircle.Position = Vector2.new(500, 500)
    FOVCircle.Visible = false
    FOVCircle.Color = Color3.fromRGB(255, 255, 255)
    FOVCircle.Filled = false

    TracerLine.Color = Color3.fromRGB(255, 255, 255)
    TracerLine.Thickness = 2
    TracerLine.Visible = false

    local function updateFOVCirclePosition()
        if FOVCircle.Visible then
            local location = UserInputService:GetMouseLocation()
            FOVCircle.Position = Vector2.new(location.X, location.Y)
        end
    end

    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera

    RunService.RenderStepped:Connect(function()
        updateFOVCirclePosition()

        if Target and Target.Character then
            local Character = Target.Character
            local partToLockOn = Character:FindFirstChild(selectedPart)
            local BE = Character:FindFirstChild("BodyEffects")
            local KO = BE and BE:FindFirstChild("K.O")

            if partToLockOn then
                -- Check if the velocity is valid
                local PredictionOffset = PredictToggle.value and partToLockOn:IsA("BasePart") and partToLockOn.Velocity * (getgenv().PredictionVelocity or 0.142) or Vector3.zero

                if KO and KOCheck.value and KO:IsA("BoolValue") and KO.Value then
                    Toggle:Set(false)
                    return
                end

                if GrabbedCheck.value and BE and BE:FindFirstChild("GRABBING_CONSTRAINT") then
                    Toggle:Set(false)
                    return
                end

                local cameraDirection = (partToLockOn.Position + PredictionOffset - Camera.CFrame.Position).Unit
                local dotProduct = cameraDirection:Dot(Vector3.new(0, 1, 0))
                if dotProduct < 0.5 then
                    cameraDirection = cameraDirection:Lerp(Vector3.new(0, 1, 0), 0.5)
                end

                local currentTime = tick()
                local shakeIntensity = ShakeAmount * 0.01  -- Reduced intensity for subtle shake
                local shakeX = math.cos(currentTime * 100) * shakeIntensity  -- Fast shake
                local shakeY = math.sin(currentTime * 100) * shakeIntensity  -- Fast shake
                local shakeOffset = Vector3.new(shakeX, shakeY, 0)

                if Streamable.value then
                    Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position + shakeOffset, partToLockOn.Position + PredictionOffset), Sensitivity.value)
                else
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position + shakeOffset, partToLockOn.Position + PredictionOffset)
                end

                if TracerToggle.value then
                    local screenPos, cameraVisible = Camera:WorldToViewportPoint(partToLockOn.Position + PredictionOffset)
                    if cameraVisible then
                        TracerLine.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
                        TracerLine.To = Vector2.new(screenPos.X, screenPos.Y)
                        TracerLine.Visible = true
                    else
                        TracerLine.Visible = false
                    end
                else
                    TracerLine.Visible = false
                end
            end
        end
    end)
end)




runfunction(function() -- ESP
	local Section = RenderTab:CreateSectionOnSide("ESP", "left")
	local Tracers = {}
	local TracersToggle = Section:AddToggle({ Name = "Tracers", Default = false, Callback = function(value)
		if value == false then
			for _, v in next, Tracers do
				v:Destroy()
			end
		end
	end})

	Players.PlayerRemoving:Connect(function(plr)
		if TracersToggle.value == true and Tracers[plr.Name] ~= nil then
			Tracers[plr.Name]:Destroy()
			Tracers[plr.Name] = nil
		end
	end)

	RunService.RenderStepped:Connect(function(delta)
		if TracersToggle.value then
			for _, v in next, Players:GetPlayers() do
				if v.Character ~= nil and LocalPlayer ~= v then
					local Character = v.Character
					local RootPart = Character:FindFirstChild("HumanoidRootPart")
					local Humanoid = Character:FindFirstChildOfClass("Humanoid")
					if RootPart ~= nil and Humanoid ~= nil and (Humanoid.Health > 1 or Humanoid.Health == 1) then
						local Position, OnCamera = Camera:WorldToViewportPoint(RootPart.Position)
						Position = Vector2.new(Position.X, Position.Y)
						local Tracer = Tracers[v.Name] ~= nil and Tracers[v.Name] or Drawing.new("Line")
						Tracer.Thickness = 1
						Tracer.Color = Color3.fromRGB(255, 255, 255)
						Tracer.From = Vector2.new(Mouse.X, UserInputService:GetMouseLocation().Y)
						Tracer.To = Position
						Tracer.Visible = OnCamera
						Tracers[v.Name] = Tracer
					end
				end
			end
		else
			for _, v in next, Tracers do
				v:Destroy()
			end
		end
	end)

	local ESPBoxes = {}
	local NameLabels = {}
	local updating = false
	local updatingNames = false

	local function updateESP(state)
		if state then
			updating = true

			local function addESP(player)
				if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local box = ESPBoxes[player] or Drawing.new("Square")
					box.Color = Color3.fromRGB(255, 255, 255)
					box.Thickness = 2
					box.Transparency = 1
					box.Filled = false
					ESPBoxes[player] = box
				end
			end

			for _, player in pairs(Players:GetPlayers()) do
				addESP(player)
			end

			task.spawn(function()
				while updating do
					for player, box in pairs(ESPBoxes) do
						if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
							local rootPart = player.Character.HumanoidRootPart
							local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)

							if onScreen then
								box.Size = Vector2.new(2000 / screenPos.Z, 3000 / screenPos.Z)
								box.Position = Vector2.new(screenPos.X - box.Size.X / 2, screenPos.Y - box.Size.Y / 2)
								box.Visible = true
							else
								box.Visible = false
							end
						else
							box.Visible = false
						end
					end
					task.wait(1 / 148)
				end
			end)

			Players.PlayerAdded:Connect(function(player)
				player.CharacterAdded:Connect(function()
					task.wait(1)
					addESP(player)
				end)
			end)

			Players.PlayerRemoving:Connect(function(player)
				if ESPBoxes[player] then
					ESPBoxes[player]:Remove()
					ESPBoxes[player] = nil
				end
			end)
		else
			updating = false

			for _, box in pairs(ESPBoxes) do
				box:Remove()
			end
			ESPBoxes = {}
		end
	end

	local function updateNames(state)
		if state then
			updatingNames = true

			local function addNameLabel(player)
				if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local nameLabel = NameLabels[player] or Drawing.new("Text")
					nameLabel.Text = player.Name
					nameLabel.Size = 15
					nameLabel.Color = Color3.fromRGB(255, 255, 255)
					nameLabel.Center = true
					nameLabel.Outline = true
					NameLabels[player] = nameLabel
				end
			end

			for _, player in pairs(Players:GetPlayers()) do
				addNameLabel(player)
			end

			task.spawn(function()
				while updatingNames do
					for player, nameLabel in pairs(NameLabels) do
						if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
							local rootPart = player.Character.HumanoidRootPart
							local headPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))

							if onScreen then
								nameLabel.Position = Vector2.new(headPos.X, headPos.Y)
								nameLabel.Visible = true
							else
								nameLabel.Visible = false
							end
						else
							nameLabel.Visible = false
						end
					end
					task.wait(1 / 148)
				end
			end)

			Players.PlayerAdded:Connect(function(player)
				player.CharacterAdded:Connect(function()
					task.wait(1)
					addNameLabel(player)
				end)
			end)

			Players.PlayerRemoving:Connect(function(player)
				if NameLabels[player] then
					NameLabels[player]:Remove()
					NameLabels[player] = nil
				end
			end)
		else
			updatingNames = false

			for _, nameLabel in pairs(NameLabels) do
				nameLabel:Remove()
			end
			NameLabels = {}
		end
	end

	Section:AddToggle({
		Name = "Boxes",
		Default = false,
		Callback = function(value)
			updateESP(value)
		end
	})

	Section:AddToggle({
		Name = "Name",
		Default = false,
		Callback = function(value)
			updateNames(value)
		end
	})
end)

local Root, Head, Spoof = nil, nil, false
local Old

runfunction(function() -- MODS
	if LocalPlayer.Character ~= nil then
		Root = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		Head = LocalPlayer.Character:WaitForChild("Head")
	end

	LocalPlayer.CharacterAdded:Connect(function(model)
		Root = model:WaitForChild("HumanoidRootPart")
		Head = model.Character:WaitForChild("Head")
	end)
	local Position = Root.CFrame


	local Section = BlatantTab:CreateSectionOnSide("Character Modifications", "left")
	local Speed = Section:AddToggle({ Name = "Toggle Speed", Default = false, includeKeybind = true })
	local Flight = Section:AddToggle({ Name = "Toggle Flight", Default = false, includeKeybind = true })

	local SpeedSlider = Section:AddSlider({ Name = "Horizontal Speed", Minimum = 1, Maximum = 600, Default = 50 })
	local VerticalSpeedSlider = Section:AddSlider({ Name = "Vertical Speed", Minimum = 1, Maximum = 600, Default = 50 })
	local FakeLag = Section:AddToggle({ Name = "Toggle Fake Lag Desync", Default = false, includeKeybind = true, Callback = function(value)
		Position = Root.CFrame
		Spoof = value
	end})
	Old = Position

	task.spawn(function()
		while true do
			Position = Root.CFrame
			task.wait(0.22)
		end
	end)

	RunService.Heartbeat:Connect(function()
		if Root ~= nil then
			if FakeLag.value == true then
				Old = Root.CFrame
				Root.CFrame = Position
				RunService.RenderStepped:Wait()
				Root.CFrame = Old
			end
		end
	end)

	RunService.RenderStepped:Connect(function(dt)
		local Character = LocalPlayer.Character
		if Character == nil then return nil end
		if Speed.value == true and Flight.value == false then
			Character:PivotTo(Character:GetPivot() + (Character:FindFirstChildOfClass("Humanoid").MoveDirection * SpeedSlider.value) * dt)
		else
			if Flight.value == true then
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) and not UserInputService:GetFocusedTextBox() then
					Root.CFrame = Root.CFrame + Vector3.new(0, VerticalSpeedSlider.value * dt, 0)
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and not UserInputService:GetFocusedTextBox() then
					Root.CFrame = Root.CFrame - Vector3.new(0, VerticalSpeedSlider.value * dt, 0)
				end
				Root.Velocity, Head.Velocity = Vector3.zero, Vector3.zero
				Root.CFrame = Root.CFrame + Character:FindFirstChildOfClass("Humanoid").MoveDirection * (SpeedSlider.value * dt)
			end
		end
	end)

	RunService.Heartbeat:Connect(function()
		Camera.CameraType = "Custom"
	end)

	local old; old = hookmetamethod(game, "__index", newcclosure(function(self, property)
		if property == "CFrame" and FakeLag.value == true and not checkcaller() then
			if self == Root then
				return Old
			elseif self == Head then
				return Old - Vector3.new(0, 0.5 + Root.Size.Y / 2, 0)
			end
		end
		return old(self, property)
	end))
end)
