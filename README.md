# Pink UI Library v2.0 🌸

A modern, sleek UI library for Roblox with beautiful themes and smooth animations.

## ✨ Features

- **Box System**: Create scrollable boxes in left/right columns
- **Theme System**: 8 beautiful color themes with smooth transitions
- **Animated Gradient Title**: Toggle with the "G" button
- **Modern Design**: Clean, responsive layout
- **Rich Components**: Toggles, sliders, buttons, inputs, dropdowns, labels
- **Easy to Use**: Simple API with customizable options

## 🚀 Quick Start

```lua
-- Load the libraries
local PinkUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/testing2122/roblox-pink-ui-lib/main/PinkUIFixed.lua"))();
local Components = loadstring(game:HttpGet("https://raw.githubusercontent.com/testing2122/roblox-pink-ui-lib/main/ComponentsFixed.lua"))();
local Themes = loadstring(game:HttpGet("https://raw.githubusercontent.com/testing2122/roblox-pink-ui-lib/main/Themes.lua"))();

-- Create window
local Window = PinkUI:CreateWindow({
    Title = "My Script",
    Subtitle = "v1.0",
    TitleGradient = true
});

-- Create tab
local MainTab = Window:CreateTab({
    Name = "Main",
    Icon = "🏠"
});

-- Create boxes in columns
local LeftBox = MainTab:CreateBox({
    Name = "Features",
    Column = "left",
    Height = 300
});

local RightBox = MainTab:CreateBox({
    Name = "Settings", 
    Column = "right",
    Height = 250
});

-- Add components to boxes
Components:AddToggle(LeftBox, {
    Name = "Auto Farm",
    Description = "Automatically farm resources",
    Default = false,
    Callback = function(value)
        print("Auto Farm:", value);
    end
});

Components:AddSlider(RightBox, {
    Name = "Speed",
    Min = 1,
    Max = 100,
    Default = 16,
    Callback = function(value)
        print("Speed:", value);
    end
});
```

## 🎨 Theme System

Apply any of the 8 built-in themes:

```lua
-- Apply a theme (changes ALL UI elements)
local function applyTheme(themeName)
    local selectedTheme = Themes:GetTheme(themeName);
    if selectedTheme then
        PinkUI:ApplyTheme(selectedTheme);      -- Updates window, tabs, boxes
        Components:ApplyTheme(selectedTheme);  -- Updates components
        print("Applied", themeName, "theme!");
    end;
end;

-- Available themes
applyTheme("Blue");     -- Blue color scheme
applyTheme("Purple");   -- Purple color scheme  
applyTheme("Green");    -- Green color scheme
applyTheme("Orange");   -- Orange color scheme
applyTheme("Red");      -- Red color scheme
applyTheme("Dark");     -- Monochrome theme
applyTheme("Cyan");     -- Cyan color scheme
applyTheme("Pink");     -- Default pink theme
```

## 📦 Box System

The new box system allows you to create organized, scrollable containers:

```lua
local MyBox = tab:CreateBox({
    Name = "Box Title",        -- Box header text
    Column = "left",           -- "left" or "right" column  
    Height = 300               -- Box height in pixels
});
```

### Box Features

- **Left/Right Columns**: Position boxes in either column
- **Custom Heights**: Set any height for each box
- **Scrollable Content**: Boxes scroll when content overflows
- **Multiple Boxes**: Stack multiple boxes in the same column
- **Theme Support**: All borders and colors change with themes

## 🎛️ Components

All components are added directly to boxes:

### Toggle
```lua
Components:AddToggle(box, {
    Name = "Feature Name",
    Description = "Optional description",
    Default = false,
    Callback = function(value) end
});
```

### Slider
```lua
Components:AddSlider(box, {
    Name = "Slider Name", 
    Min = 0,
    Max = 100,
    Default = 50,
    Increment = 1,
    Callback = function(value) end
});
```

### Button
```lua
Components:AddButton(box, {
    Name = "Button Text",
    Description = "Optional description",
    Callback = function() end
});
```

### Input
```lua
Components:AddInput(box, {
    Name = "Input Name",
    Placeholder = "Enter text...",
    Default = "",
    Callback = function(text) end
});
```

### Dropdown
```lua
Components:AddDropdown(box, {
    Name = "Dropdown Name",
    Options = {"Option 1", "Option 2", "Option 3"},
    Default = "Option 1",
    Callback = function(selected) end
});
```

### Label
```lua
Components:AddLabel(box, {
    Text = "Label text",
    Size = 14,
    Color = Color3.fromRGB(255, 255, 255)
});
```

## 🔧 Advanced Usage

### Component Methods

Most components return objects with methods:

```lua
local toggle = Components:AddToggle(box, {...});
toggle.SetValue(true);              -- Set value
local value = toggle.GetValue();    -- Get current value

local slider = Components:AddSlider(box, {...});
slider.SetValue(75);
local value = slider.GetValue();

local dropdown = Components:AddDropdown(box, {...});
dropdown.SetValue("Option 2");
dropdown.SetOptions({"New", "Options"});
```

### Gradient Control

- Click the **"G" button** next to minimize/close to toggle title gradient
- Gradient smoothly animates left-to-right with theme colors
- Can be disabled in window creation or toggled at runtime

## 📱 Layout System

The library uses a **two-column layout**:

- **Left Column**: 48% width, positioned at left
- **Right Column**: 48% width, positioned at right  
- **Scrollable**: Both columns scroll independently
- **Responsive**: Boxes stack vertically within columns
- **Spacing**: Automatic spacing between boxes

## 📋 Complete Example

See [ExampleWorking.lua](ExampleWorking.lua) for a complete working example with multiple tabs, boxes, all component types, and working theme system.

## 📁 Repository Structure

### Core Files (Clean & Working)
- `PinkUIFixed.lua` - Main UI library with theme system
- `ComponentsFixed.lua` - All UI components with theme support
- `Themes.lua` - 8 color themes 
- `ExampleWorking.lua` - Complete working example
- `README.md` - This documentation

### Quick Copy-Paste
```lua
-- Complete setup (copy and run this)
local PinkUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/testing2122/roblox-pink-ui-lib/main/PinkUIFixed.lua"))();
local Components = loadstring(game:HttpGet("https://raw.githubusercontent.com/testing2122/roblox-pink-ui-lib/main/ComponentsFixed.lua"))();
local Themes = loadstring(game:HttpGet("https://raw.githubusercontent.com/testing2122/roblox-pink-ui-lib/main/Themes.lua"))();

-- See ExampleWorking.lua for complete implementation
```

## 🎯 What's New in v2.0

- ✅ **Working Theme System**: All elements change colors properly
- ✅ **Box System**: Organized left/right column layout
- ✅ **8 Color Themes**: Pink, Blue, Purple, Green, Orange, Red, Dark, Cyan
- ✅ **Smooth Transitions**: 0.3-second animated color changes
- ✅ **Clean Repository**: Removed all unused/outdated files
- ✅ **Complete Components**: Toggle, Slider, Button, Input, Dropdown, Label
- ✅ **Responsive Design**: Scrollable boxes and columns

## 📄 License

MIT License - Feel free to use in your projects!

---

**Created by testing2122** | [GitHub Repository](https://github.com/testing2122/roblox-pink-ui-lib)