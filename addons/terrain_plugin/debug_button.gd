tool
extends Button

func _enter_tree():
	connect("pressed", self, "clicked")

func clicked():
	get_tree().change_scene("res://addons/terrain_plugin/terrain_plugin.tscn")
	var octaves = get_node("../OctaveSlider").value
	
	print("Debug button clicked!")
	print(octaves)
