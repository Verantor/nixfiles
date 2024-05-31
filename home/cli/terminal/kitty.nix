''
  # Colors
  include lovelace_colors.conf
  background_opacity=0.5
  # Fonts
  font_family									JetBrainsMonoNL Nerd Font
  italic_font      								auto
  bold_font        								auto
  bold_italic_font 								auto
  font_size        								12.0

  adjust_line_height 						0
  adjust_column_width 					0
  box_drawing_scale 						0.001, 1, 1.5, 2

  # Cursor
  cursor_shape     							underline
  cursor_blink_interval     					-1
  cursor_stop_blinking_after 			15.0

  # Scrollback
  scrollback_lines 							10000
  scrollback_pager 							usr/bin/less
  wheel_scroll_multiplier 					5.0

  # URLs
  url_style 										double
  open_url_modifiers 						ctrl+shift
  open_url_with 								default
  copy_on_select 								yes

  # Selection
  rectangle_select_modifiers 			ctrl+shift
  select_by_word_characters 			:@-./_~?&=%+#

  # Mouse
  click_interval 								0.5
  mouse_hide_wait 							0
  focus_follows_mouse 					no

  # Performance
  repaint_delay    							20
  input_delay 									2
  sync_to_monitor 							no

  # Bell
  visual_bell_duration 						0.0
  enable_audio_bell 							yes
  bell_on_tab									yes

  # Window
  remember_window_size   				no
  initial_window_width   					700
  initial_window_height  					400
  window_border_width 					0
  # was 12
  window_margin_width 					5
  # was 10
  window_padding_width 					5
  inactive_text_alpha 						1.0
  background_opacity 						0.40
  placement_strategy 						center
  hide_window_decorations 				yes

  # Layouts
  enabled_layouts 							*

  # Tabs
  tab_bar_edge 								bottom
  tab_bar_style 								powerline
  tab_bar_margin_width 					0.0
  tab_separator 								" ┇ "
  active_tab_font_style 					bold
  inactive_tab_font_style 					normal

  # Shell
  close_on_child_death 					no
  allow_remote_control 					yes
  term 											xterm-kitty
''
