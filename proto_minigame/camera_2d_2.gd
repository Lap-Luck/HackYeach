extends Camera2D

@export var speed: float = 1000.0;
@export var strength: float = 0.1;

func _process(_delta: float) -> void:
	if Globals.Sanity < 80:
		rotation = sin(Time.get_ticks_msec() / speed) * strength;
		zoom.x = 1.0 + sin(Time.get_ticks_msec() / 900.0) / 20.0;
		zoom.y = 1.0 + sin(Time.get_ticks_msec() / 1100.0) / 20.0;
