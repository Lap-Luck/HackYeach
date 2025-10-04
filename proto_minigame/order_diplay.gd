extends Node2D

func display(node,cid):
	for c:Sprite2D in node.get_children():
		c.visible=false
	node.get_child(cid).visible=true

func rand_id(node):
	return randi()%node.get_child_count()

func gen():
	#rand_id($popup)
	var food_id=rand_id($food)
	var drink_id=rand_id($drink)
	
	display($food,food_id)
	display($drink,drink_id)
	
	var no_drink=drink_id==0

	display($popup,0 if no_drink else 1)
	
func _ready() -> void:
	gen()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		gen()
