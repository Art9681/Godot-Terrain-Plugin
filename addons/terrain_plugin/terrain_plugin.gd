tool
extends EditorPlugin

# A class member to hold the dock during the plugin life cycle
var dock

func _enter_tree():
	# Initialization of the plugin goes here
	add_custom_type("MyButton", "Button", preload("create_terrain_button.gd"), preload("icon.png"))
	add_custom_type("DebugButton", "Button", preload("debug_button.gd"), preload("icon.png"))
	# Load the dock scene and instance it
	dock = preload("res://addons/terrain_plugin/terrain_plugin.tscn").instance()

	# Add the loaded scene to the docks
	add_control_to_dock(DOCK_SLOT_LEFT_UL, dock)
	# Note that LEFT_UL means the left of the editor, upper-left dock

func _exit_tree():
	# Clean-up of the plugin goes here
	remove_custom_type("TerrainButton")
	remove_custom_type("DebugButton")
	# Remove the dock
	remove_control_from_docks(dock)
	 # Erase the control from the memory
	dock.free()
