extends Label

@onready var enemy = get_parent()

func _process(_delta: float) -> void:
	text = str(enemy.life)
