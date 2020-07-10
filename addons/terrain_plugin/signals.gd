tool
extends VBoxContainer

var mat = preload("res://addons/terrain_plugin/shaders/terrain_shader.tres")
var mat2d = preload("res://addons/terrain_plugin/shaders/2d_noise_rect.tres")
var rng = RandomNumberGenerator.new()

func _on_Set_Seed_Button_button_down():
	#Get the string from our seed field and hash it as an int.
	var noise_seed = $Seed_Input.get_text()
	
	if noise_seed == "":
		rng.seed = rand_range(1.0, 1000.0)
	else:
		rng.seed = noise_seed.hash()
	
	var nseed = rng.seed / 100
	
	mat2d.set_shader_param("noise_seed", nseed)
	mat.set_shader_param("noise_seed", nseed)
	
	print("Noise seed: ", nseed)

func _on_Octave_Slider_value_changed(octaves):
	print(octaves)
	mat.set_shader_param("octaves", octaves)
	mat2d.set_shader_param("octaves", octaves)

func _on_DW_X_Slider_value_changed(domain_warping_x):
	mat.set_shader_param("domain_warping_x", domain_warping_x)
	mat2d.set_shader_param("domain_warping_x", domain_warping_x)

func _on_DW_Y_Slider_value_changed(domain_warping_y):
	mat.set_shader_param("domain_warping_y", domain_warping_y)
	mat2d.set_shader_param("domain_warping_y", domain_warping_y)

func _on_Create_Terrain_Button_button_down():
	get_tree().change_scene("res://addons/terrain_plugin/terrain_plugin.tscn")
	generate_chunk()

func _on_Zoom_Slider_value_changed(noise_zoom_level):
	mat.set_shader_param("noise_zoom_level", noise_zoom_level)
	mat2d.set_shader_param("noise_zoom_level", noise_zoom_level)

func generate_chunk():
	var plane_mesh = PlaneMesh.new()
	plane_mesh.size = Vector2(40, 40)
	plane_mesh.subdivide_depth = 512
	plane_mesh.subdivide_width = 512
	#plane_mesh.material = mat
	plane_mesh.material = preload("res://addons/terrain_plugin/shaders/terrain_shader.tres")
	
	var mesh_instance = MeshInstance.new()
	mesh_instance.mesh = plane_mesh
	mesh_instance.name = "Terrain"
	
	var current_scene = get_tree().get_edited_scene_root()
	current_scene.add_child(mesh_instance)
	mesh_instance.set_owner(current_scene)
