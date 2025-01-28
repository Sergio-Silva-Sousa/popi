extends Node2D

@export var spawn_right: Marker2D 
@export var enemy: PackedScene
@export var air_enemy: PackedScene
@export var spawn_left: Marker2D 
@export var player:CharacterBody2D
@export var spawn_air_left: Marker2D 
@export var spawn_air_right: Marker2D
var controller_round := 1 
var  wave :=1
#Controller spawn enemy
var numbers :=  [0,1,2,3,4,5]
var weights := [50,50,30,10,10,5]

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

func spawn_air_enemy_left():
	var ienemy = air_enemy.instantiate()
	ienemy.global_position = spawn_air_left.global_position
	add_child(ienemy)
func spawn_air_enemy_right():
	var ienemy = air_enemy.instantiate()
	ienemy.global_position = spawn_air_right.global_position
	add_child(ienemy)
	
func _on_timer_timeout() -> void:
	var number = chose_number(numbers,weights)
	match number:
		0:
			spawn_enemy_left()
		1:
			spawn_enemy_right()
		2:
			spawn_enemy_right()
			spawn_enemy_left()
		3:
			spawn_air_enemy_left()
		4:
			spawn_air_enemy_right()
		5:
			spawn_air_enemy_left()
			spawn_air_enemy_right()
		
	


func _on_child_exiting_tree(node: Node) -> void:
	if node.is_in_group("enemy"):
		if node.life == 0:
			print((Global.coins))
			Global.coins += 1
		
func chose_number(cnumbers:Array,cweights:Array):
	var total_weights = 0
	
	for weight in cweights:
		total_weights += weight
	
	var pick = randi_range(0,total_weights)
	
	var accumulated = 0
	
	for i in range(cnumbers.size()):
		accumulated += cweights[i]
		
		if pick <= accumulated:
			return cnumbers[i]
	 
func controller_wave():
	pass
