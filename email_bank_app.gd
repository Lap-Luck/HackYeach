extends TabContainer



func _ready() -> void:
	setup_buttons()
	if not Globals.intro:
		StoryManager.STORY_unhappy_customer("Joe","he","burger",StoryManager.Complain.GET_BETTER)
		StoryManager.STORY_day_end()
		StoryManager.STORY_unhappy_customer("Joe","he","burger",StoryManager.Complain.GOT_FINE)
		StoryManager.STORY_day_end()
		Globals.intro=true
	
	update_bank()
	update_mail()
	
func setup_buttons():
	for i in range($Emails2/Emails.get_child_count()):
		$"Emails2/Emails".get_child(i).get_node("Person says shit/email pfp").connect("pressed",func():
			select(i)
			)
	$Emails2/MainMail/VBoxContainer/ColorRect3/Button.connect("pressed",func(): resp(0))
	$Emails2/MainMail/VBoxContainer/ColorRect3/Button2.connect("pressed",func(): resp(1))

var curr_mail_responses_callback=[]

func resp(id):
	if id<curr_mail_responses_callback.size():
		curr_mail_responses_callback[id].call()
	print(id)
	update_bank()
	update_mail()


func select(r_id):
	var id=StoryManager.mails.size()-1-r_id
	for i in range($Emails2/Emails.get_child_count()):
			$Emails2/Emails.get_child(i).get_node("ColorRect").visible=false
	$Emails2/Emails.get_child(r_id).get_node("ColorRect").visible=true
	$Emails2/MainMail/VBoxContainer/ColorRect2/Label.text=StoryManager.mails[id].text
	$Emails2/MainMail/VBoxContainer/ColorRect3/Button.text="aaaa"
	#$Emails2/MainMail/VBoxContainer/ColorRect3/Button.disconnect("pressed",)
	curr_mail_responses_callback=[]
	if StoryManager.mails[id].responses.size()>0:
		$Emails2/MainMail/VBoxContainer/ColorRect3/Button.text=StoryManager.mails[id].responses[0]
		#$Emails2/MainMail/VBoxContainer/ColorRect3/Button.connect("pressed",func():print("run"))
		curr_mail_responses_callback=StoryManager.mails[id].responses_callback
	
	
func pad(text:String,size):
	while text.length()<size:
		text+=" "
	return text

func update_bank():
	var bank_text=""
	var saldo=0
	bank_text+=pad("Amount",18)+"| trasaction title"+"\n"
	for t:StoryManager.Transction in StoryManager.bank:
		bank_text+=pad(str(t.amount),18)+"|"+t.title+"\n"
		saldo+=t.amount
	bank_text+="\n"
	bank_text+="saldo:"+str(saldo)+"\n"
	$"Bank account/Label".text=bank_text

func update_mail():
	for m in $Emails2/Emails.get_children():
		m.visible=false
	for r_id in range(StoryManager.mails.size()):
		var id=StoryManager.mails.size()-1-r_id
		if r_id<=3:
			var mail:StoryManager.Mail=StoryManager.mails[id]
			$Emails2/Emails.get_child(r_id).visible=true
			$Emails2/Emails.get_child(r_id).get_node("Person says shit/Msg details/VBoxContainer/who").text=mail.from
			$Emails2/Emails.get_child(r_id).get_node("Person says shit/Msg details/VBoxContainer/when").text="Day "+str(mail.send_day)
	var bank_text=""
