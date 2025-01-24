extends Area2D
@onready var player:CharacterBody2D = get_parent()
@onready var colision: CollisionShape2D = $colision
@onready var pcollider:CollisionShape2D= $"../collider"
@export var shild:PackedScene
@onready var m_shield: Marker2D = $"../m_shield"
func _ready() -> void:
	colision.global_position = pcollider.global_position 
	colision.shape.size = pcollider.shape.size + Vector2(0.1,0.1)
	


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		player.life -= 1
		call_deferred("ins_shield")
	if area.is_in_group("bullet_enemy"):
		player.life -= 5
		call_deferred("ins_shield")
		
func ins_shield():
	var ishield:StaticBody2D = shild.instantiate()
	ishield.position = m_shield.position
	add_child(ishield)
	
	
