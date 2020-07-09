tool
extends VBoxContainer

var mat = preload("res://addons/terrain_plugin/shaders/terrain_shader.tres")
var mat2d = preload("res://addons/terrain_plugin/shaders/2d_noise_rect.tres")

func _ready():
	pass

func _on_OctaveSlider_value_changed(octaves):
	print(octaves)
	mat.set_shader_param("octaves", octaves)
	mat2d.set_shader_param("octaves", octaves)
	
func _on_DW_X_Slider_value_changed(domain_warping_x):
	mat.set_shader_param("domain_warping_x", domain_warping_x)
	mat2d.set_shader_param("domain_warping_x", domain_warping_x)

func _on_DW_Y_Slider_value_changed(domain_warping_y):
	mat.set_shader_param("domain_warping_y", domain_warping_y)
	mat2d.set_shader_param("domain_warping_y", domain_warping_y)

func _on_Zoom_Slider_value_changed(noise_zoom_level):
	mat.set_shader_param("noise_zoom_level", noise_zoom_level)
	mat2d.set_shader_param("noise_zoom_level", noise_zoom_level)
