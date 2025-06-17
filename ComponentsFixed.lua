local components = {};
local tweenserv = game:GetService("TweenService");
local userinput = game:GetService("UserInputService");

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
    scrollbars = {}
};

-- // ENHANCED theme application function with comprehensive UI coverage
function components:ApplyTheme(newTheme)
    -- Update color table
    for key, value in pairs(newTheme) do
        clrs[key] = value;
    end;
    
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out);
    
    -- Update toggles with proper state handling
    for _, toggleData in pairs(uiElements.toggles) do
        if toggleData.button and toggleData.button.Parent then
            local enabled = toggleData.enabled;
            if enabled then
                tweenserv:Create(toggleData.button, tweenInfo, {BackgroundColor3 = clrs.pink}):Play();
                tweenserv:Create(toggleData.label, tweenInfo, {TextColor3 = clrs.white}):Play();
            else
                tweenserv:Create(toggleData.button, tweenInfo, {BackgroundColor3 = clrs.accent}):Play();
                tweenserv:Create(toggleData.label, tweenInfo, {TextColor3 = clrs.toggleoff}):Play();
            end;
        end;
    end;
    
    -- Update sliders
    for _, sliderData in pairs(uiElements.sliders) do
        if sliderData.fill and sliderData.fill.Parent then
            tweenserv:Create(sliderData.fill, tweenInfo, {BackgroundColor3 = clrs.pink}):Play();
        end;
        if sliderData.valueLabel and sliderData.valueLabel.Parent then
            tweenserv:Create(sliderData.valueLabel, tweenInfo, {TextColor3 = clrs.pink}):Play();
        end;
    end;
    
    -- Update backgrounds
    for _, element in pairs(uiElements.backgrounds) do
        if element and element.Parent then
            tweenserv:Create(element, tweenInfo, {BackgroundColor3 = clrs.bg}):Play();
        end;
    end;
    
    -- Update accents
    for _, element in pairs(uiElements.accents) do
        if element and element.Parent then
            tweenserv:Create(element, tweenInfo, {BackgroundColor3 = clrs.accent}):Play();
        end;
    end;
    
    -- Update pink elements
    for _, element in pairs(uiElements.pinks) do
        if element and element.Parent then
            tweenserv:Create(element, tweenInfo, {BackgroundColor3 = clrs.pink}):Play();
        end;
    end;
    
    -- Update secondary elements
    for _, element in pairs(uiElements.secondaries) do
        if element and element.Parent then
            tweenserv:Create(element, tweenInfo, {BackgroundColor3 = clrs.secondary}):Play();
        end;
    end;
    
    -- Update separators
    for _, element in pairs(uiElements.separators) do
        if element and element.Parent then
            tweenserv:Create(element, tweenInfo, {BackgroundColor3 = clrs.separator}):Play();
        end;
    end;
    
    -- Update text colors with proper type handling
    for _, data in pairs(uiElements.texts) do
        if data.element and data.element.Parent then
            local newColor;
            if data.colorType == "white" then
                newColor = clrs.white;
            elseif data.colorType == "grey" then
                newColor = clrs.grey;
            elseif data.colorType == "pink" then
                newColor = clrs.pink;
            elseif data.colorType == "toggleoff" then
                newColor = clrs.toggleoff;
            else
                newColor = clrs.white;
            end;
            tweenserv:Create(data.element, tweenInfo, {TextColor3 = newColor}):Play();
        end;
    end;
    
    -- Update strokes
    for _, element in pairs(uiElements.strokes) do
        if element and element.Parent then
            tweenserv:Create(element, tweenInfo, {Color = clrs.separator}):Play();
        end;
    end;
    
    -- Update scrollbars
    for _, element in pairs(uiElements.scrollbars) do
        if element and element.Parent then
            tweenserv:Create(element, tweenInfo, {ScrollBarImageColor3 = clrs.pink}):Play();
        end;
    end;
    
    print("🎨 Enhanced theme applied successfully! All UI elements updated.");
end;

-- // helper function to register UI elements
local function registerElement(element, category, colorType)
    if category == "texts" then
        table.insert(uiElements[category], {element = element, colorType = colorType or "white"});
    else
        table.insert(uiElements[category], element);
    end;
end;

-- // tween configs
local twinfo = {
    fast = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
    med = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
    slow = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
};

