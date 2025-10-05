extends TextureButton

@export var cost: int = 51
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_pressed() -> void:
	if StoryManager.money_count() >= cost:
		Globals.reduce_sanity(-100);
		StoryManager.bank.append(StoryManager.Transction.new(-cost, "Pills"))
		animation_player.play("animation")
		
		
