extends Node2D

@export var spawn_right: Marker2D 
@onready var enemy: = preload("res://scenes/enemy.tscn")
@export var spawn_left: Marker2D 
@export var player:CharacterBody2D
var p_spawn = 0

func _process(_delta: float) -> void:
	if player.life <= 0:
		get_tree().reload_current_scene()
		Global.save_coin(Global.coins)    
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
func spawn_enemy_left():
	var ienemy = enemy.instantiate()
	ienemy.global_position = spawn_left.global_position
	add_child(ienemy)
func spawn_enemy_right():
	var ienemy = enemy.instantiate()
	ienemy.global_position = spawn_right.global_position
	add_child(ienemy)
	
func _on_timer_timeout() -> void:
	if p_spawn > 0:
		spawn_enemy_right()
	elif  p_spawn < 0:
		spawn_enemy_left()
	else:
		spawn_enemy_left()
		spawn_enemy_right()
	p_spawn = randi() % 3 -1 


func _on_child_exiting_tree(node: Node) -> void:
	if node.is_in_group("enemy"):
		if node.life == 0:
			print((Global.coins))
			Global.coins += 1
		


	 
	
	 
