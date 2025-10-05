extends Control
var sudden_change_1 :bool 
var sudden_change_2 : bool 
var Sanity = Globals.Sanity

func _ready() -> void:
	$Music.play()

func _process(delta: float) -> void:
	if sudden_change_1 == true:
		$Music.pitch_scale = lerp($Music.pitch_scale,1+ Sanity/100 , randi_range(0.1,0.9))
		if $Music.pitch_scale == 1+ Sanity/100:
			sudden_change_1 = false
			sudden_change_2 = true
	if sudden_change_2 == true:
		$Music.pitch_scale = lerp($Music.pitch_scale,Sanity/100,randi_range(0.1,0.9))
		if $Music.pitch_scale == Sanity/100:
			sudden_change_2 = false
	#else:	
		#$Music.pitch_scale = 100/Globals.Sanity
##	
