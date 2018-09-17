# SenseUI
Immideate-Mode GUI for Aimware.NET

* [Tables](#tables)
* [Methods](#methods)
* [Example](#example-script)

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

#### Example script
```lua
local fakelags = gui.GetValue( "msc_fakelag_enable" ); -- Fakelag checkbox
local pingspike = gui.GetValue( "msc_fakelatency_enable" ); -- Fakelatency checkbox
local speedhack = gui.GetValue( "msc_speedhack_enable" ); -- Speedhack checkbox
local slider = 50;
local slider2 = 0;

function draw_callback()
	-- Update values
	fakelags = gui.GetValue( "msc_fakelag_enable" );
	pingspike = gui.GetValue( "msc_fakelatency_enable" );
	speedhack = gui.GetValue( "msc_speedhack_enable" );
	slider2 = gui.GetValue( "msc_fakelatency_amount" ) * 1000;

	-- Draw window. ID = "wnd1", X = 50, Y = 50, WIDTH = 400, HEIGHT = 400; IF statement is needed to prevent exceptions when drawing elements...
	if SenseUI.BeginWindow( "wnd1", 50, 50, 400, 400 ) then
		SenseUI.AddGradient(); -- Add gradient line to top of window
		SenseUI.SetWindowMoveable( true ); -- Set window is_moveable option. When enabled, you can drag window when holding key at the top of window.
		SenseUI.SetWindowOpenKey( SenseUI.Keys.delete ); -- Set open key. If nil, then you won't be able to toggle window.
		SenseUI.SetWindowSizeable( true ); -- Adds little triangle at the right bottom corner. When holding and dragging, you can change size of window.

		-- Draw group. ID = "grp1", TITLE = "Some group", X (in window) = 25, Y = 25, WIDTH = 300, HEIGHT = 200
		if SenseUI.BeginGroup( "grp1", "Some group", 25, 25, 300, 200 ) then
			SenseUI.SetGroupMoveable( true ); -- Same as in window, but you cannot move group outside the window.
			SenseUI.SetGroupSizeable( true ); -- Same as in window, but you cannot make group bigger than window (relative to X and Y of group)

			fakelags = SenseUI.Checkbox( "Fake-lags", fakelags ); -- Draws checkbox "Fake-lags", changed value is returned when function finishes.
			pingspike = SenseUI.Checkbox( "Ping spike", pingspike ); -- Draws second checkbox.
			speedhack = SenseUI.Button( "Speedhack", 100, 25 ); -- Draws button "Speedhack". When holding, returns TRUE; 100 is width and 25 is height
			slider = SenseUI.Slider( nil, 0, 100, "%", "Auto", "HP + 25", true, slider ); -- Test slider from 0 to 100. When 0, displays "Auto"; when 100 - "HP + 25". Shows -/+ buttons
			slider2 = SenseUI.Slider( "Ping spike", 0, 1000, "ms", "Off", nil, false, slider2 ); -- Ping spike slider (from 0 to 1000). When 0, displays "Off".

			SenseUI.EndGroup(); -- End group, needed to finish and clamp some vars
		end

		SenseUI.EndWindow(); -- End window, needed to prevent issues with other windows
	end
	
	-- Update values
	gui.SetValue( "msc_fakelag_enable", fakelags );
	gui.SetValue( "msc_fakelatency_enable", pingspike );
	gui.SetValue( "msc_speedhack_enable", speedhack );
	gui.SetValue( "msc_fakelatency_amount", slider2 / 1000 );
end

-- Run script so SenseUI table will be global.
RunScript( "senseui.lua" );

-- Register draw callback
callbacks.Register( "Draw", "suitest", draw_callback );
