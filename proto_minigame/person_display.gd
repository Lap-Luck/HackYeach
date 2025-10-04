extends Node2D

var person_id=-1

func display(node,cid):
	for c:Sprite2D in node.get_children():
		c.visible=false
	node.get_child(cid).visible=true

func rand_id(node):
	return randi()%node.get_child_count()

func gen_person():
	var cid=rand_id(self)
	person_id=cid
	display(self,cid)


	
func _ready() -> void:
	gen_person()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		gen_person()
