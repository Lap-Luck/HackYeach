extends Area2D

class_name Cooker;

var foodRes: FoodRes = null;

func put_food(food: FoodRes) -> bool:
	if foodRes == null:
		foodRes = food;
		return true;
	else:
		return false;
	$Sprite2D.play('new_animation')

func get_food() -> Food:
	if foodRes:
		var food = Food.new(foodRes, true);
		food.texture = foodRes.tex2;
		food.cooked = true;
		food.foodRes = foodRes;
		foodRes = null;
		food.z_index = 10;
		return food;
		$Sprite2D.play('default')
	else:
		return null;
