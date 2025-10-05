extends TextureButton


@export var cost: int = 27



func _ready() -> void:
	print(self.position)

func _on_pressed() -> void:
	if StoryManager.money_count() >= cost:
		Globals.reduce_food(-100);
		StoryManager.bank.append(StoryManager.Transction.new(-cost, "Burger"))
