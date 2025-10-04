extends Control


func _on_back_to_game_pressed() -> void:
	queue_free()
	pass # Replace with function body.


func _on_settings_toggled(toggled_on: bool) -> void:
	add_child(Settings)
	pass # Replace with function body.

func _on_main_menu_toggled(toggled_on: bool) -> void:
	var scene_mm = load('res://scenes/main_menu.tscn')
	get_tree().change_scene_to_file(scene_mm)
	pass # Replace with function body.
