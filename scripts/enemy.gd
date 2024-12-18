extends CharacterBody2D

@onready var player: CharacterBody2D = $"../player"

const SPEED = 300
var direction = 1

func _physics_process(delta: float) -> void:
	direction = 1 if player.position.x > position.x else -1
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = SPEED *  direction
	move_and_slide()
