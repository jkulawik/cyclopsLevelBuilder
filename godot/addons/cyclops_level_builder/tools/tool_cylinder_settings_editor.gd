# MIT License
#
# Copyright (c) 2023 Mark McKay
# https://github.com/blackears/cyclopsLevelBuilder
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

@tool
extends PanelContainer
class_name ToolCylinderSettingsEditor


var settings:ToolCylinderSettings:
	get:
		return settings
	set(value):
		settings = value
		update()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update():
	if !settings:
		#%default_block_height.value = 0
		#%spin_segments.disabled = true
		%check_tube.disabled = true
		%check_match_selected_block.disabled = true
		%default_block_elevation.disabled = true
		%default_block_height.disabled = true
		return

	#%spin_segments.disabled = false
	%spin_segments.value = settings.segments
	%check_tube.disabled = false
	%check_tube.button_pressed = settings.match_selected_block
	%check_match_selected_block.disabled = false
	%check_match_selected_block.button_pressed = settings.match_selected_block
	%default_block_elevation.disabled = false
	%default_block_elevation.value = settings.default_block_elevation
	%default_block_height.disabled = false
	%default_block_height.value = settings.default_block_height


func _on_check_match_selected_block_toggled(value):
	settings.match_selected_block = value


func _on_default_block_elevation_value_changed(value):
	settings.default_block_elevation = value


func _on_default_block_height_value_changed(value):
	settings.default_block_height = value


func _on_check_tube_toggled(value):
	settings.tube = value


func _on_spin_segments_value_changed(value):
	settings.segments = value
