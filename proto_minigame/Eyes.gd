extends Node2D

@export var inverted := false;
@export var threshold := 80;

func _process(_delta: float) -> void:
	if inverted:
		visible = Globals.Sanity >= 80
	else:
		visible = Globals.Sanity < 80;