local function createtween(obj, info, props)
    return tweenserv:Create(obj, info, props);
end;

-- // add separator function
function components:AddSeparator(parent, cfg)
    local cfg = cfg or {};
    local height = cfg.Height or 15;
    local color = cfg.Color or clrs.separator;
    local transparency = cfg.Transparency or 0;
    
    local sepframe = Instance.new("Frame");
    sepframe.Name = "Separator";
    sepframe.Size = UDim2.new(1, 0, 0, height);
    sepframe.BackgroundTransparency = 1;
    sepframe.BorderSizePixel = 0;
    sepframe.LayoutOrder = #parent:GetChildren();
    sepframe.Parent = parent;
    
    local sepline = Instance.new("Frame");
    sepline.Size = UDim2.new(1, -20, 0, 1);
    sepline.Position = UDim2.new(0, 10, 0.5, 0);
    sepline.BackgroundColor3 = color;
    sepline.BackgroundTransparency = transparency;
    sepline.BorderSizePixel = 0;
    sepline.Parent = sepframe;
    
    registerElement(sepline, "separators");
    
    local sepcorner = Instance.new("UICorner");
    sepcorner.CornerRadius = UDim.new(0, 1);
    sepcorner.Parent = sepline;
    
    return sepframe;
end;

-- // add components to box content
function components:AddToggle(parent, cfg)
    local cfg = cfg or {};
    local name = cfg.Name or "Toggle";
    local desc = cfg.Description or "";
    local default = cfg.Default or false;
    local callback = cfg.Callback or function() end;
    local separator = cfg.Separator;
    
    local toggleframe = Instance.new("Frame");
    toggleframe.Name = name;
    toggleframe.Size = UDim2.new(1, 0, 0, desc ~= "" and 65 or 45);
    toggleframe.BackgroundTransparency = 1;
    toggleframe.BorderSizePixel = 0;
    toggleframe.LayoutOrder = #parent:GetChildren();
    toggleframe.Parent = parent;
    
    -- // toggle label with conditional color
    local togglelbl = Instance.new("TextLabel");
    togglelbl.Size = UDim2.new(1, -60, 0, 20);
    togglelbl.Position = UDim2.new(0, 0, 0, 5);
    togglelbl.BackgroundTransparency = 1;
    togglelbl.Text = name;
    togglelbl.TextColor3 = default and clrs.white or clrs.toggleoff;
    togglelbl.TextSize = 14;
    togglelbl.Font = Enum.Font.GothamMedium;
    togglelbl.TextXAlignment = Enum.TextXAlignment.Left;
    togglelbl.Parent = toggleframe;
    
    registerElement(togglelbl, "texts", default and "white" or "toggleoff");
    
    -- // description
    if desc ~= "" then
        local desclbl = Instance.new("TextLabel");
        desclbl.Size = UDim2.new(1, -60, 0, 15);
        desclbl.Position = UDim2.new(0, 0, 0, 25);
        desclbl.BackgroundTransparency = 1;
        desclbl.Text = desc;
        desclbl.TextColor3 = clrs.grey;
        desclbl.TextSize = 12;
        desclbl.Font = Enum.Font.Gotham;
        desclbl.TextXAlignment = Enum.TextXAlignment.Left;
        desclbl.Parent = toggleframe;
        
        registerElement(desclbl, "texts", "grey");
    end;
    
    -- // toggle switch
    local togglebtn = Instance.new("TextButton");
    togglebtn.Size = UDim2.new(0, 45, 0, 22);
    togglebtn.Position = UDim2.new(1, -45, 0, 5);
    togglebtn.BackgroundColor3 = default and clrs.pink or clrs.accent;
    togglebtn.BorderSizePixel = 0;
    togglebtn.Text = "";
    togglebtn.Parent = toggleframe;
    
    registerElement(togglebtn, default and "pinks" or "accents");
    
    local togglecorner = Instance.new("UICorner");
    togglecorner.CornerRadius = UDim.new(0, 11);
    togglecorner.Parent = togglebtn;
    
    -- // toggle circle
    local togglecircle = Instance.new("Frame");
    togglecircle.Size = UDim2.new(0, 18, 0, 18);
    togglecircle.Position = default and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9);
    togglecircle.BackgroundColor3 = clrs.white;
    togglecircle.BorderSizePixel = 0;
    togglecircle.Parent = togglebtn;
    
    local circlecorner = Instance.new("UICorner");
    circlecorner.CornerRadius = UDim.new(0, 9);
    circlecorner.Parent = togglecircle;
    
    local enabled = default;
    
    -- Register toggle for theme updates
    local toggleData = {
        button = togglebtn,
        label = togglelbl,
        circle = togglecircle,
        enabled = enabled
    };
    table.insert(uiElements.toggles, toggleData);
    
    togglebtn.MouseButton1Click:Connect(function()
        enabled = not enabled;
        toggleData.enabled = enabled; -- Update stored state
        
        if enabled then
            createtween(togglebtn, twinfo.med, {BackgroundColor3 = clrs.pink}):Play();
            createtween(togglecircle, twinfo.med, {Position = UDim2.new(1, -20, 0.5, -9)}):Play();
            createtween(togglelbl, twinfo.med, {TextColor3 = clrs.white}):Play();
        else
            createtween(togglebtn, twinfo.med, {BackgroundColor3 = clrs.accent}):Play();
            createtween(togglecircle, twinfo.med, {Position = UDim2.new(0, 2, 0.5, -9)}):Play();
            createtween(togglelbl, twinfo.med, {TextColor3 = clrs.toggleoff}):Play();
        end;
        
        callback(enabled);
    end);
    
    -- // add separator if requested
    if separator then
        self:AddSeparator(parent, separator == true and {} or separator);
    end;
    
    return {
        SetValue = function(value)
            enabled = value;
            toggleData.enabled = enabled; -- Update stored state
            if enabled then
                createtween(togglebtn, twinfo.med, {BackgroundColor3 = clrs.pink}):Play();
                createtween(togglecircle, twinfo.med, {Position = UDim2.new(1, -20, 0.5, -9)}):Play();
                createtween(togglelbl, twinfo.med, {TextColor3 = clrs.white}):Play();
            else
                createtween(togglebtn, twinfo.med, {BackgroundColor3 = clrs.accent}):Play();
                createtween(togglecircle, twinfo.med, {Position = UDim2.new(0, 2, 0.5, -9)}):Play();
                createtween(togglelbl, twinfo.med, {TextColor3 = clrs.toggleoff}):Play();
            end;
        end,
        GetValue = function()
            return enabled;
        end
    };
