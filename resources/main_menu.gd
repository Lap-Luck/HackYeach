extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_back_to_game_pressed() -> void:
	get_tree().change_scene_to_file("res://resources/home.tscn")


func _on_settings_pressed() -> void:
	add_child(Settings)
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	var credits_scene = load("res://scenes/credits.tscn")
	add_child(credits_scene)
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
