extends StaticBody2D

@onready var collider: CollisionPolygon2D = $collider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var my_tween:Tween =  get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	my_tween.tween_property(collider,"scale",Vector2(10,10),0.1)
	my_tween.tween_callback(self.queue_free)
	