end;

function components:AddButton(parent, cfg)
    local cfg = cfg or {};
    local name = cfg.Name or "Button";
    local desc = cfg.Description or "";
    local callback = cfg.Callback or function() end;
    local separator = cfg.Separator;
    
    local btnframe = Instance.new("Frame");
    btnframe.Name = name;
    btnframe.Size = UDim2.new(1, 0, 0, desc ~= "" and 65 or 45);
    btnframe.BackgroundTransparency = 1;
    btnframe.BorderSizePixel = 0;
    btnframe.LayoutOrder = #parent:GetChildren();
    btnframe.Parent = parent;
    
    -- // button
    local btn = Instance.new("TextButton");
    btn.Size = UDim2.new(1, 0, 0, 35);
    btn.Position = UDim2.new(0, 0, 0, desc ~= "" and 25 or 5);
    btn.BackgroundColor3 = clrs.accent;
    btn.BorderSizePixel = 0;
    btn.Text = name;
    btn.TextColor3 = clrs.white;
    btn.TextSize = 14;
    btn.Font = Enum.Font.GothamMedium;
    btn.Parent = btnframe;
    
    registerElement(btn, "accents");
    registerElement(btn, "texts", "white");
    
    local btncorner = Instance.new("UICorner");
    btncorner.CornerRadius = UDim.new(0, 8);
    btncorner.Parent = btn;
    
    -- // description
    if desc ~= "" then
        local desclbl = Instance.new("TextLabel");
        desclbl.Size = UDim2.new(1, 0, 0, 15);
        desclbl.Position = UDim2.new(0, 0, 0, 5);
        desclbl.BackgroundTransparency = 1;
        desclbl.Text = desc;
        desclbl.TextColor3 = clrs.grey;
        desclbl.TextSize = 12;
        desclbl.Font = Enum.Font.Gotham;
        desclbl.TextXAlignment = Enum.TextXAlignment.Left;
        desclbl.Parent = btnframe;
        
        registerElement(desclbl, "texts", "grey");
    end;
    
    -- // button states
    local ishovered = false;
    local ispressed = false;
    
    btn.MouseEnter:Connect(function()
        ishovered = true;
        if not ispressed then
            createtween(btn, twinfo.fast, {BackgroundColor3 = clrs.pink, TextColor3 = clrs.white}):Play();
        end;
    end);
    
    btn.MouseLeave:Connect(function()
        ishovered = false;
        if not ispressed then
            createtween(btn, twinfo.fast, {BackgroundColor3 = clrs.accent, TextColor3 = clrs.white}):Play();
        end;
    end);
    
    btn.MouseButton1Down:Connect(function()
        ispressed = true;
        createtween(btn, twinfo.fast, {BackgroundColor3 = clrs.darkpink}):Play();
    end);
    
    btn.MouseButton1Up:Connect(function()
        ispressed = false;
        if ishovered then
            createtween(btn, twinfo.fast, {BackgroundColor3 = clrs.pink}):Play();
        else
            createtween(btn, twinfo.fast, {BackgroundColor3 = clrs.accent}):Play();
        end;
    end);
    
    btn.MouseButton1Click:Connect(function()
        callback();
    end);
    
    -- // add separator if requested
    if separator then
        self:AddSeparator(parent, separator == true and {} or separator);
    end;
    
    return btn;
