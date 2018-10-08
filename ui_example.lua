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

local ex_combo = 1;
local ex_mcombo = {};

local list = 1;
local listScroll = 0;
local listSearch = "";

local textboxTest = "";
local textboxTest2 = "";

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
				ex_combo = SenseUI.Combo( "Example combo", { "el 1", "el 123" }, ex_combo );
				ex_mcombo = SenseUI.MultiCombo( "Example multicombo", { "select this", "and this", "or maybe this?" }, ex_mcombo );

				list, listScroll, listSearch = SenseUI.Listbox( { "glock18", "p2000", "usp-s", "elites", "p250", "tec9", "five-seven", "cz75a", "deagle", "revolver" }, 4, true, list, listSearch, listScroll );
				
				textboxTest = SenseUI.Textbox( "text1", "Textbox!", textboxTest );
				textboxTest2 = SenseUI.Textbox( "text2", nil, textboxTest2 );

				SenseUI.Label( "You typed: " .. textboxTest2 );
				SenseUI.EndGroup();
			end

			if SenseUI.BeginGroup( "newels2", "New elements", 255, 25, 205, 360 ) then
				

				SenseUI.EndGroup();
			end
		end
		SenseUI.EndTab();

		SenseUI.EndWindow();
	end
end

callbacks.Register( "Draw", "suitest", draw_callback );