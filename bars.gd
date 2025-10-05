extends Control


# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	update_bars()
	
func update_bars():
	#assert(false)
	#$VBoxContainer/Container/TextureProgressBar.value = Globals.Sanity
	#$VBoxContainer/Container/TextureProgressBar2.value = Globals.food
	$VBoxContainer/TextureProgressBar2/ColorRect.size.x=Globals.Sanity*$VBoxContainer/TextureProgressBar2.size.x/100.0
	$VBoxContainer/TextureProgressBar/ColorRect.size.x=Globals.food*$VBoxContainer/TextureProgressBar.size.x/100.0