end;

function components:AddSlider(parent, cfg)
    local cfg = cfg or {};
    local name = cfg.Name or "Slider";
    local desc = cfg.Description or "";
    local min = cfg.Min or 0;
    local max = cfg.Max or 100;
    local default = cfg.Default or min;
    local increment = cfg.Increment or 1;
    local callback = cfg.Callback or function() end;
    local separator = cfg.Separator;
    
    local sliderframe = Instance.new("Frame");
    sliderframe.Name = name;
    sliderframe.Size = UDim2.new(1, 0, 0, desc ~= "" and 75 or 55);
    sliderframe.BackgroundTransparency = 1;
    sliderframe.BorderSizePixel = 0;
    sliderframe.LayoutOrder = #parent:GetChildren();
    sliderframe.Parent = parent;
    
    -- // slider label
    local sliderlbl = Instance.new("TextLabel");
    sliderlbl.Size = UDim2.new(1, -60, 0, 20);
    sliderlbl.Position = UDim2.new(0, 0, 0, 5);
    sliderlbl.BackgroundTransparency = 1;
    sliderlbl.Text = name;
    sliderlbl.TextColor3 = clrs.white;
    sliderlbl.TextSize = 14;
    sliderlbl.Font = Enum.Font.GothamMedium;
    sliderlbl.TextXAlignment = Enum.TextXAlignment.Left;
    sliderlbl.Parent = sliderframe;
    
    registerElement(sliderlbl, "texts", "white");
    
    -- // value label
    local valuelbl = Instance.new("TextLabel");
    valuelbl.Size = UDim2.new(0, 60, 0, 20);
    valuelbl.Position = UDim2.new(1, -60, 0, 5);
    valuelbl.BackgroundTransparency = 1;
    valuelbl.Text = tostring(default);
    valuelbl.TextColor3 = clrs.pink;
    valuelbl.TextSize = 14;
    valuelbl.Font = Enum.Font.GothamBold;
    valuelbl.TextXAlignment = Enum.TextXAlignment.Right;
    valuelbl.Parent = sliderframe;
    
    registerElement(valuelbl, "texts", "pink");
    
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
        desclbl.Parent = sliderframe;
        
        registerElement(desclbl, "texts", "grey");
    end;
    
    -- // slider track
    local slidertrack = Instance.new("Frame");
    slidertrack.Size = UDim2.new(1, 0, 0, 6);
    slidertrack.Position = UDim2.new(0, 0, 1, desc ~= "" and -15 or -10);
    slidertrack.BackgroundColor3 = clrs.accent;
    slidertrack.BorderSizePixel = 0;
    slidertrack.Parent = sliderframe;
    
    registerElement(slidertrack, "accents");
    
    local trackcorner = Instance.new("UICorner");
    trackcorner.CornerRadius = UDim.new(0, 3);
    trackcorner.Parent = slidertrack;
    
    -- // slider fill
    local sliderfill = Instance.new("Frame");
    sliderfill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0);
    sliderfill.Position = UDim2.new(0, 0, 0, 0);
    sliderfill.BackgroundColor3 = clrs.pink;
    sliderfill.BorderSizePixel = 0;
    sliderfill.Parent = slidertrack;
    
    registerElement(sliderfill, "pinks");
    
    local fillcorner = Instance.new("UICorner");
    fillcorner.CornerRadius = UDim.new(0, 3);
    fillcorner.Parent = sliderfill;
    
    -- // slider handle
    local sliderhandle = Instance.new("Frame");
    sliderhandle.Size = UDim2.new(0, 16, 0, 16);
    sliderhandle.Position = UDim2.new((default - min) / (max - min), -8, 0.5, -8);
    sliderhandle.BackgroundColor3 = clrs.white;
    sliderhandle.BorderSizePixel = 0;
    sliderhandle.Parent = slidertrack;
    
    local handlecorner = Instance.new("UICorner");
    handlecorner.CornerRadius = UDim.new(0, 8);
    handlecorner.Parent = sliderhandle;
    
    -- Register slider for theme updates
    local sliderData = {
        fill = sliderfill,
        handle = sliderhandle,
        valueLabel = valuelbl
    };
    table.insert(uiElements.sliders, sliderData);
    
    local value = default;
    local dragging = false;
    
    local function updateslider(input)
        local pos = math.clamp((input.Position.X - slidertrack.AbsolutePosition.X) / slidertrack.AbsoluteSize.X, 0, 1);
        value = math.floor((min + (max - min) * pos) / increment + 0.5) * increment;
        value = math.clamp(value, min, max);
        
        local fillsize = (value - min) / (max - min);
        createtween(sliderfill, twinfo.fast, {Size = UDim2.new(fillsize, 0, 1, 0)}):Play();
        createtween(sliderhandle, twinfo.fast, {Position = UDim2.new(fillsize, -8, 0.5, -8)}):Play();
        
        valuelbl.Text = tostring(value);
        callback(value);
    end;
    
    slidertrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true;
            updateslider(input);
        end;
    end);
    
    userinput.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateslider(input);
        end;
    end);
    
    userinput.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false;
        end;
    end);
    
    -- // add separator if requested
    if separator then
        self:AddSeparator(parent, separator == true and {} or separator);
    end;
    
    return {
        SetValue = function(newvalue)
            value = math.clamp(newvalue, min, max);
            local fillsize = (value - min) / (max - min);
            createtween(sliderfill, twinfo.fast, {Size = UDim2.new(fillsize, 0, 1, 0)}):Play();
            createtween(sliderhandle, twinfo.fast, {Position = UDim2.new(fillsize, -8, 0.5, -8)}):Play();
            valuelbl.Text = tostring(value);
        end,
        GetValue = function()
            return value;
        end
    };
