extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_back_to_game_pressed() -> void:
	var first_day = load("res://scenes/home.tscn")
	get_tree().change_scene_to_packed(first_day)


func _on_settings_pressed() -> void:
	var g=Globals
	add_child(g.Settings.instantiate())
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	var credits_scene = load("res://scenes/credits.tscn")
	add_child(credits_scene.instantiate())
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
