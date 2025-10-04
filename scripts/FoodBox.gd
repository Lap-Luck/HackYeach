extends Area2D

class_name FoodBox

@export var foodRes: FoodRes;

func get_food() -> Food:
	return Food.new(foodRes);
