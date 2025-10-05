extends Area2D
class_name ClientPlate

var numberOfPeople=3

var people = ["Alex", "Alex", "Andy"]

var get_drink=false
var get_food=false

var amount_reviced_by_cutomer=0

var delay=10.0
var leave=false

var ok=true

func sevrve(food: Food):
	var goal=[]
	if ($"../order_diplay" as OrderDisplay).food_id!=-1:
		goal+=[($"../order_diplay" as OrderDisplay).foodDisplay.foodRes.type]
	if ($"../order_diplay" as OrderDisplay).drink_id!=0:
		goal+=[ ($"../order_diplay" as OrderDisplay).drinkDisplay.foodRes.type ]
	
	if !(food.foodRes.type in goal) or not food.cooked:
		print("Incorrect")
		StoryManager.STORY_unhappy_customer(people[randi() % people.size()],"who",food.foodRes.type ,StoryManager.Complain.GOT_FINE)
		Globals.reduce_sanity(10);
		ok=false
	else:
		print("Correct")
		if goal.size()>1:
			if ($"../order_diplay" as OrderDisplay).foodDisplay.foodRes.type==food.foodRes.type:
				($"../order_diplay" as OrderDisplay).food_id=-1
				amount_reviced_by_cutomer-=1
				print("FFF")
			if ($"../order_diplay" as OrderDisplay).drinkDisplay.foodRes.type==food.foodRes.type:
				($"../order_diplay" as OrderDisplay).drink_id=0
				amount_reviced_by_cutomer-=1
				print("DDDD")
			($"../order_diplay" as OrderDisplay).disp()
	amount_reviced_by_cutomer+=1
	
	if amount_reviced_by_cutomer>=goal.size():
		#for bugs
		leave=true
		delay=0.5
		if ok:
			$"../Person_display".undisplay()
		else:
			ok=true
			$"../Person_display".angry()
		
func _process(delta: float) -> void:
	delay-=delta
	if leave and delay<0.0:
		leave=false
		$"../Person_display".gen_person()
		$"../order_diplay".gen()
		get_drink=false
		get_food=false
		Globals.reduce_sanity(10);
		numberOfPeople-=1
		amount_reviced_by_cutomer=0
		
		if numberOfPeople==0:
			StoryManager.STORY_day_end()
			if Globals.Sanity > 0:
				get_tree().change_scene_to_file("res://scenes/home.tscn")
