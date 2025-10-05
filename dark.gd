extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var time=1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time-=delta
	if time<0.0:
		StoryManager.STORY_day_end()
		get_tree().change_scene_to_file("res://scenes/home.tscn")
