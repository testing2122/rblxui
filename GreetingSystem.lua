-- // Pink UI Greeting System Component
local GreetingSystem = {};
local tweenserv = game:GetService("TweenService");
local runserv = game:GetService("RunService");
local players = game:GetService("Players");

local plr = players.LocalPlayer;

-- // Configuration for easy toggling
GreetingSystem.Config = {
    freemode = true,
    premiummode = false
};

-- // Rainbow colors for premium animation
local rainbowColors = {
    Color3.fromRGB(255, 0, 0),     -- Red
    Color3.fromRGB(255, 127, 0),   -- Orange
    Color3.fromRGB(255, 255, 0),   -- Yellow
    Color3.fromRGB(0, 255, 0),     -- Green
    Color3.fromRGB(0, 0, 255),     -- Blue
    Color3.fromRGB(75, 0, 130),    -- Indigo
    Color3.fromRGB(148, 0, 211),   -- Violet
};

-- // Get time-based greeting
local function getGreeting()
    local currentTime = os.date("*t");
    local hour = currentTime.hour;
    
    if hour >= 5 and hour < 12 then
        return "Good Morning";
    elseif hour >= 12 and hour < 17 then
        return "Good Afternoon";
    elseif hour >= 17 and hour < 21 then
        return "Good Evening";
    else
        return "Good Night";
    end;
end;

-- // Create greeting display
function GreetingSystem:CreateGreeting(parent, colors)
    local clrs = colors or {
        pink = Color3.fromRGB(255, 105, 180),
        white = Color3.fromRGB(255, 255, 255),
        grey = Color3.fromRGB(120, 120, 125),
        secondary = Color3.fromRGB(12, 12, 15),
        green = Color3.fromRGB(0, 255, 100)
    };
    
    -- // Main greeting container
    local greetingFrame = Instance.new("Frame");
    greetingFrame.Name = "GreetingContainer";
    greetingFrame.Size = UDim2.new(0, 320, 0, 80);
    greetingFrame.Position = UDim2.new(0, 15, 1, -95);
    greetingFrame.BackgroundColor3 = clrs.secondary;
    greetingFrame.BackgroundTransparency = 0.1;
    greetingFrame.BorderSizePixel = 0;
    greetingFrame.Parent = parent;
    
    local greetingCorner = Instance.new("UICorner");
    greetingCorner.CornerRadius = UDim.new(0, 12);
    greetingCorner.Parent = greetingFrame;
    
    local greetingStroke = Instance.new("UIStroke");
    greetingStroke.Color = clrs.pink;
    greetingStroke.Thickness = 1;
    greetingStroke.Transparency = 0.6;
    greetingStroke.Parent = greetingFrame;
    
    -- // Avatar image
    local avatarFrame = Instance.new("Frame");
    avatarFrame.Size = UDim2.new(0, 50, 0, 50);
    avatarFrame.Position = UDim2.new(0, 15, 0.5, -25);
    avatarFrame.BackgroundColor3 = clrs.secondary;
    avatarFrame.BorderSizePixel = 0;
    avatarFrame.Parent = greetingFrame;
    
    local avatarCorner = Instance.new("UICorner");
    avatarCorner.CornerRadius = UDim.new(0, 25);
    avatarCorner.Parent = avatarFrame;
    
    local avatarImage = Instance.new("ImageLabel");
    avatarImage.Size = UDim2.new(1, 0, 1, 0);
    avatarImage.Position = UDim2.new(0, 0, 0, 0);
    avatarImage.BackgroundTransparency = 1;
    avatarImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. plr.UserId .. "&width=150&height=150&format=png";
    avatarImage.Parent = avatarFrame;
    
    local avatarImageCorner = Instance.new("UICorner");
    avatarImageCorner.CornerRadius = UDim.new(0, 25);
    avatarImageCorner.Parent = avatarImage;
    
    -- // Greeting text
    local greetingText = Instance.new("TextLabel");
    greetingText.Size = UDim2.new(1, -80, 0, 25);
    greetingText.Position = UDim2.new(0, 75, 0, 8);
    greetingText.BackgroundTransparency = 1;
    greetingText.Text = getGreeting() .. ", " .. plr.DisplayName;
    greetingText.TextColor3 = clrs.white;
    greetingText.TextSize = 16;
    greetingText.Font = Enum.Font.GothamBold;
    greetingText.TextXAlignment = Enum.TextXAlignment.Left;
    greetingText.Parent = greetingFrame;
    
    -- // Status text (Premium/Free)
    local statusText = Instance.new("TextLabel");
    statusText.Size = UDim2.new(1, -80, 0, 20);
    statusText.Position = UDim2.new(0, 75, 0, 35);
    statusText.BackgroundTransparency = 1;
    statusText.TextSize = 14;
    statusText.Font = Enum.Font.Gotham;
    statusText.TextXAlignment = Enum.TextXAlignment.Left;
    statusText.Parent = greetingFrame;
    
    -- // Update status display
    local function updateStatus()
        if GreetingSystem.Config.premiummode then
            statusText.Text = "Premium User";
            -- Start rainbow animation
            spawn(function()
                local colorIndex = 1;
                while GreetingSystem.Config.premiummode and statusText.Parent do
                    statusText.TextColor3 = rainbowColors[colorIndex];
                    colorIndex = colorIndex + 1;
                    if colorIndex > #rainbowColors then
                        colorIndex = 1;
                    end;
                    wait(0.3);
                end;
            end);
        else
            statusText.Text = "Free User";
            statusText.TextColor3 = clrs.green;
        end;
    end;
    
    -- // Initial status update
    updateStatus();
    
    -- // Update greeting every minute
    spawn(function()
        while greetingFrame.Parent do
            wait(60);
            if greetingText.Parent then
                greetingText.Text = getGreeting() .. ", " .. plr.DisplayName;
            end;
        end;
    end);
    
    -- // Store references for theme updates
    local greetingElements = {
        frame = greetingFrame,
        stroke = greetingStroke,
        greetingText = greetingText,
        statusText = statusText,
        avatarFrame = avatarFrame
    };
    
    -- // Toggle functions
    function GreetingSystem:TogglePremium()
        GreetingSystem.Config.premiummode = true;
        GreetingSystem.Config.freemode = false;
        updateStatus();
    end;
    
    function GreetingSystem:ToggleFree()
        GreetingSystem.Config.freemode = true;
        GreetingSystem.Config.premiummode = false;
        updateStatus();
    end;
    
    return greetingElements;
end;

-- // Apply theme to greeting elements
function GreetingSystem:ApplyTheme(greetingElements, newColors)
    if not greetingElements then return; end;
    
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
    
    if greetingElements.frame then
        tweenserv:Create(greetingElements.frame, tweenInfo, {BackgroundColor3 = newColors.secondary}):Play();
    end;
    
    if greetingElements.stroke then
        tweenserv:Create(greetingElements.stroke, tweenInfo, {Color = newColors.pink}):Play();
    end;
    
    if greetingElements.greetingText then
        tweenserv:Create(greetingElements.greetingText, tweenInfo, {TextColor3 = newColors.white}):Play();
    end;
    
    if greetingElements.avatarFrame then
        tweenserv:Create(greetingElements.avatarFrame, tweenInfo, {BackgroundColor3 = newColors.secondary}):Play();
    end;
    
    -- Update status color if free mode
    if GreetingSystem.Config.freemode and greetingElements.statusText then
        tweenserv:Create(greetingElements.statusText, tweenInfo, {TextColor3 = newColors.green or Color3.fromRGB(0, 255, 100)}):Play();
    end;
end;

return GreetingSystem;