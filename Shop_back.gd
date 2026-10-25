extends Button
var move = false

func _on_pressed() -> void:
	move=true

func _process(delta: float) -> void:
	if move==true:
		$"../Camera2D".position.x=lerpf($"../Camera2D".position.x,579,0.5)
		if $"../Camera2D".position.x==579:
			move=false
