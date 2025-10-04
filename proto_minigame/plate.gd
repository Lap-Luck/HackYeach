extends Area2D
class_name ClientPlate

var numberOfPeople=3

func sevrve(food:Food):
	print(food.foodRes.type)
	if food.foodRes.type=="Gfries" and $"../order_diplay".food_id==1:
		$"../Person_display".gen_person()
		$"../order_diplay".gen()
		print("OK")
		numberOfPeople-=1
		if !food.cooked:
			StoryManager.STORY_unhappy_customer("Jim","he","burger",StoryManager.Complain.GOT_FINE)
	
	if food.foodRes.type=="Ofries" and $"../order_diplay".food_id==0:
		$"../Person_display".gen_person()
		$"../order_diplay".gen()
		print("OK")
		numberOfPeople-=1
		if !food.cooked:
			StoryManager.STORY_unhappy_customer("Jim","he","burger",StoryManager.Complain.GOT_FINE)
	
	if numberOfPeople==0:
		StoryManager.STORY_day_end()
		get_tree().change_scene_to_file("res://scenes/home.tscn")
