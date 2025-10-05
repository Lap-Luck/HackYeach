extends Node

var Settings = preload("res://scenes/settings.tscn")
var Sanity : int = 100;
var food: int = 100;
var intro=false

func reduce_sanity(amount: int):
	Sanity -= amount;
	Sanity = clamp(Sanity, 0, 100);
	print("Sanity: ", Sanity)
	if Sanity == 0:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func reduce_food(amount: int):
	food -= amount;
	food = clamp(food, 0, 100);
	print("Food: ", Sanity)
	if food == 0:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func reset():
	print("XXXXXXXXXXXX")
	Sanity = 100;
	food = 100;
	intro=false
	StoryManager.current_day=0
