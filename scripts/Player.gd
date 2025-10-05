extends Node2D

var picked_obj: Node2D = null;

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("LMB"):
		handleLMB();
	elif event.is_action_pressed("RMB"):
		if picked_obj:
			picked_obj.queue_free();
			picked_obj = null;
	
func handleLMB():
	var mouse_pos := get_global_mouse_position();
	var space_state := get_world_2d().direct_space_state;
	var params := PhysicsPointQueryParameters2D.new()
	params.position = mouse_pos
	params.collide_with_bodies = true
	params.collide_with_areas = true
	params.collision_mask = 0xFFFFFFFF
	
	var results : Array = space_state.intersect_point(params, 32);
	var foodBoxesDict := results.filter(func (res: Dictionary): return res["collider"] is FoodBox);
	var foodBoxes := foodBoxesDict.map(func (res: Dictionary): return res["collider"])
	var cookersDict := results.filter(func (res: Dictionary): return res["collider"] is Cooker);
	var cookers := cookersDict.map(func (res: Dictionary): return res["collider"])
	var platesDict := results.filter(func (res: Dictionary): return res["collider"] is ClientPlate);
	var plates := platesDict.map(func (res: Dictionary): return res["collider"])
	
	if foodBoxes.size() != 0:
		if not picked_obj:
			var foodBox := foodBoxes[0] as FoodBox;
			picked_obj = foodBox.get_food();
			add_child(picked_obj);
		else:
			print("Cannot pick, object in hand");
	elif cookers.size() != 0:
		var cooker := cookers[0] as Cooker;
		if picked_obj:
			if picked_obj is Food:
				if cooker.foodRes == null:
					if cooker.put_food((picked_obj as Food).foodRes):
						if not (picked_obj as Food).cooked:
							picked_obj.queue_free();
							picked_obj = null;
						else:
							print("Cannot put, already cooked")
					else:
						print("Cannot put, is not a food");
				else:
					print("Cannot put, Cooker full")
			else:
				print("Cannot put, no object in hand");
		else:
			if not picked_obj:
				picked_obj = cooker.get_food();
				if picked_obj:
					add_child(picked_obj)
			else:
				print("Cannot pick, object in hand");
	elif plates.size() !=0:
		if picked_obj:
			var plate := plates[0] as ClientPlate
			plate.sevrve(picked_obj as Food)
		
			picked_obj.queue_free();
			picked_obj = null;
