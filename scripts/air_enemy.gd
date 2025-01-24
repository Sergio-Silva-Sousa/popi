extends CharacterBody2D

enum State { IDLE, FLYING}
@onready var m_bullet: Marker2D = $m_bullet
@export var  bullet: PackedScene
@onready var player: CharacterBody2D = $"../player"
@onready var wall_detector: RayCast2D = $wall_detector
@export var speed:float = 200
@onready var t_shot: Timer = $t_shot
var current_state:State = State.FLYING
var life := 3
var damage := 5
var pos_start:int = 185
var pos_end :int =  1700
var direction:int = -1

func  _physics_process(delta: float) -> void:
	match current_state:
		State.IDLE:
			idle()
		State.FLYING:
			flying(delta)
	if life <= 0:
		queue_free()
	move_and_slide()


func idle() -> void:
	velocity.x = move_toward(velocity.x,0,speed )
	
	await  get_tree().create_timer(3).timeout
	change_state(State.FLYING)
func flying(_delta):
	velocity.x = speed * direction 
	position.y = move_toward(position.y,200,10)
	move()
	if t_shot.is_stopped():
		shooting()
			
func shooting():
	var ibullet = bullet.instantiate()
	ibullet.global_position = m_bullet.global_position
	add_sibling(ibullet)
	t_shot.start()
	
func move():
	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.scale.x *= -1	
		
func change_state(state:State):
	if state != current_state:
		current_state = state


		
	
	

		

	
