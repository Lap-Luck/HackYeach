extends Area2D

class_name Cooker;

var foodRes: FoodRes = null;

func put_food(food: FoodRes) -> bool:
	if foodRes == null:
		foodRes = food;
		$Sprite2D.play('new_animation')
		return true;
	else:
		return false;

func get_food() -> Food:
	if foodRes:
		var food = Food.new(foodRes, true);
		food.texture = foodRes.tex2;
		food.cooked = true;
		food.foodRes = foodRes;
		foodRes = null;
		food.z_index = 10;
		$Sprite2D.play('default')
		return food;
	else:
		return null;
