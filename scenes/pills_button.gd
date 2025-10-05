extends TextureButton

@export var cost: int = 51

func _on_pressed() -> void:
	if StoryManager.money_count() >= cost:
		Globals.reduce_sanity(-100);
		StoryManager.bank.append(StoryManager.Transction.new(-cost, "Pills"))
		
		
