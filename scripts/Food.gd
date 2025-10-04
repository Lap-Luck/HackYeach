extends Sprite2D

class_name Food;

var foodRes: FoodRes;
var cooked: bool;

func _init(fr: FoodRes, c: bool = false):
	foodRes = fr;
	cooked = c;
	if cooked:
		texture = foodRes.tex2;
	else:
		texture = foodRes.tex1;
	z_index = 10;
	scale *= foodRes.scale;
	modulate =  foodRes.colorModulate

func _process(_delta: float) -> void:
	position = get_global_mouse_position();
