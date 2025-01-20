extends Control

@onready var bplayer_life: ProgressBar = $player_life
@onready var player: CharacterBody2D = $"../player"
@onready var coinis: Label = $coinis

func _process(_delta: float) -> void:
	var life = player.life
	bplayer_life.value =  life
	var coins = Global.coins
	coinis.text = str(coins)
	
