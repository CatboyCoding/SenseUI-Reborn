# SenseUI
Immideate-Mode GUI for Aimware.NET

![Example script](https://cdn.discordapp.com/attachments/491234984300904468/491548645360140299/unknown.png)

* [Tables](#tables)
* [Methods](#methods)
* [Example](#example-script)

#### To do
1. Drowdown
1. Multiselect
1. Keybind
1. Vertical tabs
1. Horizontal tabs
1. Color picker
1. Scrolling
1. List

# Documentation:
#### Tables
* **SenseUI.Keys** - Table that contains all keycodes. __*Example:*__ "__\\__" key equals to "backslash". __KEEP IN MIND:__ "__END__" key is equals to "__end_key__"!

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

#### Example script
```lua
local show_group = true;
local this_sizeable = false;
local window_moveable = true;
local show_gradient = true;
local button_toggler = false;
local ui_rate = 10;
local slider_showpm = false;
local funny_sliders = 0;

function draw_callback()
	if SenseUI.BeginWindow( "wnd1", 50, 50, 485, 400) then
		if show_gradient then
			SenseUI.AddGradient();
		end

		SenseUI.SetWindowMoveable( window_moveable );
		SenseUI.SetWindowOpenKey( SenseUI.Keys.delete );

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

				SenseUI.EndGroup();
			end
		end

		if SenseUI.BeginGroup( "grp3", "About	 [ SenseUI by Ruppet ]", 25, 265, 435, 110 ) then
			SenseUI.Label( "Current progress: ", true );
			SenseUI.Label( "Controls - Checkbox, Button, Slider, Label" );
			SenseUI.Label( "Containers - Window, Group" );
			SenseUI.Label( "TODO:", true );
			SenseUI.Label( "Dropdown, Multiselect, Keybind, Tabs, ... [ more on github ]" );

			SenseUI.EndGroup();
		end

		SenseUI.EndWindow();
	end
end

RunScript( "senseui.lua" );
callbacks.Register( "Draw", "suitest", draw_callback );
