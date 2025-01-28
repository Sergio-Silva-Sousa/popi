extends Area2D

@export var velocity:int =  1000
var direction:Vector2
var damage := 2
func set_direction(dir):
	direction = dir

func _physics_process(delta: float) -> void:
	position += velocity * delta * direction


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()


func _on_area_shape_entered(_area_rid: RID, _area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	queue_free()


func _on_body_entered(_body: Node2D) -> void:
	queue_free()
