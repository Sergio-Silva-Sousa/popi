extends Node2D

@onready var spawn_left: Marker2D = $spawn_left
@onready var enemy = preload("res://scenes/enemy.tscn")
@onready var spawn_right: Marker2D = $spawn_right
var p_spawn = 0
func spawn_enemy_left():
	var ienemy = enemy.instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
	ienemy.global_position = spawn_left.global_position
	add_child(ienemy)
func spawn_enemy_right():
	var ienemy = enemy.instantiate(PackedScene.GEN_EDIT_STATE_MAIN)
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
