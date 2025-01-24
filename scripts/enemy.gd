extends CharacterBody2D

@onready var player: CharacterBody2D = $"../player"
@onready var hibox_enemy: Area2D = $hibox_enemy
const SPEED = 300
var direction = 1
var life := 3
var damage:= 1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	direction = 1 if player.position.x > position.x else -1
	velocity.x = SPEED *  direction
	if life <= 0:
		queue_free()
	move_and_slide()
