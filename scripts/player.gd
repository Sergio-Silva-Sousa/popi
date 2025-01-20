extends CharacterBody2D

@onready var timer_shot: Timer = $cowndown_shot
@onready var timer_pogo: Timer = $cowndown_pogo
@onready var m_bullet: Marker2D = $m_bullet

@onready var bullet = preload("res://scenes/bullet.tscn")
@export var  SPEED =  500.0
const pogo_force = -300.0
const JUMP_FORCE = -700.0
var life:int = 100
var flife:int = 100
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if timer_shot.is_stopped():
		if Input.is_action_pressed("shot_left"):
			m_bullet.position  = Vector2i(-25,1)
			shot()
		elif  Input.is_action_pressed("shot_right"):
			m_bullet.position  = Vector2i(24,1)
			shot()
		elif Input.is_action_pressed("shot_up"):
			m_bullet.position = Vector2i(0,-17)
			shot()
		elif  Input.is_action_pressed("shot_down"):
			m_bullet.position = Vector2i(0,17)	
			shot()
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	position.x = clamp(position.x,20,1875)

	move_and_slide()

func shot():
	var ibullet:Area2D= bullet.instantiate()
	add_sibling(ibullet)
	ibullet.global_position = m_bullet.global_position
	if m_bullet.position.x >0:
		ibullet.set_direction(1,0)
	elif m_bullet.position.x < 0:
		ibullet.set_direction(-1,0)
	elif m_bullet.position.y < 0:
		ibullet.set_direction(0,-1)
	elif m_bullet.position.y > 0:
		if timer_pogo.is_stopped():
			pogo()
		ibullet.set_direction(0,1)
	timer_shot.start()
	
func pogo():
	velocity.y = pogo_force
	timer_pogo.start()
