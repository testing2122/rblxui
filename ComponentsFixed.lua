local components = {};
local tweenserv = game:GetService("TweenService");
local userinput = game:GetService("UserInputService");

local ColorWheel = loadstring(game:HttpGet("https://raw.githubusercontent.com/testing2122/rblxui/main/ColorWheel.lua"))();

-- // color scheme with toggle off state
local clrs = {
    bg = Color3.fromRGB(6, 6, 8),
    secondary = Color3.fromRGB(12, 12, 15),
    accent = Color3.fromRGB(20, 20, 25),
    pink = Color3.fromRGB(255, 105, 180),
    red = Color3.fromRGB(255, 80, 80),
    darkpink = Color3.fromRGB(200, 80, 140),
    lightpink = Color3.fromRGB(255, 150, 200),
    white = Color3.fromRGB(255, 255, 255),
    grey = Color3.fromRGB(120, 120, 125),
    darkgrey = Color3.fromRGB(80, 80, 85),
    separator = Color3.fromRGB(35, 35, 40),
    toggleoff = Color3.fromRGB(80, 80, 85)
};

-- // store all UI elements for theme updates with their states
local uiElements = {
    toggles = {}, -- {element, label, button, circle, enabled}
    buttons = {},
    sliders = {}, -- {fill, handle, valueLabel}
    inputs = {},
    texts = {}, -- {element, colorType}
    backgrounds = {},
    accents = {},
    pinks = {},
    secondaries = {},
    separators = {},
    strokes = {},
    scrollbars = {},
    colorwheels = {} -- New array for color wheels
};

function components:AddColorWheel(parent, cfg)
    local cfg = cfg or {};
    local name = cfg.Name or "Color Picker";
    local desc = cfg.Description or "";
    local default = cfg.Default or Color3.fromRGB(255, 105, 180);
    local callback = cfg.Callback or function() end;
    local separator = cfg.Separator;
    
    local wheelframe = Instance.new("Frame");
    wheelframe.Name = name;
    wheelframe.Size = UDim2.new(1, 0, 0, desc ~= "" and 285 or 265); -- Increased height for better visibility
    wheelframe.BackgroundTransparency = 1;
    wheelframe.BorderSizePixel = 0;
    wheelframe.LayoutOrder = #parent:GetChildren();
    wheelframe.Parent = parent;
    
    -- // color wheel label
    local wheellbl = Instance.new("TextLabel");
    wheellbl.Size = UDim2.new(1, -60, 0, 20);
    wheellbl.Position = UDim2.new(0, 0, 0, 5);
    wheellbl.BackgroundTransparency = 1;
    wheellbl.Text = name;
    wheellbl.TextColor3 = clrs.white;
    wheellbl.TextSize = 14;
    wheellbl.Font = Enum.Font.GothamMedium;
    wheellbl.TextXAlignment = Enum.TextXAlignment.Left;
    wheellbl.Parent = wheelframe;
    
    registerElement(wheellbl, "texts", "white");
    
    -- // description
    if desc ~= "" then
        local desclbl = Instance.new("TextLabel");
        desclbl.Size = UDim2.new(1, 0, 0, 15);
        desclbl.Position = UDim2.new(0, 0, 0, 25);
        desclbl.BackgroundTransparency = 1;
        desclbl.Text = desc;
        desclbl.TextColor3 = clrs.grey;
        desclbl.TextSize = 12;
        desclbl.Font = Enum.Font.Gotham;
        desclbl.TextXAlignment = Enum.TextXAlignment.Left;
        desclbl.Parent = wheelframe;
        
        registerElement(desclbl, "texts", "grey");
    end;
    
    -- Create color wheel with adjusted size and position
    local colorWheel = ColorWheel:Create(wheelframe, {
        Size = 200, -- Increased size for better visibility
        Default = default,
        Callback = callback
    });
    
    -- Center the color wheel in the frame
    colorWheel.Frame.Position = UDim2.new(0.5, -100, 0, desc ~= "" and 45 or 25); -- Centered horizontally
    colorWheel.Frame.BackgroundTransparency = 0; -- Make sure it's visible
    colorWheel.Frame.ZIndex = 10; -- Ensure it's above other elements
    
    -- Register color wheel for theme updates
    table.insert(uiElements.colorwheels, colorWheel);
    
    -- // add separator if requested
    if separator then
        self:AddSeparator(parent, separator == true and {} or separator);
    end;
    
    return {
        SetColor = function(color)
            colorWheel.SetColor(color);
        end,
        GetColor = function()
            return colorWheel.GetColor();
        end
    };
end;

-- Rest of the components code remains unchanged...