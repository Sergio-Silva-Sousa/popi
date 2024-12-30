extends Area2D

@onready var enemy:CharacterBody2D = get_parent()
@onready var colision: CollisionShape2D = $colision
@onready var icollider:CollisionShape2D= $"../collider"
func _ready() -> void:
	colision.global_position = icollider.global_position
	colision.shape.size = icollider.shape.size
	

	


func _on_area_shape_entered(_area_rid: RID, area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	if area.is_in_group("bullet"):
		get_parent().life -= 1	
