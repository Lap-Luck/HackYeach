extends ColorRect

func _process(_delta: float) -> void:
		visible = Globals.Sanity < 80
