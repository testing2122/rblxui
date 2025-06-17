local clrwheel = {};
local tweenserv = game:GetService("TweenService");
local runserv = game:GetService("RunService");
local userinput = game:GetService("UserInputService");

local function hsvtorgb(h, s, v)
    local r, g, b;
    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
    
    i = i % 6;
    
    if i == 0 then r, g, b = v, t, p;
    elseif i == 1 then r, g, b = q, v, p;
    elseif i == 2 then r, g, b = p, v, t;
    elseif i == 3 then r, g, b = p, q, v;
    elseif i == 4 then r, g, b = t, p, v;
    elseif i == 5 then r, g, b = v, p, q;
    end;
    
    return Color3.new(r, g, b);
end;

local function rgbtohsv(clr)
    local r, g, b = clr.R, clr.G, clr.B;
    local max, min = math.max(r, g, b), math.min(r, g, b);
    local h, s, v;
    
    v = max;
    local d = max - min;
    
    if max == 0 then
        s = 0;
    else
        s = d / max;
    end;
    
    if max == min then
        h = 0;
    else
        if max == r then
            h = (g - b) / d;
            if g < b then h = h + 6; end;
        elseif max == g then
            h = (b - r) / d + 2;
        elseif max == b then
            h = (r - g) / d + 4;
        end;
        h = h / 6;
    end;
    
    return h, s, v;
end;

function clrwheel:Create(parent, config)
    config = config or {};
    local size = config.Size or 150;
    local callback = config.Callback or function() end;
    local default = config.Default or Color3.fromRGB(255, 105, 180);
    
    local frame = Instance.new("Frame");
    frame.Size = UDim2.new(0, size + 60, 0, size + 40);
    frame.BackgroundTransparency = 1;
    frame.Parent = parent;
    
    local wheel = Instance.new("ImageLabel");
    wheel.Size = UDim2.new(0, size, 0, size);
    wheel.Position = UDim2.new(0, 0, 0, 0);
    wheel.BackgroundTransparency = 1;
    wheel.Image = "http://www.roblox.com/asset/?id=6020299385"; -- Updated to use a reliable color wheel image
    wheel.Parent = frame;
    
    local marker = Instance.new("Frame");
    marker.Size = UDim2.new(0, 10, 0, 10);
    marker.AnchorPoint = Vector2.new(0.5, 0.5);
    marker.BackgroundColor3 = Color3.new(1, 1, 1);
    marker.BorderSizePixel = 0;
    marker.Parent = wheel;
    
    local markeroutline = Instance.new("UIStroke");
    markeroutline.Thickness = 2;
    markeroutline.Color = Color3.new(0, 0, 0);
    markeroutline.Parent = marker;
    
    local valueslider = Instance.new("Frame");
    valueslider.Size = UDim2.new(0, 15, 0, size);
    valueslider.Position = UDim2.new(0, size + 10, 0, 0);
    valueslider.BackgroundColor3 = Color3.new(1, 1, 1);
    valueslider.BorderSizePixel = 0;
    valueslider.Parent = frame;
    
    local valuegradient = Instance.new("UIGradient");
    valuegradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
    });
    valuegradient.Rotation = 90;
    valuegradient.Parent = valueslider;
    
    local valuemarker = Instance.new("Frame");
    valuemarker.Size = UDim2.new(1.5, 0, 0, 4);
    valuemarker.AnchorPoint = Vector2.new(0.5, 0.5);
    valuemarker.Position = UDim2.new(0.5, 0, 0, 0);
    valuemarker.BackgroundColor3 = Color3.new(0, 0, 0);
    valuemarker.BorderSizePixel = 0;
    valuemarker.Parent = valueslider;
    
    local preview = Instance.new("Frame");
    preview.Size = UDim2.new(0, size + 25, 0, 25);
    preview.Position = UDim2.new(0, 0, 1, 10);
    preview.BackgroundColor3 = default;
    preview.BorderSizePixel = 0;
    preview.Parent = frame;
    
    local previewcorner = Instance.new("UICorner");
    previewcorner.CornerRadius = UDim.new(0, 4);
    previewcorner.Parent = preview;
    
    local h, s, v = rgbtohsv(default);
    local currenthue = h;
    local currentsat = s;
    local currentval = v;
    
    local function updatecolor()
        local clr = hsvtorgb(currenthue, currentsat, currentval);
        preview.BackgroundColor3 = clr;
        valuegradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, hsvtorgb(currenthue, currentsat, 1)),
            ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
        });
        callback(clr);
    end;
    
    local function updatemarker()
        local angle = currenthue * math.pi * 2;
        local radius = currentsat * (size / 2);
        marker.Position = UDim2.new(0.5, math.cos(angle) * radius, 0.5, math.sin(angle) * radius);
        valuemarker.Position = UDim2.new(0.5, 0, 1 - currentval, 0);
    end;
    
    local wheeldrag = false;
    local valuedrag = false;
    
    wheel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            wheeldrag = true;
        end;
    end);
    
    valueslider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            valuedrag = true;
        end;
    end);
    
    userinput.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            wheeldrag = false;
            valuedrag = false;
        end;
    end);
    
    runserv.RenderStepped:Connect(function()
        if wheeldrag then
            local mouse = userinput:GetMouseLocation();
            local wheelcenter = wheel.AbsolutePosition + wheel.AbsoluteSize / 2;
            local delta = mouse - wheelcenter;
            
            currenthue = (math.atan2(delta.Y, delta.X) / (math.pi * 2) + 0.5) % 1;
            currentsat = math.min(1, delta.Magnitude / (size / 2));
            
            updatemarker();
            updatecolor();
        elseif valuedrag then
            local mouse = userinput:GetMouseLocation();
            local relative = (mouse.Y - valueslider.AbsolutePosition.Y) / valueslider.AbsoluteSize.Y;
            currentval = 1 - math.clamp(relative, 0, 1);
            
            updatemarker();
            updatecolor();
        end;
    end);
    
    updatemarker();
    updatecolor();
    
    return {
        GetColor = function()
            return preview.BackgroundColor3;
        end,
        SetColor = function(clr)
            h, s, v = rgbtohsv(clr);
            currenthue = h;
            currentsat = s;
            currentval = v;
            updatemarker();
            updatecolor();
        end
    };
end;

return clrwheel;