end;

function components:AddInput(parent, cfg)
    local cfg = cfg or {};
    local name = cfg.Name or "Input";
    local desc = cfg.Description or "";
    local placeholder = cfg.Placeholder or "Enter text...";
    local default = cfg.Default or "";
    local callback = cfg.Callback or function() end;
    local separator = cfg.Separator;
    
    local inputframe = Instance.new("Frame");
    inputframe.Name = name;
    inputframe.Size = UDim2.new(1, 0, 0, desc ~= "" and 75 or 55);
    inputframe.BackgroundTransparency = 1;
    inputframe.BorderSizePixel = 0;
    inputframe.LayoutOrder = #parent:GetChildren();
    inputframe.Parent = parent;
    
    -- // input label
    local inputlbl = Instance.new("TextLabel");
    inputlbl.Size = UDim2.new(1, 0, 0, 20);
    inputlbl.Position = UDim2.new(0, 0, 0, 5);
    inputlbl.BackgroundTransparency = 1;
    inputlbl.Text = name;
    inputlbl.TextColor3 = clrs.white;
    inputlbl.TextSize = 14;
    inputlbl.Font = Enum.Font.GothamMedium;
    inputlbl.TextXAlignment = Enum.TextXAlignment.Left;
    inputlbl.Parent = inputframe;
    
    registerElement(inputlbl, "texts", "white");
    
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
        desclbl.Parent = inputframe;
        
        registerElement(desclbl, "texts", "grey");
    end;
    
    -- // input box
    local inputbox = Instance.new("TextBox");
    inputbox.Size = UDim2.new(1, 0, 0, 30);
    inputbox.Position = UDim2.new(0, 0, 1, desc ~= "" and -35 or -30);
    inputbox.BackgroundColor3 = clrs.accent;
    inputbox.BorderSizePixel = 0;
    inputbox.Text = default;
    inputbox.PlaceholderText = placeholder;
    inputbox.TextColor3 = clrs.white;
    inputbox.PlaceholderColor3 = clrs.grey;
    inputbox.TextSize = 13;
    inputbox.Font = Enum.Font.Gotham;
    inputbox.TextXAlignment = Enum.TextXAlignment.Left;
    inputbox.ClearTextOnFocus = false;
    inputbox.Parent = inputframe;
    
    registerElement(inputbox, "accents");
    registerElement(inputbox, "texts", "white");
    
    local inputcorner = Instance.new("UICorner");
    inputcorner.CornerRadius = UDim.new(0, 6);
    inputcorner.Parent = inputbox;
    
    local inputpad = Instance.new("UIPadding");
    inputpad.PaddingLeft = UDim.new(0, 12);
    inputpad.PaddingRight = UDim.new(0, 12);
    inputpad.Parent = inputbox;
    
    inputbox.Focused:Connect(function()
        createtween(inputbox, twinfo.fast, {BackgroundColor3 = clrs.secondary}):Play();
    end);
    
    inputbox.FocusLost:Connect(function()
        createtween(inputbox, twinfo.fast, {BackgroundColor3 = clrs.accent}):Play();
        callback(inputbox.Text);
    end);
    
    -- // add separator if requested
    if separator then
        self:AddSeparator(parent, separator == true and {} or separator);
    end;
    
    return {
        SetValue = function(text)
            inputbox.Text = text;
        end,
        GetValue = function()
            return inputbox.Text;
        end
    };
