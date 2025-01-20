extends Node

var coins = 0
func _ready() -> void:
	get_tree().set_auto_accept_quit(false)
	coins = load_coins()
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		save_coin(coins)
		get_tree().quit()
	
		
func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save_coin(coins)
		get_tree().quit()


func save_coin(value):
	var save_dict = {"Coins":value}
	var json_data = JSON.stringify(save_dict)
	var save_file = FileAccess.open("user://save.json",FileAccess.WRITE)
	save_file.store_line(json_data)
	save_file.close()
	print("Sucesso")

func load_coins():
		var load_file = FileAccess.open("user://save.json",FileAccess.READ)
		var json_data = load_file.get_as_text()
		var data  = JSON.parse_string(json_data)
		return data["Coins"]
		

	
