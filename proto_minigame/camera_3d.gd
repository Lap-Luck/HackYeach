extends Camera3D

var holding=null
var dist=1.0

func _process(delta: float) -> void:
	if holding==null:
		var p:Vector3=project_ray_origin(get_viewport().get_mouse_position())
		var dir=project_ray_normal(get_viewport().get_mouse_position())
		
		$"../RayCast3D".global_position=p
		$"../RayCast3D".target_position=dir*10000.0
		$"../RayCast3D".force_raycast_update()
		var col=$"../RayCast3D".get_collider()
		if Input.is_action_just_pressed("ui_down"):
			
			if col is RigidBody3D:
				print(col.name)
				holding=col
				var obj:RigidBody3D=holding
				dist=(p-obj.global_position).length()
	else:
		var p=project_ray_origin(get_viewport().get_mouse_position())
		var dir=project_ray_normal(get_viewport().get_mouse_position())
		var obj:RigidBody3D=holding
		obj.global_position=p+dir*dist
		obj.linear_velocity=Vector3.ZERO
		if Input.is_action_just_pressed("ui_up"):
			holding=null
