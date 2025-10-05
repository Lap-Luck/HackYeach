extends Node2D

var person_id=-1

func display(node,cid):
	person_id=cid
	for c:AnimatedSprite2D in node.get_children():
		c.visible=false
	node.get_child(cid).visible=true
	node.get_child(cid).get_child(0).visible=false
	node.get_child(cid).play("evil" if Globals.Sanity < 80 else "default")

func angry():
	get_child(person_id).get_child(0).visible=true

func undisplay():
	for c:AnimatedSprite2D in self.get_children():
		c.visible=false

func rand_id(node,forbiden):
	var nid=forbiden
	while nid==forbiden:
		nid=randi()%node.get_child_count()
	return nid

func gen_person():
	var cid=rand_id(self,self.person_id)
	person_id=cid
	display(self,cid)


	
func _ready() -> void:
	gen_person()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		gen_person()
