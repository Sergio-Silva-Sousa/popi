extends Control

@onready var bplayer_life: ProgressBar = $AspectRatioContainer/player_life
@onready var player: CharacterBody2D = $"../../player"
@onready var coinis: Label = $AspectRatioContainer/coinis
@onready var real_values: Label = $AspectRatioContainer/real_values

func _process(_delta: float) -> void:
	var life = player.life
	var flife = player.full_life
	var coins = Global.coins
	var real :String
	var lost_life = calculate_loss(flife,life)
	bplayer_life.value =  life
	bplayer_life.max_value = flife
	coinis.text = str(coins)  
	
	real = str(life,"/",flife,"(%d" % lost_life,"%)")	
	
	real_values.text = real
	
func calculate_loss(flife:float,life:float) -> int:
	var loss:float = 100 - ((flife-life) / flife * 100)
	return loss
	
	

	

	
