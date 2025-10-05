extends Node

class Mail:
	var text:String
	var from:String
	var responses:Array#[String]
	var responses_callback:Array#[Callable]
	var send_day:int
	
	func _init(_text,_from,_responses,_responses_callback,_send_day) -> void:
		self.text=_text
		self.from=_from
		self.responses=_responses
		self.responses_callback=_responses_callback
		self.send_day=_send_day

class Transction:
	var amount:int
	var title:String
	
	func _init(_amount,_title) -> void:
		self.amount=_amount
		self.title=_title

var mails:Array[Mail]
var bank:Array[Transction]
var fine:bool=false
var current_day=0


func my_replace(text:String,dict:Dictionary):
	for k in dict.keys():
		text=text.replace(k,dict[k])
	return text

enum Complain{GET_BETTER,GOT_FINE}

func STORY_unhappy_customer(name,he_she,food,complain:Complain):
	if complain==Complain.GET_BETTER:
		mails.append(Mail.new(
			my_replace("""
Hi,   
We got compain from NAME, HE_SHE got FOOD owercooked.
You shoud do better next time.

Joe Doe
The Best resaurant manager
			""",{"NAME":name,"HE_SHE":he_she,"FOOD":food}),
			"Joe.Doe@best.restaurant",
			[],[],current_day))
	if complain==Complain.GOT_FINE:
			fine=true
			mails.append(Mail.new(
			my_replace("""
Hi,   
Our copany got compain from NAME. HE_SHE got FOOD owercooked.
We are really disapoited with you. 
We had a meetting and decided we could decided you could keep a job 

Joe Doe
The Best resaurant manager
			""",{"NAME":name,"HE_SHE":he_she,"FOOD":food}),
			"Joe.Doe@best.restaurant",
			[],[],current_day))

func STORY_day_end():
	if not fine:
		bank.append(Transction.new(50,"job salary"))
	else:
		bank.append(Transction.new(25,"job salary dcreese due to working badly"))
	fine=false
	current_day+=1
	var go_to_work=Mail.new(
			my_replace("""
Hi,   
You still not on the job.
day DAY
Jon
			""",{"DAY":str(current_day)}),"Jon@friends",[],[],current_day)
	go_to_work.responses.append("GO WORK")
	go_to_work.responses_callback.append(func():
				StoryManager.mails.erase(go_to_work)
				get_tree().change_scene_to_file("res://proto_minigame/restaurant.tscn")
				)
	mails.append(go_to_work)

	
	
