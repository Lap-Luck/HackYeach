extends Node

var time=5.0
var p=Vector2i.ZERO
var op=Vector2i.ZERO

var mad=false




func _process(delta: float) -> void:
	if not mad and Globals.Sanity<80:
		OS.alert("going mad","Warrning")
		mad=true
	if Globals.Sanity<80:
		time+=delta
		if  int(time*3.0)%(Globals.Sanity/10+4)==2:
			p=get_viewport().get_mouse_position()
		elif  int(time*3.0)%(Globals.Sanity/10+4)==3:
			var new_p=get_viewport().get_mouse_position()
			get_viewport().warp_mouse(p)
			if OS.get_name()=="Linux":
				Input.warp_mouse(p)
				print("AAAA")
			#print(new_p-p)
			p=p-(new_p-p)/2

func _process2(delta: float) -> void:
	time+=delta
	
	if  int(time*2.0)%5==2:
		p=DisplayServer.mouse_get_position()-DisplayServer.window_get_position()
		
		var np=DisplayServer.mouse_get_position()-DisplayServer.window_get_position()
		np=op
	elif  int(time*2.0)%5==3:
		#pass
		#DisplayServer.warp_mouse(p)
		
		var np=DisplayServer.mouse_get_position()-DisplayServer.window_get_position()
		DisplayServer.warp_mouse(op*2-np)
		
	
