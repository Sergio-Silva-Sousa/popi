extends CharacterBody2D

@onready var player: CharacterBody2D = $"../player"
@onready var label_life: Label = $l_life

const SPEED = 300
var direction = 1
var life:int = 3
func _physics_process(delta: float) -> void:
	direction = 1 if player.position.x > position.x else -1
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = SPEED *  direction
	label_life.text = str(life)
	if life <= 0:
		queue_free()
	move_and_slide()