end;

function components:AddDropdown(parent, cfg)
    local cfg = cfg or {};
    local name = cfg.Name or "Dropdown";
    local desc = cfg.Description or "";
    local options = cfg.Options or {"Option 1", "Option 2", "Option 3"};
    local default = cfg.Default or options[1];
    local callback = cfg.Callback or function() end;
    local separator = cfg.Separator;
    
    local dropframe = Instance.new("Frame");
    dropframe.Name = name;
    dropframe.Size = UDim2.new(1, 0, 0, desc ~= "" and 75 or 55);
    dropframe.BackgroundTransparency = 1;
    dropframe.BorderSizePixel = 0;
    dropframe.LayoutOrder = #parent:GetChildren();
    dropframe.Parent = parent;
    
    -- // dropdown label
    local droplbl = Instance.new("TextLabel");
    droplbl.Size = UDim2.new(1, 0, 0, 20);
    droplbl.Position = UDim2.new(0, 0, 0, 5);
    droplbl.BackgroundTransparency = 1;
    droplbl.Text = name;
    droplbl.TextColor3 = clrs.white;
    droplbl.TextSize = 14;
    droplbl.Font = Enum.Font.GothamMedium;
    droplbl.TextXAlignment = Enum.TextXAlignment.Left;
    droplbl.Parent = dropframe;
    
    registerElement(droplbl, "texts", "white");
    
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
        desclbl.Parent = dropframe;
        
        registerElement(desclbl, "texts", "grey");
    end;
    
    -- // dropdown button
    local dropbtn = Instance.new("TextButton");
    dropbtn.Size = UDim2.new(1, 0, 0, 30);
    dropbtn.Position = UDim2.new(0, 0, 1, desc ~= "" and -35 or -30);
    dropbtn.BackgroundColor3 = clrs.accent;
    dropbtn.BorderSizePixel = 0;
    dropbtn.Text = default;
    dropbtn.TextColor3 = clrs.white;
    dropbtn.TextSize = 13;
    dropbtn.Font = Enum.Font.Gotham;
    dropbtn.TextXAlignment = Enum.TextXAlignment.Left;
    dropbtn.Parent = dropframe;
    
    registerElement(dropbtn, "accents");
    registerElement(dropbtn, "texts", "white");
    
    local dropcorner = Instance.new("UICorner");
    dropcorner.CornerRadius = UDim.new(0, 6);
    dropcorner.Parent = dropbtn;
    
    local droppad = Instance.new("UIPadding");
    droppad.PaddingLeft = UDim.new(0, 12);
    droppad.PaddingRight = UDim.new(0, 30);
    droppad.Parent = dropbtn;
    
    -- // dropdown arrow
    local droparrow = Instance.new("TextLabel");
    droparrow.Size = UDim2.new(0, 20, 1, 0);
    droparrow.Position = UDim2.new(1, -25, 0, 0);
    droparrow.BackgroundTransparency = 1;
    droparrow.Text = "▼";
    droparrow.TextColor3 = clrs.grey;
    droparrow.TextSize = 10;
    droparrow.Font = Enum.Font.Gotham;
    droparrow.Parent = dropbtn;
    
    registerElement(droparrow, "texts", "grey");
    
    -- // dropdown list
    local droplist = Instance.new("ScrollingFrame");
    droplist.Size = UDim2.new(1, 0, 0, math.min(#options * 30, 120));
    droplist.Position = UDim2.new(0, 0, 1, 5);
    droplist.BackgroundColor3 = clrs.secondary;
    droplist.BorderSizePixel = 0;
    droplist.ScrollBarThickness = 2;
    droplist.ScrollBarImageColor3 = clrs.pink;
    droplist.ScrollBarImageTransparency = 0.8;
    droplist.CanvasSize = UDim2.new(0, 0, 0, #options * 30);
    droplist.Visible = false;
    droplist.Parent = dropbtn;
    
    registerElement(droplist, "secondaries");
    registerElement(droplist, "scrollbars"); -- // Register dropdown scrollbar for theme updates
    
    local listcorner = Instance.new("UICorner");
    listcorner.CornerRadius = UDim.new(0, 6);
    listcorner.Parent = droplist;
    
    local listlayout = Instance.new("UIListLayout");
    listlayout.SortOrder = Enum.SortOrder.LayoutOrder;
    listlayout.Parent = droplist;
    
    local selected = default;
    local isopen = false;
    
    -- // create option buttons
    for i, option in ipairs(options) do
        local optionbtn = Instance.new("TextButton");
        optionbtn.Size = UDim2.new(1, 0, 0, 30);
        optionbtn.BackgroundColor3 = option == selected and clrs.accent or Color3.new(0, 0, 0);
        optionbtn.BackgroundTransparency = option == selected and 0 or 1;
        optionbtn.BorderSizePixel = 0;
        optionbtn.Text = option;
        optionbtn.TextColor3 = clrs.white;
        optionbtn.TextSize = 12;
        optionbtn.Font = Enum.Font.Gotham;
        optionbtn.TextXAlignment = Enum.TextXAlignment.Left;
        optionbtn.LayoutOrder = i;
        optionbtn.Parent = droplist;
        
        registerElement(optionbtn, "texts", "white");
        
        local optionpad = Instance.new("UIPadding");
        optionpad.PaddingLeft = UDim.new(0, 12);
        optionpad.Parent = optionbtn;
        
        optionbtn.MouseEnter:Connect(function()
            if option ~= selected then
                createtween(optionbtn, twinfo.fast, {BackgroundColor3 = clrs.accent, BackgroundTransparency = 0.5}):Play();
            end;
        end);
        
        optionbtn.MouseLeave:Connect(function()
            if option ~= selected then
                createtween(optionbtn, twinfo.fast, {BackgroundTransparency = 1}):Play();
            end;
        end);
        
        optionbtn.MouseButton1Click:Connect(function()
            selected = option;
            dropbtn.Text = option;
            
            -- Update selection visuals
            for _, child in pairs(droplist:GetChildren()) do
                if child:IsA("TextButton") then
                    if child.Text == selected then
                        createtween(child, twinfo.fast, {BackgroundColor3 = clrs.accent, BackgroundTransparency = 0}):Play();
                    else
                        createtween(child, twinfo.fast, {BackgroundTransparency = 1}):Play();
                    end;
                end;
            end;
            
            -- Close dropdown
            isopen = false;
            createtween(droplist, twinfo.fast, {Size = UDim2.new(1, 0, 0, 0)}):Play();
            createtween(droparrow, twinfo.fast, {Rotation = 0}):Play();
            wait(0.25);
            droplist.Visible = false;
            
            callback(selected);
        end);
    end;
    
    -- // dropdown toggle
    dropbtn.MouseButton1Click:Connect(function()
        isopen = not isopen;
        if isopen then
            droplist.Visible = true;
            createtween(droplist, twinfo.fast, {Size = UDim2.new(1, 0, 0, math.min(#options * 30, 120))}):Play();
            createtween(droparrow, twinfo.fast, {Rotation = 180}):Play();
        else
            createtween(droplist, twinfo.fast, {Size = UDim2.new(1, 0, 0, 0)}):Play();
            createtween(droparrow, twinfo.fast, {Rotation = 0}):Play();
            wait(0.25);
            droplist.Visible = false;
        end;
    end);
    
    -- // add separator if requested
    if separator then
        self:AddSeparator(parent, separator == true and {} or separator);
    end;
    
    return {
        SetValue = function(value)
            if table.find(options, value) then
                selected = value;
                dropbtn.Text = value;
                
                -- Update selection visuals
                for _, child in pairs(droplist:GetChildren()) do
                    if child:IsA("TextButton") then
                        if child.Text == selected then
                            createtween(child, twinfo.fast, {BackgroundColor3 = clrs.accent, BackgroundTransparency = 0}):Play();
                        else
                            createtween(child, twinfo.fast, {BackgroundTransparency = 1}):Play();
                        end;
                    end;
                end;
            end;
        end,
        GetValue = function()
            return selected;
        end,
        SetOptions = function(newoptions)
            options = newoptions;
            
            -- Clear existing options
            for _, child in pairs(droplist:GetChildren()) do
                if child:IsA("TextButton") then
                    child:Destroy();
                end;
            end;
            
            -- Create new options
            for i, option in ipairs(options) do
                local optionbtn = Instance.new("TextButton");
                optionbtn.Size = UDim2.new(1, 0, 0, 30);
                optionbtn.BackgroundColor3 = option == selected and clrs.accent or Color3.new(0, 0, 0);
                optionbtn.BackgroundTransparency = option == selected and 0 or 1;
                optionbtn.BorderSizePixel = 0;
                optionbtn.Text = option;
                optionbtn.TextColor3 = clrs.white;
                optionbtn.TextSize = 12;
                optionbtn.Font = Enum.Font.Gotham;
                optionbtn.TextXAlignment = Enum.TextXAlignment.Left;
                optionbtn.LayoutOrder = i;
                optionbtn.Parent = droplist;
                
                local optionpad = Instance.new("UIPadding");
                optionpad.PaddingLeft = UDim.new(0, 12);
                optionpad.Parent = optionbtn;
                
                optionbtn.MouseButton1Click:Connect(function()
                    selected = option;
                    dropbtn.Text = option;
                    callback(selected);
                end);
            end;
            
            droplist.CanvasSize = UDim2.new(0, 0, 0, #options * 30);
        end
    };
end;

function components:AddLabel(parent, cfg)
    local cfg = cfg or {};
    local text = cfg.Text or "Label";
    local size = cfg.Size or 14;
    local color = cfg.Color or clrs.white;
    local separator = cfg.Separator;
    
    local labelframe = Instance.new("Frame");
    labelframe.Name = "Label";
    labelframe.Size = UDim2.new(1, 0, 0, 25);
    labelframe.BackgroundTransparency = 1;
    labelframe.BorderSizePixel = 0;
    labelframe.LayoutOrder = #parent:GetChildren();
    labelframe.Parent = parent;
    
    local label = Instance.new("TextLabel");
    label.Size = UDim2.new(1, 0, 1, 0);
    label.Position = UDim2.new(0, 0, 0, 0);
    label.BackgroundTransparency = 1;
    label.Text = text;
    label.TextColor3 = color;
    label.TextSize = size;
    label.Font = Enum.Font.Gotham;
    label.TextXAlignment = Enum.TextXAlignment.Left;
    label.TextWrapped = true;
    label.Parent = labelframe;
    
    registerElement(label, "texts", "white");
    
    -- // add separator if requested
    if separator then
        self:AddSeparator(parent, separator == true and {} or separator);
    end;
    
    return {
        SetText = function(newtext)
            label.Text = newtext;
        end,
        SetColor = function(newcolor)
            label.TextColor3 = newcolor;
        end
    };
end;

-- // return the components module
return components;