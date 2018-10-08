SenseUI
=======
SenseUI is an immideate-mode graphical user interface for Aimware.NET cheat.

![Example script](https://cdn.discordapp.com/attachments/494072394160275487/494460708860461058/unknown.png)

| Contents |
|----------|
| [To do](#to-do) |
| [Documentation](#documentation) |
| [&nbsp;&nbsp;&nbsp;&nbsp;How to load](#how-to-load) |
| [&nbsp;&nbsp;&nbsp;&nbsp;How to make own script](#how-to-make-own-script) |
| [Tables](#tables)  |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.Keys](#senseuikeys) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.KeyDetection](#senseuikeydetection) |
| [Methods](#methods)  |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.BeginWindow](#senseuibeginwindow-id-x-y-w-h--bool-isdrawn) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.AddGradient](#senseuiaddgradient-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.SetWindowMoveable](#senseuisetwindowmoveable-value-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.SetWindowSizeable](#senseuisetwindowsizeable-value-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.SetWindowOpenKey](#senseuisetwindowopenkey-value-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.EndWindow](#senseuiendwindow-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.BeginGroup](#senseuibegingroup-id-title-x-y-width-height--bool-isdrawn) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.SetGroupMoveable](#senseuisetgroupmoveable-value-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.SetGroupSizeable](#senseuisetgroupsizeable-value-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.EndGroup](#senseuiendgroup-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.Checkbox](#senseuicheckbox-title-var--bool-var) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.Button](#senseuibutton-title-width-height--bool-ispressed) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.Slider](#senseuislider-title-min-max-format-min_text-max_text-show_buttons-var--number-var) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.Label](#senseuilabel-title-is_alt-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.Bind](#senseuibind-id-can_change_detection-var-key_held-detection_method--int-var-bool-key_held-int-detection_method) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.DrawTabBar](#senseuidrawtabbar-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.BeginTab](#senseuibegintab-id-icon--bool-isselected) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.EndTab](#senseuiendtab-) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.Combo](#senseuicombo-title-elements-var--number-var) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.MultiCombo](#senseuimulticombo-title-elements-var--table-var) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.Listbox](#senseuilistbox-elements-maxelements-showsearch-var-searchvar-scrollvar--number-var-string-searchvar-number-scrollvar) |
| [&nbsp;&nbsp;&nbsp;&nbsp;SenseUI.Textbox](#senseuitextbox-id-title-var--string-var) |

## To Do
1. Horizontal tabs
2. Color picker
3. Scrolling

# Documentation
### How to load
1. Install "AstriumTabs.ttf" if you haven't yet
2. Create script "SenseUI.lua" in Aimware window
3. Load it (it will be colored in menu, also it will write to console that load is success)
4. Get some script (example one, or create your own)
5. Load script
6. Profit

#### How to make own script
1. Read documentation
2. Follow example code
3. Explore SenseUI.lua
4. Profit

# Tables

SenseUI.Keys
---------------
```lua
SenseUI.Keys = {
	esc = 27, f1 = 112, f2 = 113, f3 = 114, f4 = 115, f5 = 116,
	f6 = 117, f7 = 118, f8 = 119, f9 = 120, f10 = 121, f11 = 122,
	f12 = 123, tilde = 192, one = 49, two = 50, three = 51, four = 52,
	five = 53, six = 54, seven = 55, eight = 56, nine = 57, zero = 48,
	minus = 189, equals = 187, backslash = 220, backspace = 8,
	tab = 9, q = 81, w = 87, e = 69, r = 82, t = 84, y = 89, u = 85,
	i = 73, o = 79, p = 80, bracket_o = 219, bracket_c = 221,
	a = 65, s = 83, d = 68, f = 70, g = 71, h = 72, j = 74, k = 75,
	l = 76, semicolon = 186, quotes = 222, caps = 20, enter = 13,
	shift = 16, z = 90, x = 88, c = 67, v = 86, b = 66, n = 78,
	m = 77, comma = 188, dot = 190, slash = 191, ctrl = 17,
	win = 91, alt = 18, space = 32, scroll = 145, pause = 19,
	insert = 45, home = 36, pageup = 33, pagedn = 34, delete = 46,
	end_key = 35, uparrow = 38, leftarrow = 37, downarrow = 40, 
	rightarrow = 39, num = 144, num_slash = 111, num_mult = 106,
	num_sub = 109, num_7 = 103, num_8 = 104, num_9 = 105, num_plus = 107,
	num_4 = 100, num_5 = 101, num_6 = 102, num_1 = 97, num_2 = 98,
	num_3 = 99, num_enter = 13, num_0 = 96, num_dot = 110, mouse_1 = 1, mouse_2 = 2
};
```
Contains all keys which are used in SenseUI.

SenseUI.KeyDetection
 -----------------------
```lua
SenseUI.KeyDetection = {
	always_on = 1, -- Always ON
	on_hotkey = 2, -- When key is down
	toggle = 3,	   -- Works like checkbox
	off_hotkey = 4 -- When key is up
};
```
Defines how key press must be detected in **SenseUI.Bind**

SenseUI.Icons
 -----------------------
```lua
SenseUI.Icons = {
	rage = { "C", 5 },			-- Rage icon (headshot)
	legit = { "D", 2 },			-- Legit icon (scope)
	visuals = { "E", 2 },		-- Visuals icon (brightness)
	settings = { "F", 3 },		-- Settings icon (cogwheels)
	skinchanger = { "G", 1 },	-- Skinchanger icon (karambit)
	playerlist = { "H", 0 }		-- Player list icon (man)
};
```
Used in **SenseUI.BeginTab**

# Methods

SenseUI.BeginWindow( id, x, y, w, h ): *bool* isDrawn
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| any | id | Unique identifier of window. |
| number | x | Start X position |
| number | y | Start Y position |
| number | w | Start width of window |
| number | h | Start height of window |

Creates basic window. Returns *true* if window has been drawn. Must be ended with **SenseUI.EndWindow**
Example: 
```lua
if SenseUI.BeginWindow( "testWindow", 50, 50, 400, 400 ) then
	SenseUI.EndWindow();
end
```

Result:

![](https://gyazo.com/ab5fca221fc3c48d9486a8eae6b88f2a.png)

SenseUI.AddGradient( )
---------------------------------------------------------------
Draws gradient line at the top of window
Example: 
```lua
if SenseUI.BeginWindow( "testWindow", 50, 50, 400, 400 ) then
	SenseUI.AddGradient();
	SenseUI.EndWindow();
end
```

Result:

![](https://gyazo.com/9482fde8f8502f6545f27079a3147275.png)  

SenseUI.SetWindowMoveable( value )
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| bool | value | Value to set |

Sets is_moveable to **value** in the current window
Example: 
```lua
if SenseUI.BeginWindow( "testWindow", 50, 50, 400, 400 ) then
	SenseUI.SetWindowMoveable( true );
	SenseUI.EndWindow();
end
```

Result:

[Here](https://gyazo.com/14e4408eccf794e8bc66ddb1796305e2.gif)

SenseUI.SetWindowSizeable( value )
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| bool | value | Value to set |

Sets is_sizeable to **value** in the current window
Example: 
```lua
if SenseUI.BeginWindow( "testWindow", 50, 50, 400, 400 ) then
	SenseUI.SetWindowSizeable( true );
	SenseUI.EndWindow();
end
```

Result:

[Here](https://gyazo.com/e8924f8ac57fa8584e482ca763999627.gif)

SenseUI.SetWindowOpenKey( value )
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| int | value | Value to set |

Sets open_key to **value** in the current window. You can take values from **SenseUI.Keys** 
Example: 
```lua
if SenseUI.BeginWindow( "testWindow", 50, 50, 400, 400 ) then
	SenseUI.SetWindowOpenKey( SenseUI.Keys.delete );
	SenseUI.EndWindow();
end
```

Result:

![](https://gyazo.com/3c27823ca8c7dd2b459e3308bd10f973.gif)

SenseUI.EndWindow( )
---------------------------------------------------------------
Ends window which was started by **SenseUI.BeginWindow**
Example: 
```lua
if SenseUI.BeginWindow( "testWindow", 50, 50, 400, 400 ) then
	-- ....
	SenseUI.EndWindow();
end
```

SenseUI.BeginGroup( id, title, x, y, width, height ): *bool* isDrawn
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| any | id | Unique ID of group |
| string | title | Title of group. If nil, then group doesn't have title |
| number | x | X position of group |
| number | y | Y position of group |
| number | width | Width of group |
| number | height | Height of group |

Draws basic group. Must be ended with **SenseUI.EndGroup**
Example: 
```lua
if SenseUI.BeginWindow( "testWindow", 50, 50, 400, 400 ) then
	if SenseUI.BeginGroup( "testGroup", "Group name!", 25, 25, 350, 350 ) then
		SenseUI.EndGroup();
	end
	
	SenseUI.EndWindow();
end
```

Result:

![](https://gyazo.com/7d1dec18905a057b505d3faea5ad0998.png)

SenseUI.SetGroupMoveable( value )
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| bool | value | Value to set |

Sets is_moveable to **value** in the current group.
Example: 
```lua
if SenseUI.BeginWindow( "testWindow", 50, 50, 400, 400 ) then
	if SenseUI.BeginGroup( "testGroup", "Group name!", 25, 25, 350, 350 ) then
		SenseUI.SetGroupMoveable( true );
		
		SenseUI.EndGroup();
	end
	
	SenseUI.EndWindow();
end
```

Result:

![](https://gyazo.com/92238160c8a3b6d3c5c3063c82c3c7b7.gif)

SenseUI.SetGroupSizeable( value )
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| bool | value | Value to set |

Sets is_sizeable to **value** in the current group.
Example: 
```lua
if SenseUI.BeginWindow( "testWindow", 50, 50, 400, 400 ) then
	if SenseUI.BeginGroup( "testGroup", "Group name!", 25, 25, 350, 350 ) then
		SenseUI.SetGroupSizeable( true );
		
		SenseUI.EndGroup();
	end
	
	SenseUI.EndWindow();
end
```

Result:

![](https://gyazo.com/62e729692d39d9f4fae597f941ff8934.gif)

SenseUI.EndGroup( )
---------------------------------------------------------------
Ends group which was started by **SenseUI.EndGroup**
Example: 
```lua
if SenseUI.BeginGroup( "testGroup", "Group name!", 25, 25, 350, 350 ) then
	-- ...
	SenseUI.EndGroup();
end
```  

SenseUI.Checkbox( title, var ): *bool* var
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| string | title | Title of checkbox |
| bool | var | Var which contains value of checkbox |

Draws basic checkbox. Must be placed in a group
Example: 
```lua
local cb1 = false;

-- ...

cb1 = SenseUI.Checkbox( "Test checkbox", cb1 );
```

Result:

![](https://gyazo.com/c6d59cc1b6ced7fe7041399625e1b3f8.gif)

SenseUI.Button( title, width, height ): *bool* isPressed
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| string | title | Title of button |
| number | width | Width of button |
| number | height | Height of button |

Draws basic button. Must be placed in a group
Example: 
```lua
local isPressed = SenseUI.Button( "Button!", 155, 25 );
```

Result:

![](https://gyazo.com/4bc663e0eebdf18ec752e10158356128.gif)

SenseUI.Slider( title, min, max, format, min_text, max_text, show_buttons, var ): *number* var
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| string | title | Title of slider |
| number | min | Minimal value |
| number | max | Maximal value |
| string | format | Text to append to the value (e.g. format = "%" will do something like "50%" |
| string | min_text | Text to show when value reaches minimal value |
| string | max_text | Text to show when value reaches maximal value |
| bool | show_buttons | Show + and - buttons at sides of slider |
| number | var | Variable that contains value of slider |

Draws basic slider. Must be placed in a group
Example: 
```lua
local sliderVal = 0;

-- ...

sliderVal = SenseUI.Slider( "Cool slider here", 0, 100, "%", "Nothing", "Maximum!", false, sliderVal );
```

Result:

![](https://gyazo.com/a4d0672518fce848296d6ac922256e87.gif)

SenseUI.Label( title, is_alt )
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| string | title | Title of label |
| bool | is_alt | Is alternative label. Makes label yellow

Draws basic label. Must be placed in a group
Example: 
```lua
SenseUI.Label( "Normal label" );
SenseUI.Label( "Alt label", true );
```

Result:

![](https://gyazo.com/f197bc700c59a5ea0469bbd24ffb09e4.png)  

SenseUI.Bind( id, can_change_detection, var, key_held, detection_method ): *int* var, *bool* key_held, *int* detection_method
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| any | id | Unique ID of bind |
| bool | can_change_detection | Defines if user can change detection method of bind |
| number | var | Variable that contains current key |
| bool | key_held | Defines if key is holding. Used only for **SenseUI.KeyDetection.toggle** |
| number | detection_method | How key must be detected. **SenseUI.KeyDetection** contains values for this argument

Draws basic key bind. Must be placed in a group and right after some other element
Example: 
```lua
local bind, bind_kh, bind_dm = 0, false, SenseUI.KeyDetection.on_hotkey;

-- ...

SenseUI.Label( "Bind here!" );
bind, bind_kh, bind_dm = SenseUI.Bind( "test bind", true, bind, bind_kh, bind_dm );
```

Result:

![](https://gyazo.com/0a30e37bff48d3250a15f4dc67fe8bad.gif)  

Key detection change:

![](https://gyazo.com/14e8920d3f499bca62ca8aed2d5b1fd9.gif)  

SenseUI.DrawTabBar( )
---------------------------------------------------------------
Draws tab bar for tabs. Must be placed right after **SenseUI.BeginWindow**
Example: 
```lua
if SenseUI.BeginWindow( "wnd1", 50, 50, 565, 400) then
	SenseUI.DrawTabBar();
	-- ...
```

SenseUI.BeginTab( id, icon ): *bool* isSelected
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| any | id | Unique ID of tab |
| string | icon | Icon of tab. Placed in **SenseUI.Icons** |

Draws tab. Must be placed in window and after **SenseUI.DrawTabBar()**
Example:
```lua
if SenseUI.BeginWindow( "testWindow", 400, 400, 500, 500 ) then
	SenseUI.DrawTabBar();

	if SenseUI.BeginTab( "ayy lmao", SenseUI.Icons.settings ) then
		if SenseUI.BeginGroup( "testGroup", "Group name!", 25, 25, 350, 350 ) then
			-- ...
			SenseUI.EndGroup();
		end
	end
	SenseUI.EndTab();

	SenseUI.EndWindow();
end
```

Result:

![](https://gyazo.com/77c67f363035108b98ed5600b0077c59.png)

SenseUI.EndTab( )
---------------------------------------------------------------
Ends tab which was started by **SenseUI.BeginTab**. Must be placed outside if statement
Example:
```lua
if SenseUI.BeginWindow( "testWindow", 400, 400, 500, 500 ) then
	SenseUI.DrawTabBar();

	if SenseUI.BeginTab( "ayy lmao", SenseUI.Icons.settings ) then
		if SenseUI.BeginGroup( "testGroup", "Group name!", 25, 25, 350, 350 ) then
			-- ...
			SenseUI.EndGroup();
		end
	end
	SenseUI.EndTab(); -- It's here cuz it has some calculations

	SenseUI.EndWindow();
end
```

SenseUI.Combo( title, elements, var ): *number* var
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| string | title | Title of combo. Can be nil |
| table | elements | Comma-separated table of elements |
| number | var | Variable that contains current selected value |

Draws combo. Must be placed in group
Example:
```lua
local cmb = 1;

-- ...

cmb = SenseUI.Combo( "Combo!", { "Element 1", "Second one", "Third?" }, cmb );
```

Result:

![](https://gyazo.com/8ec20b1a8420faf8ec61e7d8b63ac76f.gif)

SenseUI.MultiCombo( title, elements, var ): *table* var
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| string | title | Title of combo. Can be nil |
| table | elements | Comma-separated table of elements |
| number | var | Variable that contains current selected value |

Draws multicombo. Must be placed in group. **var** has this structure:
```lua
var = {
	"Element 1" = true,
	"Second one" = false,
	"Third?" = true
}
```

Example:
```lua
local cmb = {};

-- ...

cmb = SenseUI.MultiCombo( "MultiCombo!", { "Element 1", "Second one", "Third?" }, cmb );
```

Result:

![](https://gyazo.com/184b0f990606acda31fc8b72686611fa.png)

SenseUI.Listbox( elements, maxElements, showSearch, var, searchVar, scrollVar ): *number* var, *string* searchVar, *number* scrollVar
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| table | elements | Comma-separated table of elements |
| number | maxElements | How many elements can be shown at once |
| bool | showSearch | Show search bar |
| number | var | Variable that contains value |
| string | searchVar | Variable for search bar. Can be nil if showSearch = false |
| number | scrollVar | Variable for scroll. Can be nil if you are sure that count of elements will not be bigger than maxElements

Draws listbox. Must be placed in group

Example:
```lua
local list = 1;
local listScroll = 0;
local listSearch = "";

-- ...

list, listScroll, listSearch = SenseUI.Listbox( { "glock18", "p2000", "usp-s", "elites", "p250", "tec9", "five-seven", "cz75a", "deagle", "revolver" }, 4, true, list, listSearch, listScroll );
```

Result:

![](https://gyazo.com/25628df4ac9b6b2df5a9873df6654b0a.gif)
![](https://gyazo.com/4ec52a378e56e78dff3decbc4d8c716a.gif)


SenseUI.Textbox( id, title, var ): *string* var
---------------------------------------------------------------
| Type | Argument | Description |
|--|--|--|
| any | id | Unique ID of textbox |
| string | title | Title of textbox |
| string | var | Variable that contains textbox value |

Draws textbox. Must be placed in group

Example:
```lua
local textboxTest = "";

-- ...

textboxTest = SenseUI.Textbox( "text1", "Textbox!", textboxTest );
```

Result:

![](https://gyazo.com/2656500707c07868fad4fb59ecabdfa1.gif)
