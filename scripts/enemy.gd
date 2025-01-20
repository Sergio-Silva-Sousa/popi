extends CharacterBody2D

@onready var player: CharacterBody2D = $"../player"
@onready var label_life: Label = $l_life
@onready var phead: RayCast2D = $phead
@onready var hibox_enemy: Area2D = $hibox_enemy
const SPEED = 300
var direction = 1
var life:int = 3

func _physics_process(delta: float) -> void:
	if not is_on_floor() and !phead.is_colliding():
		velocity += get_gravity() * delta
	if phead.is_colliding():
		velocity.y = 0
	direction = 1 if player.position.x > position.x else -1
	velocity.x = SPEED *  direction
	label_life.text = str(life)
	if life <= 0:
		queue_free()
	move_and_slide()
