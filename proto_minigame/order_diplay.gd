extends Node2D

class_name OrderDisplay

var food_id=-1
var foodDisplay: FoodDisplay;

var drink_id=-1
var drinkDisplay: FoodDisplay;

func display(node,cid):
	for c:Sprite2D in node.get_children():
		c.visible=false
	node.get_child(cid).visible=true

func undisplay(node):
	for c:Sprite2D in node.get_children():
		c.visible=false

func rand_id(node):
	return randi()%node.get_child_count()

func gen():
	#rand_id($popup)
	food_id=rand_id($food)
	drink_id=rand_id($drink)
	print("$$DISP")
	disp()
	
func disp():
	print("DISP")
	foodDisplay=null
	drinkDisplay=null
	undisplay($food)
	undisplay($drink)
	if food_id!=-1:
		display($food,food_id)
		foodDisplay = $food.get_child(food_id) as FoodDisplay
	if drink_id!=0:
		drinkDisplay = $drink.get_child(drink_id) as FoodDisplay
	display($drink,drink_id)
	
	
	var no_drink=drink_id==0
	var no_food=food_id==-1
	print(no_drink,no_food)
	display($popup,0 if no_drink else 1)
	
func _ready() -> void:
	gen()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		gen()
