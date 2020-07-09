tool
extends Button

#var octaves

func _enter_tree():
	connect("pressed", self, "clicked")

func clicked():
	get_tree().change_scene("res://addons/terrain_plugin/terrain_plugin.tscn")
	generate_chunk()

func generate_chunk():
	var plane_mesh = PlaneMesh.new()
	plane_mesh.size = Vector2(10, 10)
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
