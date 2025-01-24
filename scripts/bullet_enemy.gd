extends Area2D
@onready var player: CharacterBody2D = $"../player"

@export var velocity:float = 1000
var direction
func _ready() -> void:
	direction = (player.global_position - global_position).normalized()
func _physics_process(delta: float) -> void:

	position += direction * velocity * delta
	

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
	


func _on_area_shape_entered(_area_rid: RID, _area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	queue_free()

func _on_body_entered(_body: Node2D) -> void:
	queue_free()
