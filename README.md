# SenseUI
Immideate-Mode GUI for Aimware.NET

![Example script](https://cdn.discordapp.com/attachments/443040968124399619/491895506772164628/unknown.png)

* [Tables](#tables)
* [Methods](#methods)
* [Example](#example-script)

#### To do
1. Drowdown
1. Multiselect
1. Horizontal tabs
1. Color picker
1. Scrolling
1. List

# Documentation:
#### How to load
1. Create script "SenseUI.lua" in Aimware window
1. Load it (it will be colored in menu, also it will write to console that load is success)
1. Get some script (example one, or create your own)
1. Load script
1. Profit

#### How to make own script
1. Read documentation
1. Follow example code
1. Explore SenseUI.lua
1. Profit

#### Tables
* **SenseUI.Keys** - Table that contains all keycodes. __*Example:*__ "__\\__" key equals to "backslash". __KEEP IN MIND:__ "__END__" key is equals to "__end_key__"!
* **SenseUI.KeyDetection** - Table that contains key detection methods. Always on - key will be always ON; On hotkey - key will be ON if user hold it, and OFF if he doesn't; Toggle - key will be toggled ON if it's OFF, and toggled OFF if it's ON; Off hotkey - key will be OFF if user hold it, and ON if he doesn't.
* **SenseUI.Icons** - Table that contains all icons which are used for tabs.

#### Methods
* *bool* **SenseUI.BeginWindow** ( id, x, y, width, height ) - Draws basic window
    * *[any]* **id**: unique ID of window.
    * *[number]* **x**: start X position of window.
    * *[number]* **y**: start Y position of window.
    * *[number]* **width**: start width of window.
    * *[number]* **height**: start height of window.
    * _**Returns:**_ bool (true: on success; false: on fail)
* *void* **SenseUI.AddGradient** ( ) - Adds gradient to a window
* *void* **SenseUI.SetWindowMovable** ( value ) - Sets window is_moveable option
    * *[bool]* **value**: value to set.
* *void* **SenseUI.SetWindowOpenKey** ( value ) - Sets window open_key option
    * *[number]* **value**: value to set. Can be **nil**.
* *void* **SenseUI.SetWindowSizeable** ( value ) - Sets window is_sizeable option
    * *[bool]* **value**: value to set.
* *void* **SenseUI.EndWindow** ( ) - Finishes window which has been started with **BeginWindow**
* *bool* **SenseUI.BeginGroup** ( id, title, x, y, width, height ) - Draws basic group
    * *[any]* **id**: unique ID of group.
    * *[any]* **title**: title of group. Can be **nil**.
    * *[number]* **x**: start X position of group.
    * *[number]* **y**: start Y position of group.
    * *[number]* **width**: start width of group.
    * *[number]* **height**: start height of group.
    * _**Returns:**_ bool (true: on success; false: on fail)
* *void* **SenseUI.SetGroupMovable** ( value ) - Sets group is_moveable option
    * *[bool]* **value**: value to set.
* *void* **SenseUI.SetGroupSizeable** ( value ) - Sets group is_sizeable option
    * *[bool]* **value**: value to set.
* *void* **SenseUI.EndGroup** ( ) - Finishes group which has been started with **BeginGroup**
* *bool* **SenseUI.Checkbox** ( title, var ) - Draws basic checkbox
    * *[any]* **title**: title of checkbox.
    * *[bool]* **var**: variable to get value.
    * _**Returns:**_ bool (edited var)
* *bool* **SenseUI.Button** ( title, width, height ) - Draws basic button
    * *[any]* **title**: title of checkbox.
    * *[number]* **width**: width of button.
    * *[number]* **height**: height of button.
    * _**Returns:**_ bool (edited var)
* *number* **SenseUI.Slider** ( title, min, max, format, min_text, max_text, show_buttons, var ) - Draws basic slider
    * *[any]* **title**: title of checkbox.
    * *[number]* **min**: minimal value.
    * *[number]* **max**: maximal value.
    * *[text]* **format**: text to end up value. Can be **nil**.
    * *[text]* **min_text**: text to set when value reaches minimal. Can be **nil**.
    * *[text]* **max_text**: same as **min_text**, but for maximal value. Can be **nil**.
    * *[bool]* **show_buttons**: show **+** and **-** buttons (at left and right of slider).
    * *[number]* **var**: variable to get value.
    * _**Returns:**_ number (edited var)
* *void* **SenseUI.Label** ( text, is_alternative ) - Draws basic label
    * *[text]* **text**: text to write.
    * *[bool]* **is_alternative**: **true** makes text yellow.
* *int, bool, int* **SenseUI.Bind** ( id, can_change_detection, var, key_held, detection_method ) - Draws basic keybind after latest element
    * *[any]* **id**: bind's id.
    * *[bool]* **can_change_detection**: when **true**, right clicking on bind will show up key detection method selection.
    * *[int]* **var**: variable to store key.
    * *[bool]* **key_held**: variable to store if key held (needed for toggle).
    * *[int]* **detection_method**: variable to store detection method; default is 2 (SenseUI.KeyDetection.on_hotkey).
    * _**Returns:**_ int (selected key), bool (is key held), int (detection method)
* *void* **SenseUI.DrawTabBar** ( ) - Draws bar for tabs. Must be called after **BeginWindow**!
* *bool* **SenseUI.BeginTab** ( id, icon ) - Draws tab. Returns **TRUE** if tab is active
    * *[any]* **id**: tab's id.
    * *[icon]* **icon**: icon from **SenseUI.Icons**.
    * _**Returns:**_ bool (true if tab is active, otherwise false)
* *void* **SenseUI.EndTab** ( ) - Ends tab.

#### Example script
```lua
-- Check if SenseUI was loaded.
if SenseUI == nil then
	RunScript( "senseui.lua" );
end

local show_group = true;
local this_sizeable = false;
local window_moveable = true;
local show_gradient = true;
local button_toggler = false;
local ui_rate = 10;
local slider_showpm = false;
local funny_sliders = 0;
local draw_texture = false;
local bind_button = SenseUI.Keys.home;
local bind_active = false;
local bind_detect = SenseUI.KeyDetection.on_hotkey;

local window_bkey = SenseUI.Keys.delete;
local window_bact = false;
local window_bdet = SenseUI.KeyDetection.on_hotkey;

SenseUI.EnableLogs = true;

function draw_callback()
	if SenseUI.BeginWindow( "wnd1", 50, 50, 565, 400) then
		SenseUI.DrawTabBar();

		if show_gradient then
			SenseUI.AddGradient();
		end

		SenseUI.SetWindowDrawTexture( draw_texture ); -- Makes huge fps drop. Not recommended to use yet
		SenseUI.SetWindowMoveable( window_moveable );
		SenseUI.SetWindowOpenKey( window_bkey );

		if SenseUI.BeginTab( "tab1", SenseUI.Icons.settings ) then
			if SenseUI.BeginGroup( "grp1", "Example group 1", 25, 25, 205, 215 ) then
				show_group = SenseUI.Checkbox( "Show second group", show_group );
				SenseUI.Label( "This is normal label", false );
				SenseUI.Label( "This is alt label", true );
				button_toggler = SenseUI.Button( "Click me!", 120, 25 );

				if button_toggler then
					SenseUI.Label( "You are holding button!" );
				end

				slider_showpm = SenseUI.Checkbox( "Show -/+ buttons on slider", slider_showpm );
				ui_rate = SenseUI.Slider( "How cool is this UI?", 0, 10, nil, "Poor", "Amazing", slider_showpm, ui_rate );
				SenseUI.Label( "Your rate is: " ..  ui_rate .. "/10!" );

				SenseUI.Label( "Funny thing below" );
				funny_sliders = SenseUI.Slider( nil, 0, 100, nil, nil, nil, false, funny_sliders );
				funny_sliders = 100 - SenseUI.Slider(  nil, 0, 100, nil, nil, nil, false, 100 - funny_sliders );

				SenseUI.EndGroup();
			end

			if show_group then
				if SenseUI.BeginGroup( "grp2", "Example group 2", 255, 25, 205, 215 ) then
					SenseUI.SetGroupSizeable( this_sizeable );

					this_sizeable = SenseUI.Checkbox( "Make this sizeable", this_sizeable );
					show_gradient = SenseUI.Checkbox( "Show gradient", show_gradient );
					draw_texture = SenseUI.Checkbox( "Draw window texture", draw_texture );

					local txt = "off";
					if bind_active then txt = "on" end;

					SenseUI.Label( "Example bind: " .. txt );
					bind_button, bind_active, bind_detect = SenseUI.Bind( "bind1", true, bind_button, bind_active, bind_detect );

					SenseUI.Label( "Menu key" );
					window_bkey, window_bact, window_bdet = SenseUI.Bind( "wndToggle", false, window_bkey, window_bact, window_bdet );

					SenseUI.EndGroup();
				end
			end

			if SenseUI.BeginGroup( "grp3", "About	 [ SenseUI by Ruppet ]", 25, 265, 435, 110 ) then
				SenseUI.Label( "Current progress: ", true );
				SenseUI.Label( "Controls - Checkbox, Button, Slider, Label, Keybind" );
				SenseUI.Label( "Containers - Window, Group, Tabs" );
				SenseUI.Label( "TODO:", true );
				SenseUI.Label( "[ more on github ]" );

				SenseUI.EndGroup();
			end
		end
		SenseUI.EndTab();

		if SenseUI.BeginTab( "tab2", SenseUI.Icons.visuals ) then
			if SenseUI.BeginGroup( "newels1", "New elements", 25, 25, 205, 360 ) then
				SenseUI.Label( "New elements would be here" );

				SenseUI.EndGroup();
			end

			if SenseUI.BeginGroup( "newels2", "New elements", 255, 25, 205, 360 ) then
				SenseUI.Label( "and here!" );

				SenseUI.EndGroup();
			end
		end
		SenseUI.EndTab();

		SenseUI.EndWindow();
	end
end

callbacks.Register( "Draw", "suitest", draw_callback );
