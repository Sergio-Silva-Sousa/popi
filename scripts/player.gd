extends CharacterBody2D

@onready var timer_shot: Timer = $cowndown_shot
@onready var timer_pogo: Timer = $cowndown_pogo
@onready var m_bullet: Marker2D = $ColorRect/m_bullet
@export var gun:Node

@onready var bullet = preload("res://scenes/bullet.tscn")
@export var  SPEED =  500.0
const pogo_force = -300.0
const JUMP_FORCE = -700.0
var joystick_direction:Vector2
var wasd_direction:Vector2
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
	if (joystick_direction.length() > 0.1  or wasd_direction) and timer_shot.is_stopped():
		shot()
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	wasd_gun()
	joystick_gun()
	move_and_slide()
func joystick_gun():
	joystick_direction = Vector2(Input.get_joy_axis(0,JOY_AXIS_RIGHT_X),Input.get_joy_axis(0,JOY_AXIS_RIGHT_Y))
	
	if joystick_direction.length() > 0.1:
		joystick_direction = joystick_direction.normalized()
		var  angle = atan2(joystick_direction.y,joystick_direction.x)
		gun.rotation = angle
	else:
		joystick_direction = Vector2.ZERO
func  wasd_gun():
	wasd_direction = Vector2.ZERO
	wasd_direction.x = Input.get_axis("shot_left","shot_right")
	wasd_direction.y = Input.get_axis("shot_up","shot_down")
	
	var  angle = atan2(wasd_direction.y,wasd_direction.x)
	gun.rotation = angle


func shot():
	var ibullet:Area2D= bullet.instantiate()
	ibullet.global_position = m_bullet.global_position
	if joystick_direction:
		ibullet.set_direction(joystick_direction)
	elif wasd_direction:
		ibullet.set_direction(wasd_direction)
	print(joystick_direction, wasd_direction)
	add_sibling(ibullet)
	timer_shot.start()
	
	
	
func pogo():
	velocity.y = pogo_force
	timer_pogo.start()
