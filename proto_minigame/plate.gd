extends Area2D
class_name ClientPlate

var numberOfPeople=3

var people = ["Alex", "Alex", "Andy"]

func sevrve(food: Food):
	if food.foodRes.type != ($"../order_diplay" as OrderDisplay).foodDisplay.foodRes.type or not food.cooked:
		StoryManager.STORY_unhappy_customer(people[randi() % people.size()],"who",food.foodRes.type ,StoryManager.Complain.GOT_FINE)
		print("Incorrect")
	else:
		print("Correct")
	$"../Person_display".gen_person()
	$"../order_diplay".gen()
	numberOfPeople-=1
	
	if numberOfPeople==0:
		StoryManager.STORY_day_end()
		get_tree().change_scene_to_file("res://scenes/home.tscn")
